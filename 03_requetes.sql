-- 1. Afficher l'historique des emprunts

SELECT
    EMPRUNT.id_emprunt,
    ADHERENT.nom,
    ADHERENT.prenom,
    JEU.titre,
    BOITE.id_boite,
    BOITE.etat,
    EMPRUNT.date_depart,
    EMPRUNT.dateRet_prevue,
    EMPRUNT.dateRet_reel
FROM EMPRUNT
JOIN ADHERENT
    ON EMPRUNT.id_adherent = ADHERENT.id_adherent
JOIN BOITE
    ON EMPRUNT.id_boite = BOITE.id_boite
JOIN JEU
    ON BOITE.id_jeu = JEU.id_jeu;


-- 2. Afficher les emprunts en cours :

SELECT
    EMPRUNT.id_emprunt,
    ADHERENT.nom,
    ADHERENT.prenom,
    JEU.titre,
    BOITE.id_boite,
    EMPRUNT.date_depart,
    EMPRUNT.dateRet_prevue
FROM EMPRUNT
JOIN ADHERENT
    ON EMPRUNT.id_adherent = ADHERENT.id_adherent
JOIN BOITE
    ON EMPRUNT.id_boite = BOITE.id_boite
JOIN JEU
    ON BOITE.id_jeu = JEU.id_jeu
WHERE EMPRUNT.dateRet_reel IS NULL;


-- 3. Afficher les emprunts en retard :

SELECT
    EMPRUNT.id_emprunt,
    ADHERENT.nom,
    ADHERENT.prenom,
    ADHERENT.email,
    JEU.titre,
    BOITE.id_boite,
    EMPRUNT.dateRet_prevue
FROM EMPRUNT
JOIN ADHERENT
    ON EMPRUNT.id_adherent = ADHERENT.id_adherent
JOIN BOITE
    ON EMPRUNT.id_boite = BOITE.id_boite
JOIN JEU
    ON BOITE.id_jeu = JEU.id_jeu
WHERE EMPRUNT.dateRet_reel IS NULL
  AND EMPRUNT.dateRet_prevue < date('now')
ORDER BY EMPRUNT.dateRet_prevue;


-- 4. Compter les boîtes possédées pour chaque jeu, y compris les jeux sans boîte.

SELECT
    JEU.id_jeu,
    JEU.titre,
    COUNT(BOITE.id_boite) AS nombre_boites
FROM JEU
LEFT JOIN BOITE
    ON JEU.id_jeu = BOITE.id_jeu
GROUP BY JEU.id_jeu, JEU.titre;


-- 5. Afficher les boîtes disponibles :

SELECT
    BOITE.id_boite,
    JEU.titre,
    BOITE.etat
FROM BOITE
JOIN JEU
    ON BOITE.id_jeu = JEU.id_jeu
WHERE BOITE.etat <> 'Inutilisable'
  AND NOT EXISTS (
      SELECT 1
      FROM EMPRUNT
      WHERE EMPRUNT.id_boite = BOITE.id_boite
        AND EMPRUNT.dateRet_reel IS NULL
  );