-- ProjetSQL_GNANGBA_Sam_Samuel


-- création d'une base de donnée DCLIC_2 
CREATE DATABASE DCLIC_2;

-- indication que toutes les opérations suivantes se feront dans la base de donnée DCLIC_2
USE DCLIC_2;

-- CATÉGORIES
CREATE TABLE categories (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);


INSERT INTO categories (nom) VALUES
('Électronique'), ('Vêtements'), ('Alimentation'),
('Maison'), ('Sport'), ('Livres'), ('Beauté');

SELECT * FROM categories;

-- PRODUITS (100 produits)
CREATE TABLE produits (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prix DECIMAL(10,2),
    categorie_id INTEGER REFERENCES categories(id),
    stock INTEGER DEFAULT 0
);

-- Exemples d'insertion
INSERT INTO produits (nom, prix, categorie_id, stock) VALUES
('Smartphone Pro', 899.99, 1, 45),
('Laptop Ultra', 1299.00, 1, 23),
('T-Shirt Classic', 29.99, 2, 150),
('Jean Slim', 79.99, 2, 85),
('Café Premium 1kg', 24.99, 3, 200);

SELECT * FROM produits;

-- DÉPARTEMENTS
CREATE TABLE departements (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    budget DECIMAL(12,2)
);

INSERT INTO departements (nom, budget) VALUES
('Direction', 500000),
('IT', 350000),
('Marketing', 200000),
('Finance', 180000),
('RH', 120000),
('Commercial', 280000),
('Production', 400000),
('R&D', 320000),
('Support', 150000),
('Logistique', 220000);

SELECT * FROM departements;

-- Q1.1 : création de la table des employés
CREATE TABLE employes (
    id INT IDENTITY(1,1) PRIMARY KEY,          
    prenom VARCHAR(50) NOT NULL,               
    nom VARCHAR(50) NOT NULL,                  
    email VARCHAR(100) UNIQUE,                 
    salaire DECIMAL(10,2),                    
    date_embauche DATE,                        
    departement_id INT REFERENCES departements(id), 
    manager_id INT REFERENCES employes(id)     
);

-- Q1.2 : insertion des employés
INSERT INTO employes (prenom, nom, email, salaire, date_embauche, departement_id, manager_id)
VALUES
('Marie',  'Dupont',  'marie.dupont@company.com', 85000, '2018-03-15', 1, NULL), -- pas de manager
('Jean',   'Martin',  'jean.martin@company.com',  72000, '2019-06-01', 2, 1),
('Sophie', 'Bernard', 'sophie.bernard@company.com', 68000, '2019-09-10', 3, 1),
('Pierre', 'Dubois',  'pierre.dubois@company.com', 55000, '2020-01-20', 2, 2),
('Claire', 'Moreau',  'claire.moreau@company.com', 52000, '2020-04-15', 2, 2);

-- Q1.3 : lister tous les employés
SELECT * FROM employes;

-- Q2.1 : création de la table clients
CREATE TABLE clients (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,          -- nom obligatoire
    email VARCHAR(100),
    ville VARCHAR(50),
    pays VARCHAR(50) DEFAULT 'France',  -- valeur par défaut France
    date_inscription DATE,
    segment VARCHAR(20)
);

-- Q2.2 : insertion des clients
INSERT INTO clients (nom, email, ville, pays, date_inscription, segment)
VALUES
('Alice Mercier', 'alice.m@email.com', 'Paris',  'France', '2022-01-15', 'Premium'),
('Bob Laurent',   'bob.l@email.com',   'Lyon',   'France', '2022-02-20', 'Standard'),
('Carla Rossi',   'carla.r@email.com', 'Milan',  'Italie', '2022-03-10', 'Premium'),
('David Smith',   'david.s@email.com', 'London', 'UK',     '2022-04-05', 'Standard');

-- Q2.3 : lister tous les clients
SELECT * FROM clients;

-- Q3.1 : création de la table commandes
CREATE TABLE commandes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    client_id INT REFERENCES clients(id),   -- clé étrangère vers clients
    date_commande DATE,
    montant DECIMAL(10,2),
    statut VARCHAR(20) DEFAULT 'En cours'   -- statut par défaut
);

-- Q3.2 : création de la table lignes_commande
CREATE TABLE lignes_commande (
    id INT IDENTITY(1,1) PRIMARY KEY,
    commande_id INT REFERENCES commandes(id), -- référence vers commandes
    produit_id INT REFERENCES produits(id),   -- on ajoute un lien vers produits (logique)
    quantite INT,
    prix_unitaire DECIMAL(10,2)
);

-- Q4.1 : création de la table projets
CREATE TABLE projets (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2),
    date_debut DATE,
    date_fin DATE,
    statut VARCHAR(20)
);

-- Q4.2 : insertion des projets
INSERT INTO projets (nom, budget, date_debut, date_fin, statut)
VALUES
('Refonte Site Web', 150000, '2024-01-15', '2024-06-30', 'En cours'),
('App Mobile V2',    200000, '2024-02-01', '2024-08-31', 'En cours'),
('Migration Cloud',  300000, '2024-03-01', '2024-12-31', 'Planifié'),
('CRM Integration',   80000, '2023-09-01', '2024-02-28', 'Terminé');

-- Q4.3 : lister tous les projets
SELECT * FROM projets;

-- Q5.1 : création de la table des affectations (clé primaire composée)
CREATE TABLE affectations (
    employe_id INT REFERENCES employes(id),  -- employé affecté
    projet_id  INT REFERENCES projets(id),   -- projet concerné
    role VARCHAR(50),
    heures_allouees INT,
    CONSTRAINT PK_affectations PRIMARY KEY (employe_id, projet_id) -- clé composée
);

-- Q6.1 : création de la table vendeurs
CREATE TABLE vendeurs (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    region VARCHAR(50)
);

-- Q6.2 : insertion des vendeurs
INSERT INTO vendeurs (nom, region)
VALUES
('Thomas Petit',  'Île-de-France'),
('Emma Grand',    'Rhône-Alpes'),
('Lucas Morel',   'PACA'),
('Léa Fournier',  'Île-de-France');

-- Q6.3 : lister tous les vendeurs
SELECT * FROM vendeurs;

-- Q7.1 : création de la table ventes
CREATE TABLE ventes (
    id INT PRIMARY KEY,                 -- ici pas d'IDENTITY dans l’énoncé
    vendeur_id INT REFERENCES vendeurs(id),
    date_vente DATE,
    montant DECIMAL(10,2),
    produit VARCHAR(100)
);

-- Q8.1 : employés avec salaire > 50000
SELECT *
FROM employes
WHERE salaire > 50000;

-- Q8.2 : salaire > 40000 ET département = 1
SELECT *
FROM employes
WHERE salaire > 40000
  AND departement_id = 1;

-- Q8.3 : employés du département 1 ou 2
SELECT *
FROM employes
WHERE departement_id = 1
   OR departement_id = 2;

-- Q8.4 : employés des départements 1, 2 ou 3 (IN)
SELECT *
FROM employes
WHERE departement_id IN (1, 2, 3);

-- Q9.1 : prénom commence par 'M'
SELECT *
FROM employes
WHERE prenom LIKE 'M%';

-- Q9.2 : nom contient 'art'
SELECT *
FROM employes
WHERE nom LIKE '%art%';

-- Q9.3 : prénom avec 'a' comme 2e caractère
SELECT *
FROM employes
WHERE prenom LIKE '_a%';   -- _ = un caractère quelconque

-- Q10.1 : employés ayant un département (departement_id non NULL)
SELECT *
FROM employes
WHERE departement_id IS NOT NULL;

-- Q11.1 : employés triés par salaire croissant
SELECT *
FROM employes
ORDER BY salaire ASC;

-- Q11.2 : employés triés par salaire décroissant
SELECT *
FROM employes
ORDER BY salaire DESC;

-- Q11.3 : tri par département (croissant), puis salaire (décroissant)
SELECT *
FROM employes
ORDER BY departement_id ASC, salaire DESC;

-- Q12.1 : agrégats sur les salaires
SELECT
    COUNT(*)           AS nb_employes,
    AVG(salaire)       AS salaire_moyen,
    MIN(salaire)       AS salaire_min,
    MAX(salaire)       AS salaire_max
FROM employes;

-- Q13.1 : nombre d'employés et salaire moyen par département
SELECT
    departement_id,
    COUNT(*)     AS nb_employes,
    AVG(salaire) AS salaire_moyen
FROM employes
GROUP BY departement_id;

-- Q13.2 : départements dont le salaire moyen > 45000
SELECT
    departement_id,
    AVG(salaire) AS salaire_moyen
FROM employes
GROUP BY departement_id
HAVING AVG(salaire) > 45000;

-- Q14.1 : employés avec le nom de leur département (uniquement ceux qui en ont un)
SELECT
    e.prenom,
    e.nom,
    d.nom AS nom_departement
FROM employes e
JOIN departements d
    ON e.departement_id = d.id;

-- Q14.2 : tous les employés, même sans département
SELECT
    e.prenom,
    e.nom,
    d.nom AS nom_departement
FROM employes e
LEFT JOIN departements d
    ON e.departement_id = d.id;

-- Q15.1 : employés dont le salaire est > salaire moyen global
SELECT *
FROM employes
WHERE salaire > (
    SELECT AVG(salaire) FROM employes
);

-- Q15.2 : employés du département 'IT' (en utilisant une sous‑requête)
SELECT *
FROM employes
WHERE departement_id IN (
    SELECT id
    FROM departements
    WHERE nom = 'IT'
);



