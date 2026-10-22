# Gestion des prêts d’une association de jeux de société
Projet personnel réalisé en première année de BUT Informatique pour pratiquer la conception de bases de données et SQL avec SQLite.



## Contexte
Une micro entreprise(fictive) souhaite remplacer sont suivi Excel par une base de données afin d'automatiser la gestion de leurs jeux, leurs boîte physique et les emprunts des adhérents.

Un jeu peut exister en plusieurs exemplaires. Chaque boîte possède son propre identifiant et son état.



## Fonctionnalités
- Enregistrer les jeux, les boîtes et les adhérents.
- Enregistrer un emprunt et le retour d’une boîte.
- Consulter l’historique des prêts.
- Afficher les emprunts en cours et en retard.
- Compter les boîtes de chaque jeu.
- Rechercher les boîtes disponibles.
- Empêcher plusieurs emprunts en cours pour une même boîte.



## Organisation de la base
La base de données contient quatre tables :

- JEU : caractéristiques des jeux.
- ADHERENT : informations personnel sur les membres.
- BOITE : exemplaires physiques des jeux.
- EMPRUNT : dates et suivi des prêts.

Chaque boîte référence un jeu. Chaque emprunt référence un adhérent et une boîte.


## Logiciel utilisé
- SQLite
- SQL
- DB Browser for SQLite


## Fichiers
- `01_creation.sql` : création des tables et de l’index unique.
- `02_donnees.sql` : données fictives.
- `03_requetes.sql` : requêtes de consultation.



## Utilisation prévue
1. Créer une base SQLite vide.
2. Exécuter `01_creation.sql`.
3. Activer les clés étrangères avec `PRAGMA foreign_keys = ON;`hors transaction.
4. Exécuter `02_donnees.sql` une seule fois.
5. Exécuter les requêtes de `03_requetes.sql` individuellement.



## Compétences travaillées
- Traduction d’un besoin métier en MCD et en schéma relationnel.
- Définition des clés primaires et étrangères.
- Création, ajout et modification de données.
- Jointures entre plusieurs tables.
- Agrégations avec COUNT et GROUP BY.
- Sous-requête avec NOT EXISTS.
- Gestion des valeurs NULL.
- Index unique conditionnel pour limiter les emprunts en cours.



## Limites et évolutions
Le projet s’utilise actuellement avec des requêtes SQL, sans interface.

Évolutions envisagées :
- Renforcer les contrôles sur les dates et les valeurs autorisées.
- Ajouter un menu Python pour gérer les prêts.
- Créer ensuite une interface web.



## Données de démonstration
Les données utilisées sont fictives. Certains emprunts servent uniquement à tester les différents résultats des requêtes.