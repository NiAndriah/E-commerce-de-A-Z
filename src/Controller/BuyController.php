<?php

namespace App\Controller;

use App\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class BuyController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/buy", name="buy")
     */
    public function index(): Response
    {
        $agence =  $this->entityManager->getRepository(User::class)->findOneById(15);
        return $this->render('buy/index.html.twig', [
            'agence' => $agence
        ]);
    }
}
