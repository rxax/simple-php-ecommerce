<?php

namespace App\Controller;

use App\Repository\HeadersRepository;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(ProductRepository $productRepository, HeadersRepository $headersRepository): Response
    {
        $products = $productRepository->findByIsInHome(1);
        $headers = $headersRepository->findAll();
        return $this->render('home/index.html.twig', [
            'carousel' => true,  // The carousel is only displayed on the homepage (see base.twig)
            'top_products' => $products,
            'headers' => $headers
        ]);
    }

    #[Route('/about', name: 'about')]
    public function about(): Response
    {
        return $this->render('home/about.html.twig');
    }
}
