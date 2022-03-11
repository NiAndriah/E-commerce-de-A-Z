<?php

namespace App\Controller\Admin;

use App\Entity\Message;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\EmailField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TelephoneField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;

class MessageCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Message::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions
               ->add('index', 'detail'); 
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('user.fullname', 'Noms d\'utilisateurs'),
            EmailField::new('user.email', 'E-mail'),
            TelephoneField::new('phone', 'Téléphones'),      
            TextareaField::new('textcl', 'Messages')
        ];
    }
}
