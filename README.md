# 📊 Projet ETL & Analyse ROLAP – Transactions de Vente au Détail

## 🎯 Objectif du projet

Ce projet vise à concevoir un système d'analyse de données de vente au détail à l’aide d’un processus ETL complet et de requêtes OLAP. Les données sont traitées et transformées dans **Google Colab**, puis chargées dans **SQL Server** pour une analyse avancée via des opérations ROLAP (Slice, Dice, Roll-up, Drill-down).

---

## 🧰 Technologies utilisées

- **Google Colab** (Python, Pandas)
- **SQL Server**
- **SQL (T-SQL)**
- **Itérateurs et fonctions pandas avancées (`explode`, `chain`, etc.)**

---

## 🗃️ Structure de la base de données

Le modèle de données est constitué :
- D’une **table de faits** : `Transaction_Fait`
- De **tables de dimensions** :
  - `Customer`
  - `Product`
  - `Promotion`
  - `Magasin`
  - `Times`

---

## ⚙️ Processus ETL

Le processus se déroule en plusieurs étapes :

1. **Importation des données** dans Google Colab (`read_csv`)
2. **Prétraitement** :
   - Suppression des doublons
   - Gestion des valeurs nulles (`Discount_Applied`, `Customer_Category`, `Season`)
3. **Transformation** :
   - Séparation des produits (`explode` la colonne `Product`)
   - Création de colonnes temporelles (`Year`, `Month`, `Day`, `Season`) depuis la colonne `Date`
4. **Création des tables** (illustrée avec la table `Times`)
5. **Exportation des données** pour chargement dans SQL Server

---

## 📈 Requêtes ROLAP

### 🔹 Slice
- Transactions par ville (`HOUSTON`)
- Transactions avec coût total > 10
- Transactions en été

### 🔹 Dice
- Transactions des clients "Homemaker" payées en "Cash"
- Transactions "Professional" avec remise

### 🔹 Roll-up
- Total des ventes par année
- Ventes par type de magasin
- Ventes totales par mois

### 🔹 Drill-down
- Détail des ventes en 2023 pour les `Convenience Stores`
- Analyse journalière des ventes pour juin

---

## 📷 Captures d’écran

Des captures illustrent chaque étape du processus ETL et les résultats des requêtes SQL. Voir le dossier `/screenshots` du dépôt.

---

## 📁 Contenu du dépôt

- `process_etl.ipynb` : Notebook Google Colab avec le code complet
- `README.md` : Documentation du projet
- `/screenshots` : Images et résultats des traitements
- `create_tables.sql` : Script SQL de création des tables
- `rolap_queries.sql` : Requêtes Slice, Dice, Roll-up, Drill-down

---

## 👤 Auteur

**Sankara Kabem**  
Étudiant en science des données – Projet académique INF1473

---

## 📜 Licence

Ce projet est sous licence **MIT**. Voir le fichier `LICENSE` pour plus d'informations.


