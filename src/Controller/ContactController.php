<?php

namespace App\Controller;

use App\Cryptage\Chiffre;
use App\Entity\Message;
use App\Entity\User;
use App\Form\ContactType;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Mapping\Id;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/contact", name="contact")
     */
    public function index(Request $request): Response
    {
        $admin = $this->entityManager->getRepository(User::class)->findOneById(15);
        $contact = new Message();
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()){       
            //Cryptage
            $ch = new Chiffre();
            $encrypt = $ch->enchiffre($form->getData()->getMessage()); 
            $contact->setUser($this->getUser())
                    ->setMessage($encrypt);
            $this->entityManager->persist($contact);
            $this->entityManager->flush();
            return $this->redirectToRoute('account');
        }
        return $this->render('contact/index.html.twig', [
            'form' => $form->createView(),
            'Admin' => $admin
        ]);
    }
}
