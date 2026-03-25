-- 1. Création de la base de données
CREATE DATABASE IF NOT EXISTS blog_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE blog_db;

-- 2. Création de la table articles
CREATE TABLE IF NOT EXISTS articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(100) NOT NULL,
    category VARCHAR(100) DEFAULT 'Général',
    tags JSON NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 3. Insertion de quelques articles de test
INSERT INTO articles (title, content, author, category, tags) VALUES 
(
    'Bienvenue sur mon Blog', 
    'Ceci est le tout premier article de mon API Node.js.', 
    'Admin', 
    'Tech', 
    '["nouveau", "blog", "express"]'
),
(
    'Découvrir le Yaourt Pera', 
    'Le yaourt nature Pera est idéal pour une alimentation équilibrée.', 
    'Distributeur', 
    'Alimentation', 
    '["yaourt", "nature", "santé"]'
),
(
    'Guide Express et MySQL', 
    'Comment connecter une base de données MySQL à un serveur Express en 5 minutes.', 
    'Développeur', 
    'Tech', 
    '["tuto", "mysql", "node"]'
);

-- 4. Vérification des données
SELECT * FROM articles;