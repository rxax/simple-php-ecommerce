<?php

namespace App\Controller;

use App\Model\Cart;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class CartController extends AbstractController
{
    /**
     * Retrieves a detailed cart containing Product objects and quantity/price totals
     * 
     * @param Cart $cart
     * @return Response
     */
    #[Route('/my-cart', name: 'cart')]
    public function index(Cart $cart): Response
    {
        $cartProducts = $cart->getDetails();

        return $this->render('cart/index.html.twig', [
            'cart' => $cartProducts['products'],
            'totalQuantity' => $cartProducts['totals']['quantity'],
            'totalPrice' =>$cartProducts['totals']['price']
        ]);
    }

    /**
     * Adds an item to the cart (product id) and increments quantity (see Cart class)
     * @param Cart $cart
     * @param int $id
     * @return Response
     */
    #[Route('/cart/add/{id}', name: 'add_to_cart')]
    public function add(Cart $cart, int $id): Response
    {
        $cart->add($id);
        return $this->redirectToRoute('cart');
    }

    /**
     * Decreases by 1 the quantity for an item in the cart
     * @param Cart $cart
     * @param int $id
     * @return Response
     */
    #[Route('/cart/decrease/{id}', name: 'decrease_item')]
    public function decrease(Cart $cart, int $id): Response
    {
        $cart->decreaseItem($id);
        return $this->redirectToRoute('cart');
    }
    
    /**
     * Removes a row of items from the cart
     *
     * @param Cart $cart
     * @return Response
     */
    #[Route('/cart/remove/{id}', name: 'remove_cart_item')]
    public function removeItem(Cart $cart, int $id): Response
    {
        $cart->removeItem($id);
        return $this->redirectToRoute('cart');
    }

    /**
     * Empties the cart entirely
     *
     * @param Cart $cart
     * @return Response
     */
    #[Route('/cart/clear', name: 'remove_cart')]
    public function remove(Cart $cart): Response
    {
        $cart->remove();
        return $this->redirectToRoute('product');
    }
}
