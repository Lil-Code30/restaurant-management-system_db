/*
UNION et combinaison de résultats
UNION combine les résultats de plusieurs SELECT et élimine les doublons.
UNION ALL combine les résultats et conserve les doublons (plus rapide).
*/

-- UNION : Elimine les doublons
SELECT nom , prenom FROM CLIENT
UNION
SELECT nom , prenom FROM EMPLOYE ;

-- UNION ALL : garde les doublons ( plus rapide )
SELECT nom_produit FROM PRODUIT WHERE categorie = 'Boisson chaude'
UNION ALL
SELECT nom_produit FROM PRODUIT WHERE prix_unitaire < 3.00;

-- Rapport complet avec c a t g o r i e s
SELECT 'Client' AS type , nom ,
prenom ,
email
FROM CLIENT
WHERE carte_fidelite = TRUE

UNION ALL
SELECT 'Employ' AS type ,
nom ,
prenom ,
email
FROM EMPLOYE
WHERE actif = TRUE
ORDER BY nom , prenom ;

-- Statistiques c o m b i n e s
( SELECT 'Produits chers' AS categorie ,
COUNT (*) AS nombre ,
AVG( prix_unitaire ) AS moyenne
FROM PRODUIT
WHERE prix_unitaire > 5.00)

UNION ALL

( SELECT 'Produits pas chers' AS categorie ,
COUNT (*) AS nombre ,
AVG( prix_unitaire ) AS moyenne
FROM PRODUIT
WHERE prix_unitaire <= 5.00) ;