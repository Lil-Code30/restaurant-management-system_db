-- Active: 1768851561572@@127.0.0.1@3306@cafe_restaurant
/*
Définition
Une jointure combine les lignes de deux ou plusieurs tables en fonction d’une
colonne commune.
*/

/*
INNER JOIN
INNER JOIN retourne uniquement les lignes qui ont des correspondances dans
les DEUX tables.
*/

-- commandes avec noms des clients
SELECT c.numero_commande,
cl.nom, cl.prenom, c.date_commande, c.montant_total
FROM commande c
INNER JOIN client cl
ON c.id_client = cl.id_cient;

-- jointure multitple : commande + client + serveur + table
SELECT cmd.numero_commande,
CONCAT(cl.prenom, " ", cl.nom) AS client,
CONCAT(e.prenom, ' ', e.nom) AS serveur,
t.numero_table,
t.emplacement,
cmd.date_commande,
cmd.statut
FROM commande cmd
INNER JOIN client cl ON cmd.id_client = cl.id_client
INNER JOIN employe e ON cmd.id_employe = e.id_employe
INNER JOIN TABLE_RESTAURANT t ON cmd.id_table = t.id_table;

-- details de commandes avec produits
SELECT cmd.numero_commande,
p.nom_produit, p.categorie,
dc.quantite, dc.prix_unitaire,
(dc.quantite * dc.prix_unitaire) AS sous_total
FROM detail_commande dc
INNER JOIN commande cmd ON dc.id_commande = cmd.id_commande
INNER JOIN produit p ON dc.id_produit = p.id_produit;  

/*
LEFT JOIN (LEFT OUTER JOIN)
LEFT JOIN retourne TOUTES les lignes de la table de gauche, et les lignes
correspondantes de la table de droite (NULL si pas de correspondance).
*/

-- tous les clients avec ou sans commande
SELECT cl.nom, cl.prenom, cmd.numero_commande, cmd.date_commande
FROM client cl
LEFT JOIN commande cmd
ON cl.id_client = cmd.id_client;

-- clients qui n'ont jamais commander
SELECT cl.nom, cl.prenom, cl.email
FROM client cl
LEFT JOIN commande cmd
ON cl.id_client = cmd.id_client
WHERE cmd.id_commande IS NULL;

-- tous les produits avec nombres de fois commandees
SELECT p.nom_produit, p.categorie,
COUNT(dc.id_detail) AS fois_commande
FROM produit p
LEFT JOIN detail_commande dc ON p.id_produit = dc.id_produit
GROUP BY p.id_produit, p.nom_produit, p.categorie
ORDER BY fois_commande DESC;

-- produit jamais commandees
SELECT p.nom_produit, p.categorie, p.prix_unitaire
FROM produit p
LEFT JOIN detail_commande dc
ON p.id_produit = dc.id_produit
WHERE dc.id_detail IS NULL;

/*
FULL JOIN (FULL OUTER JOIN)
MySQL ne supporte pas nativement FULL OUTER JOIN. On utilise UNION de
LEFT et RIGHT JOIN.
*/

-- full join avec union
SELECT cl.nom, cmd.numero_commande
FROM client cl
LEFT JOIN commande cmd
ON cl.id_client = cmd.id_client

UNION

SELECT cl.nom, cmd.numero_commande
FROM client cl
RIGHT JOIN commande cmd
ON cl.id_client = cmd.id_client;

/*
SELF JOIN
SELF JOIN : une table est jointe avec elle-même, utile pour comparer les lignes
au sein d’une même table.
*/

-- produits de meme categorie mais prix different
SELECT
P1. nom_produit AS produit1 ,
P2. nom_produit AS produit2 ,
P1. categorie ,
P1. prix_unitaire AS prix1 ,
P2. prix_unitaire AS prix2
FROM PRODUIT P1
INNER JOIN PRODUIT P2
ON P1. categorie = P2. categorie
AND P1. id_produit < P2. id_produit
WHERE ABS(P1. prix_unitaire - P2. prix_unitaire ) > 1.00;

/*
CROSS JOIN (Produit cartésien)
*/

-- Toutes les combinaisons possibles
SELECT
P. nom_produit ,
T. numero_table
FROM PRODUIT P
CROSS JOIN TABLE_RESTAURANT T
LIMIT 20;

-- Equivalent sans mot - cle CROSS JOIN
SELECT
P. nom_produit ,
T. numero_table
FROM PRODUIT P, TABLE_RESTAURANT T
LIMIT 20;