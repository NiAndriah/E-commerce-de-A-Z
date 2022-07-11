# E-commerce
Ce projet run avec la version PHP 7.4.9 ou plus.
La base de donnée se trouve dans le dossier .BD MySQL.
Installer composer.
Ouvrir le terminal: cd vers le dossier "E-commerce-de-A-Z" et lancer les commandes suivants:
>Composer req
>Lancer Wampserver où vous avez importer la base de donnée
>php bin/console doctrine:migrations:migrate 'pour mettre à jour la base de donnée'
>php bin/console server:run
ou Installer CLI (Symfony)
>symfony server:start
