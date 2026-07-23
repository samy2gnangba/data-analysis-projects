# Projet SQL — Base de données de gestion d'entreprise

## Contexte
Projet SQL complet couvrant la conception de schéma, la manipulation de données et les requêtes analytiques sur une base de données simulant la gestion d'une entreprise (employés, clients, produits, projets, ventes).

## Structure de la base de données
- `categories`, `produits` — catalogue produit
- `departements`, `employes` (avec hiérarchie manager) — RH
- `clients`, `commandes`, `lignes_commande` — activité commerciale
- `projets`, `affectations` (clé composée) — gestion de projet
- `vendeurs`, `ventes` — performance commerciale

## Compétences démontrées
- Conception de schéma relationnel (clés primaires, étrangères, clés composées)
- Requêtes de filtrage (`WHERE`, `LIKE`, `IN`, `IS NOT NULL`)
- Tri et agrégation (`ORDER BY`, `GROUP BY`, `HAVING`)
- Fonctions d'agrégation (`COUNT`, `AVG`, `MIN`, `MAX`)
- Jointures (`JOIN`, `LEFT JOIN`)
- Sous-requêtes (comparaison à une moyenne, filtrage par sous-ensemble)

## Contenu
- `projet_sql_gestion_entreprise.sql` — script SQL complet (création, insertion, requêtes)