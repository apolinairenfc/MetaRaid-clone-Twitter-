# METARAID (Tweet Academie — clone Twitter)
Projet web PHP (MVC simple) avec MySQL, realise dans le cadre de Web@academie by Epitech — fevrier 2025.
Equipe de 4 (duree : 1 mois) — chef d'equipe. Role : full-stack, avec une forte implication sur le back-end.
Objectif : recreer un reseau social type Twitter, le plus proche possible en termes de fonctionnalites et de comportement, avec une base de donnees relationnelle et une interface responsive.

## Objectifs pedagogiques (Tweet Academie)
- Construire une application web complete en PHP / HTML-CSS / JS avec base de donnees relationnelle
- Travailler des notions cles : Ajax, micro-framework CSS + grille responsive (affichage multi-colonnes desktop / 1 colonne mobile)
- Concevoir et partager un schema relationnel puis utiliser une DB commune a toute la promotion (fichier SQL commun a la racine)
- Travailler en groupe : decoupage des taches, communication, gestion de projet, livrable "beton" dans un temps limite

## Fonctionnalites
- Authentification et inscription
- Timeline avec retweets et medias
- Profils utilisateur + abonnements
- Recherche utilisateurs/tweets
- Messagerie privee

## Pre-requis
- PHP 8+
- MySQL/MariaDB

## Lancer avec Docker (recommande)
1) Construire et demarrer
```
docker compose up --build
```

2) Ouvrir l'application
```
http://localhost:8000
```

La base est initialisee automatiquement depuis `Config/twitter.sql`.
Identifiants DB par defaut: `twitter` / `twitter` (root: `root`).

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
