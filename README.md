# NxggaChain (Twitter clone)

Mini clone de Twitter en PHP (MVC simple) avec timeline, profils, recherche et messagerie.

## Fonctionnalites
- Authentification et inscription
- Timeline avec retweets et medias
- Profils utilisateur + abonnements
- Recherche utilisateurs/tweets
- Messagerie privee

## Pre-requis
- PHP 8+
- MySQL/MariaDB

## Installation rapide
1) Creer la base
```
mysql -u root -p < Config/twitter.sql
```

2) Configurer les variables d'environnement (voir `.env.example`)
```
cp .env.example .env
```
Puis editer `.env` avec vos identifiants.

3) Lancer le serveur local
```
php -S localhost:8000
```
Puis ouvrir `http://localhost:8000`.

## Variables d'environnement
- `DB_HOST`
- `DB_NAME`
- `DB_USER`
- `DB_PASSWORD`

## Compte de demo
Utilise : `test@test.fr` / `password`.

## Structure
- `Controllers/` logique applicative
- `Models/` acces base de donnees
- `Views/` templates
- `Config/` configuration et schema SQL
- `Assets/` images et scripts front

## Notes
- Les medias uploadees sont stockees dans `Assets/MediaTweets/`.
- Pour un usage public, pensez a ajouter une vraie gestion d'erreurs et de validation.
