# Blog API

API REST basique pour gérer des articles de blog (CRUD + recherche).

**Statut:** Prêt — code d'exemple minimal en Node.js + Express + MySQL.

**Sommaire**
- Présentation
- Prérequis
- Installation
- Configuration
- Base de données
- Endpoints API
- Développement
- Dépendances

## Présentation

Ce projet fournit une petite API pour créer, lire, mettre à jour, supprimer et rechercher des articles. L'API utilise Express pour le serveur HTTP et MySQL (via `mysql2/promise`) pour la persistance.

Le code principal se trouve dans la racine du projet et les dossiers suivants:
- `config/` : configuration de la connexion MySQL
- `routes/` : définitions des routes (ex. `routes/articleRoutes.js`)
- `controllers/` : logique des endpoints
- `models/` : accès à la base de données

## Prérequis

- Node.js 18+ (ou une version compatible ES modules)
- MySQL (serveur) 5.7+ (8+ est préférable)

## Installation

1. Cloner le dépôt
```bash
git clone https://github.com/noubao/blog-api
``` 

2. Installer les dépendances

```bash
npm install
```

3. Créer la base de données et les tables en important `db.sql` dans votre serveur MySQL :

```sql
-- importez le fichier db.sql fourni (par ex. via MySQL Workbench ou la CLI)
```

## Configuration

Copiez un fichier `.env` à la racine et définissez les variables suivantes :

- `DB_HOST` — hôte MySQL (ex. `localhost`)
- `DB_USER` — utilisateur MySQL
- `DB_PASSWORD` — mot de passe
- `DB_NAME` — nom de la base (par défaut utilisé dans `db.sql` : `blog_db`)

Exemple minimal de `.env`:

```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=secret
DB_NAME=blog_db
```

La connexion est gérée dans `config/db.js`.

## Base de données

Un fichier SQL prêt à l'emploi est fourni : `db.sql`. Il :
- Crée la base `blog_db` (si nécessaire)
- Crée la table `articles`
- Insère quelques articles de démonstration

## Endpoints API

Base path: `/api/articles`

- `GET /api/articles` — Récupère la liste des articles (filtres query: `category`, `author`, `date`)
- `GET /api/articles/:id` — Récupère un article par `id`
- `POST /api/articles` — Crée un article (body JSON : `title`, `content`, `author`, `category?`, `tags?`)
- `PUT /api/articles/:id` — Met à jour un article
- `DELETE /api/articles/:id` — Supprime un article
- `GET /api/articles/search?query=...` — Recherche dans le titre et le contenu

Exemples curl :

Créer un article :

```bash
curl -X POST http://localhost:3000/api/articles \
	-H "Content-Type: application/json" \
	-d '{"title":"Titre","content":"Contenu","author":"Auteur"}'
```

Récupérer tous les articles :

```bash
curl http://localhost:3000/api/articles
```

Rechercher :

```bash
curl "http://localhost:3000/api/articles/search?query=express"
```

## Démarrage

Lancer le serveur (exécution directe) :

```bash
node server.js
```

Par défaut le serveur écoute sur le port `3000`.

## Développement

- Code en ES modules (`type: "module"` dans `package.json`).
- Utiliser `nodemon` (installation globale ou en devDependencies) pour recharger automatiquement.

## Dépendances principales

- `express` — serveur HTTP
- `mysql2` — client MySQL (promise)
- `dotenv` — chargement des variables d'environnement
- `cors` — gestion CORS

## Structure des fichiers

- `server.js` — point d'entrée
- `config/db.js` — pool MySQL
- `routes/articleRoutes.js` — routes API
- `controllers/articleController.js` — logique des endpoints
- `models/articleModel.js` — accès SQL