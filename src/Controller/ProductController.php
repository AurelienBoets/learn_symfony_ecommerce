<?php

namespace App\Controller;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    private $manager;
    public function __construct(EntityManagerInterface $manager)
    {
        $this->manager=$manager;
    }
    #[Route('/produits', name: 'product')]
    public function index(): Response
    {
        $product=$this->manager->getRepository(Product::class)->findAll();

        return $this->render('product/index.html.twig',[
            "product"=>$product
        ]);
    }
}
