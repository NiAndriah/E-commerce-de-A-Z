<?php

namespace App\Controller;

use App\Classe\Search;
use App\Entity\Comment;
use App\Entity\Product;
use App\Form\SearchType;
use App\Cryptage\Chiffre;
use App\Form\CommentType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ProductController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/nos-produits", name="products")
     */
    public function index(Request $request): Response
    {

        $comments = $this->entityManager->getRepository(Comment::class)->findAll();
        
        $comment = new Comment();
        $formComment = $this->createForm(CommentType::class, $comment);

        $formComment->handleRequest($request);

        if ($formComment->isSubmitted() && $formComment->isValid())
        {
            $Ch = new Chiffre();
            $encrypt = $Ch->enchiffre($formComment->getData()->getContent());          
            $comment->setUser($this->getUser())
                    ->setContent($encrypt)
                    ->setCreatedAt(new \DateTime());
            $this->entityManager->persist($comment);
            $this->entityManager->flush();
            return $this->redirectToRoute('products');
        }

        $search = new Search();
        $form = $this->createForm(SearchType:: class, $search);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()){
            $products = $this->entityManager->getRepository(Product:: class)->findWithSearch($search);
        }
        else {
            $products = $this->entityManager->getRepository(Product:: class)->findAll();
        }
        return $this->render('product/index.html.twig', [
            'products' => $products,
            'form' => $form->createView(),
            'formComment' => $formComment->createView(),
            'comments' => $comments
        ]);
    }

    /**
     * @Route("/produit/{slug}", name="product")
     */
    public function show($slug, Request $request): Response
    {
        $product = $this->entityManager->getRepository(Product:: class)->findOneBySlug($slug);

        if (!$product){
            return $this->redirectToRoute('products');
        }

        return $this->render('product/show.html.twig', [
            'product' => $product
        ]);
    }
}
