<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class StaticContentController extends AbstractController
{
    #[Route('/legal', name: "legal")]
    public function login(): Response
    {
        return $this->render('legal/notice.html.twig');
    }
}