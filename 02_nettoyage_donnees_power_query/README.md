# Nettoyage de données — Évaluation Data Analyst

## Contexte
Évaluation pratique de nettoyage et transformation de données de transactions commerciales avec Power Query (Excel).

## Démarche (documentée en détail)
- Remplacement des valeurs vides de `CustomerName` par "Identité Inconnue"
- Utilisation de la première ligne comme en-têtes
- Correction des 4% d'erreurs de la colonne `City` → "Ville Inconnue"
- Conversion de `Units`, `Amount`, `PricePerUnit` (texte → nombre décimal, gestion du séparateur français virgule/point)
- Suppression des doublons sur `TransactionID`
- Standardisation de `Status` en 3 valeurs : Payé / En Attente / Non-payé
- Création d'une colonne conditionnelle `RevenueCategory` (Core / Non-Core) via une formule Power Query personnalisée
- Extraction du mois et du jour depuis `TransactionDate`
- Création d'une colonne `Ligne Produits` (3 dernières lettres de `ProductLine`)
- Remplacement des valeurs manquantes de `Amount` par la médiane
- Création d'une colonne `Index` par concaténation conditionnelle de `NoteTag` et `CampaignCode`

## Outils
- Excel / Power Query
- Langage M (formules conditionnelles personnalisées)

## Contenu
- `evaluation_data_analyst.xlsx` — fichier Excel avec les données nettoyées et les étapes Power Query

## Compétences démontrées
- Nettoyage de données réelles avec erreurs et valeurs manquantes
- Écriture de formules M personnalisées (conditions, extraction de texte, calculs statistiques)
- Documentation claire d'une démarche de traitement de données