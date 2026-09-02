<?php

namespace App\Controller;

use App\Entity\Order;
use App\Model\Cart;
use App\Repository\OrderRepository;
use App\Service\Mail;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Checkout\Session;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class PaymentController extends AbstractController
{

    #[Route('/order/checkout/{reference}', name: 'checkout')]
    public function payment(OrderRepository $repository, $reference, EntityManagerInterface $em): Response
    {
        // Retrieve products of the last order and format in an array for Stripe
        $order = $repository->findOneByReference($reference);
        if (!$order) {
            throw $this->createNotFoundException('This order does not exist');
        }
        $products = $order->getOrderDetails()->getValues();
        $productsForStripe = [];
        foreach ($products as $item) {
            $productsForStripe[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'unit_amount' => $item->getPrice(),
                    'product_data' => [
                        'name' => $item->getProduct()
                    ]
                ],
                'quantity' => $item->getQuantity()
            ];
        }
        // Add shipping fee
        $productsForStripe[] = [
            'price_data' => [
                'currency' => 'eur',
                'unit_amount' => $order->getCarrierPrice(),
                'product_data' => [
                    'name' => $order->getCarrierName()
                ]
            ],
            'quantity' => 1
        ];
        Stripe::setApiKey('sk_test_51Kb6uhClAQQ2TXfzOspWIks7VFbXX5e5ZTr5c4VCIQfNJATKvQZDHBODlaDkCnNmYntKUQLZK8YF4UbNPA5gMWzg00RHLAzE0G');
        header('Content-Type: application/json');

        $YOUR_DOMAIN = 'https://ecommerce.tristan-bonnal.fr';
        
        // Create Stripe session with cart data
        $checkout_session = Session::create([
            'line_items' => $productsForStripe,
            'mode' => 'payment',
            'success_url' => $YOUR_DOMAIN . '/order/success/{CHECKOUT_SESSION_ID}',
            'cancel_url' => $YOUR_DOMAIN . '/order/fail/{CHECKOUT_SESSION_ID}',
        ]);
        $order->setStripeSession($checkout_session->id);
        $em->flush();
        return $this->redirect($checkout_session->url);
    }



    /**
     * Method called when payment is validated
     */
    #[Route('/order/success/{stripeSession}', name: 'payment_success')]
    public function paymentSuccess(OrderRepository $repository, $stripeSession, EntityManagerInterface $em, Cart $cart) 
    {
        $order = $repository->findOneByStripeSession($stripeSession);
        if (!$order || $order->getUser() != $this->getUser()) {
            throw $this->createNotFoundException('Order inaccessible');
        }
        if (!$order->getState()) {
            $order->setState(1);
            $em->flush();
        }

        // Send Confirmation email
        $user = $this->getUser();

        $content = "Hello {$user->getFirstName()}, thank you for your order.";
        (new Mail)->send(
            $user->getEmail(), 
            $user->getFirstName(), 
            "Confirmation of order {$order->getReference()}", 
            $content
        );

        // Delete cart once order is validated
        $cart->remove();    
        return $this->render('payment/success.html.twig', [
            'order' => $order
        ]);
    }

    /**
     * Order cancelled (user clicked back in the window)
     */
    #[Route('/order/fail/{stripeSession}', name: 'payment_fail')]
    public function paymentFail(OrderRepository $repository, $stripeSession) 
    {
        $order = $repository->findOneByStripeSession($stripeSession);
        if (!$order || $order->getUser() != $this->getUser()) {
            throw $this->createNotFoundException('Order inaccessible');
        }

        return $this->render('payment/fail.html.twig', [
            'order' => $order
        ]);
    }
}
