<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Entity\Header;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    private $manager;
    public function __construct(EntityManagerInterface $manager)
    {
        $this->manager=$manager;
    }

    #[Route('/', name: 'home')]
    public function index(): Response
    {
        $product=$this->manager->getRepository(Product::class)->findByIsBest(1);
        $header=$this->manager->getRepository(Header::class)->findAll();
        return $this->render('home/index.html.twig',[
            'product'=>$product,
            'header'=>$header
        ]);
    }
}
