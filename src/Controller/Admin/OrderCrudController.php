<?php

namespace App\Controller\Admin;

use App\Entity\Order;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TelephoneField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class OrderCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Order::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions
            ->add('index', 'detail');
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            DateField::new('createdAt', 'Passé le')->hideOnForm(),
            TextField::new('user.fullname', 'Clients'),
            TextField::new('user.email', 'E-mail'),
            TelephoneField::new('user.phone', 'Téléphones'),
            ArrayField::new('orderDetails', 'Produits achetés')->hideOnIndex()->hideOnForm(),
            TextField::new('carriername', 'Transports')->hideOnDetail(),
            MoneyField::new('carrierprice', 'Frais de transport')->setCurrency('MGA')->hideOnIndex(),
            MoneyField::new('total', 'Sommes à payer')->setCurrency('MGA')->hideOnForm(),
            BooleanField::new('isPaid', 'Payée')
        ];
    }

}
