<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\OrderDetails;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderDetailsController extends AbstractController
{

    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/commande/{id}", name="account_orderDetails")
     */
    public function index(Order $id): Response
    {
        $orderDetails = $this->entityManager->getRepository(OrderDetails::class)->findSuccessOrders($id);        
        return $this->render('account/orderDetails.html.twig', [
            'orderDetails' => $orderDetails
        ]);
    }
}
