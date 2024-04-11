--requete 1 
-- Les operation LIKE sont très couteuse, on va donc utiliser un index sur la colonne theme
--De plus l'index theme pourra  potentiellement servir pour la requete 2 10 et 15 qui utilise aussi la colonne theme
--sous livesql il est difficile de dire si c'est rentable ou non de faire un index due au fait qu'il y a peu de données
--mais cela me semblait logique d'en faire sur les colonnes qui sont souvent demandés dans les requetes

--sans index 
EXPLAIN PLAN FOR
SELECT titre
FROM Contenu
WHERE theme LIKE '%Anime%' OR theme LIKE '%Fantasy%'
ORDER BY titre ASC;

EXPLAIN PLAN FOR
SELECT c.titre, c.theme
FROM Client cl
JOIN Location loc ON loc.IdClient = cl.ID
JOIN Contenu c ON c.id = loc.ReferenceContenu
WHERE cl.nom = 'Dupont' AND loc.DateDeb BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-03-31', 'YYYY-MM-DD')
UNION
SELECT c.titre, c.theme
FROM Client cl
JOIN Souscription s ON s.IdClient = cl.ID
JOIN ContenuAbonnement ca ON ca.IdSouscription = s.ID
JOIN Contenu c ON c.id = ca.ReferenceContenu
WHERE cl.nom = 'Dupont' AND s.DateDebSouscription BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-03-31', 'YYYY-MM-DD');

EXPLAIN PLAN FOR
SELECT COUNT(DISTINCT p.prenom_nom) AS NB_REALISATEUR
FROM personne p
JOIN realise r ON p.prenom_nom = r.personne
JOIN contenu c ON c.id = r.contenu
WHERE c.theme <> 'Comedie';

EXPLAIN PLAN FOR
SELECT DISTINCT personne
FROM realise r
INNER JOIN Contenu c ON r.contenu = c.id
WHERE c.theme IN ('Sci-Fi & Fantasy', 'TV Action & Adventure')
GROUP BY personne
HAVING COUNT(DISTINCT CASE WHEN c.theme = 'Sci-Fi & Fantasy' THEN c.id END) > 0
   AND COUNT(DISTINCT CASE WHEN c.theme = 'TV Action & Adventure' THEN c.id END) > 0;



SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
--avec index
CREATE INDEX index_theme ON Contenu (theme);

EXPLAIN PLAN FOR
SELECT titre
FROM Contenu
WHERE theme LIKE '%Anime%' OR theme LIKE '%Fantasy%'
ORDER BY titre ASC;

EXPLAIN PLAN FOR
SELECT c.titre, c.theme
FROM Client cl
JOIN Location loc ON loc.IdClient = cl.ID
JOIN Contenu c ON c.id = loc.ReferenceContenu
WHERE cl.nom = 'Dupont' AND loc.DateDeb BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-03-31', 'YYYY-MM-DD')
UNION
SELECT c.titre, c.theme
FROM Client cl
JOIN Souscription s ON s.IdClient = cl.ID
JOIN ContenuAbonnement ca ON ca.IdSouscription = s.ID
JOIN Contenu c ON c.id = ca.ReferenceContenu
WHERE cl.nom = 'Dupont' AND s.DateDebSouscription BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-03-31', 'YYYY-MM-DD');

EXPLAIN PLAN FOR
SELECT COUNT(DISTINCT p.prenom_nom) AS NB_REALISATEUR
FROM personne p
JOIN realise r ON p.prenom_nom = r.personne
JOIN contenu c ON c.id = r.contenu
WHERE c.theme <> 'Comedie';

EXPLAIN PLAN FOR
SELECT DISTINCT personne
FROM realise r
INNER JOIN Contenu c ON r.contenu = c.id
WHERE c.theme IN ('Sci-Fi & Fantasy', 'TV Action & Adventure')
GROUP BY personne
HAVING COUNT(DISTINCT CASE WHEN c.theme = 'Sci-Fi & Fantasy' THEN c.id END) > 0
   AND COUNT(DISTINCT CASE WHEN c.theme = 'TV Action & Adventure' THEN c.id END) > 0;



SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

--Requete 13
--Beaucoup de table et de jointure pour une requete qui peut être utilisé plusieurs fois, il faudrait faire une vue materialisé
--requete sans optimisation 
EXPLAIN PLAN FOR
SELECT c.nom, c.prenom 
FROM Client c
INNER JOIN Souscription s ON c.ID = s.IdClient
INNER JOIN Abonnement a ON s.IdAbonnement = a.ID AND a.nom = 'VIP'
INNER JOIN ContenuAbonnement ca ON s.ID = ca.IdSouscription
INNER JOIN Contenu co ON ca.ReferenceContenu = co.id
INNER JOIN Divertissement d ON co.id = d.Contenu
WHERE  ca.datedebloca >= ADD_MONTHS(SYSDATE, -3);

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

--creation de la vue
CREATE MATERIALIZED VIEW vuerequete13 AS
SELECT c.nom, c.prenom, d.duree, ca.datedebloca , a.nom as abonnement
FROM Client c
INNER JOIN Souscription s ON c.ID = s.IdClient
INNER JOIN Abonnement a ON s.IdAbonnement = a.ID 
INNER JOIN ContenuAbonnement ca ON s.ID = ca.IdSouscription
INNER JOIN Contenu co ON ca.ReferenceContenu = co.ID
INNER JOIN Divertissement d ON co.ID = d.Contenu;


--requete finale
EXPLAIN PLAN FOR
SELECT nom, prenom
FROM vuerequete13
WHERE datedebloca >= ADD_MONTHS(SYSDATE, -3)
AND abonnement = 'VIP';

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());


--Pour les requetes 17 18 19 20 il peut être judicieux de créer un index sur mot clés
--sans index
EXPLAIN PLAN FOR
SELECT c.titre
FROM Contenu c
INNER JOIN Cinema ci ON c.id = ci.Contenu
WHERE c.titre <> 'The Founder'
AND NOT EXISTS (
  SELECT 1
  FROM Contenu c2
  WHERE c2.titre = 'The Founder'
  AND REGEXP_LIKE(c.mots_cles, '(^|\W)'||c2.mots_cles||'($|\W)')
);

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

CREATE INDEX idx_contenu_mots_cles ON Contenu(mots_cles);

--avec index
EXPLAIN PLAN FOR
SELECT c.titre
FROM Contenu c
INNER JOIN Cinema ci ON c.id = ci.Contenu
WHERE c.titre <> 'The Founder'
AND NOT EXISTS (
  SELECT 1
  FROM Contenu c2
  WHERE c2.titre = 'The Founder'
  AND REGEXP_LIKE(c.mots_cles, '(^|\W)'||c2.mots_cles||'($|\W)')
);

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
--les requetes sont similaire donc je n'ai remise les autres même si le fonctionnement doit être le même


CREATE INDEX idx_contenu_mots_cles_lower ON Contenu(lower(mots_cles)); --un peu hors sujet mais c'etait a placé
-- cette index permet d'accélérer  les recherches de mot clés en ignorant  majuscule ou miniscule.
--pratique si les utilisateurs font des recherches vu qu'ils ne mettront pas forcément le terme exact à la majuscule près.


--Il peut être judicieux de faire un index sur la colonne nom_prenom dans personne car cela est beaucoup utilisé dans les requêtes
--exemple avec requete 
CREATE INDEX idx_personne ON Personnne(nom_prenom);
