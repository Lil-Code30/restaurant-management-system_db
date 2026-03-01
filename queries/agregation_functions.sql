/*
COUNT - Compter
*/
-- nombre total de produits
SELECT COUNT(*) AS total_produits FROM PRODUIT;

-- Nombre de clients avec email
SELECT COUNT(email) AS client_avec_email FROM client;
-- Note: COUNT(colonne) ignore les NULL

-- Nombre de valeurs distinctes
SELECT COUNT(DISTINCT categorie) AS nb_categorie FROM produit;

-- compter avec condition
SELECT COUNT(*) AS produits_chers
FROM produit
WHERE prix_unitaire > 5.00;

-- compter les clients VIP
SELECT COUNT(*) AS clients_vip
FROM CLIENT
WHERE carte_fidelite = TRUE AND points_fidelite > 100;

/*
SUM - Somme
*/
-- valeur totale du stock
SELECT SUM(prix_unitaire * stock_disponible) AS valeur_stock
FROM produit;

-- total des points de fidelite
SELECT SUM(points_fidelite) AS Total_points FROM client;

-- masse salariale
SELECT SUM(salaire) AS masse_salariale FROM employe;

-- chiffre d'affaire
SELECT SUM(montant_total) AS chiffre_affaires
FROM commande
WHERE statut = 'payee';

-- avec condition dans SUM
SELECT SUM(CASE 
    WHEN categorie = 'Plat' THEN prix_unitaire   
    ELSE 0
END) AS total_prix_plat
FROM produit;


/*
AVG - Moyenne
*/
-- prix moyen des produits
SELECT AVG(prix_unitaire) AS prix_moyen FROM produit;

-- moyenne arrondie
SELECT ROUND(AVG(prix_unitaire), 2) AS prix_moyen FROM produit;


-- panier moyen des commandes
SELECT AVG(montant_total) as panier_moyen
FROM commande
WHERE statut IN ('servie', 'payee');

-- points moyens par clients VIP
SELECT AVG(points_fidelite) AS points_moyens
FROM client
WHERE carte_fidelite = TRUE;

-- salaire moyen par poste
SELECT AVG(salaire) AS salaire_moyen
FROM employe
WHERE post = 'server';

/*
MIN et MAX
*/

-- produit le moins cher et le plus cher
SELECT
MIN(prix_unitaire) AS prix_min,
MAX(prix_unitaire) AS prix_max,
MAX(prix_unitaire) - MIN(prix_unitaire) AS ecart
FROM produit;

-- date premiere et derniere commande
SELECT 
MIN(date_commande) AS premiere_commande,
MAX(date_commande) AS derniere_commande
FROM commande;

-- client avec le plus de points
SELECT nom, prenom, points_fidelite
FROM client
WHERE points_fidelite = (SELECT MAX(points_fidelite) FROM client);

-- Stock minimum et maximum
SELECT
MIN(stock_disponible) as stock_min,
MAX(stock_disponible) AS stock_min
FROM produit;


/*
GROUP BY - Regroupement
GROUP BY regroupe les lignes ayant les mêmes valeurs et permet d’appliquer
des fonctions d’agrégation sur chaque groupe
*/
-- nombre de produit par categorie
SELECT
categorie, 
COUNT(*) as nombre_produits
FROM produit
GROUP BY categorie;

-- statistiques par categorie
SELECT
categorie,
COUNT(*) AS nb_produits,
AVG(prix_unitaire) As prix_moyen,
MIN(prix_unitaire) AS prix_min,
MAX(prix_unitaire) AS prix_max,
SUM(stock_disponible) AS stock_total
FROM produit
GROUP BY categorie
ORDER BY prix_moyen DESC;

--nombre d'employees et salaire moyen par poste
SELECT
post,
COUNT(*) AS effectif,
AVG(salaire) AS salaire_moyen,
MIN(salaire) AS salaire_min,
MAX(salaire) AS salaire_max
FROM employe
GROUP BY post;

-- commande par statut
SELECT
statut,
COUNT(*) AS nombre,
SUM(montant_total) AS total
from commande
GROUP BY statut;

-- regroupement multiple
SELECT
categorie,
YEAR(date_ajout) AS annee,
COUNT(*) AS nb_produits
FROM produit
GROUP BY categorie, YEAR(date_ajout);

/*
HAVING - Filtrage après regroupement

Attention: 
WHERE filtre AVANT le regroupement.
HAVING filtre APRÈS le regroupement (sur les résultats agrégés)
*/

-- HAVING : C a t g o r i e s avec plus de 3 produits
SELECT
categorie ,
COUNT (*) AS nb_produits
FROM PRODUIT
GROUP BY categorie
HAVING COUNT (*) > 3;

-- C a t g o r i e s avec prix moyen > 3 DH
SELECT
categorie ,
AVG ( prix_unitaire ) AS prix_moyen
FROM PRODUIT
GROUP BY categorie
HAVING AVG( prix_unitaire ) > 3.00;

-- WHERE + HAVING
SELECT
categorie ,
AVG ( prix_unitaire ) AS prix_moyen
FROM PRODUIT
WHERE stock_disponible > 0 -- Filtre AVANT regroupement
GROUP BY categorie
HAVING AVG( prix_unitaire ) > 2.50 -- Filtre A P R S regroupement
ORDER BY prix_moyen DESC ;

-- Postes avec salaire moyen > 4500
SELECT
post ,
COUNT (*) AS effectif ,
AVG ( salaire ) AS salaire_moyen
FROM EMPLOYE
WHERE actif = TRUE
GROUP BY post
HAVING AVG( salaire ) > 4500;

-- Clients avec plusieurs commandes
SELECT
id_client ,
COUNT (*) AS nb_commandes ,
SUM ( montant_total ) AS total_depense
FROM COMMANDE
WHERE statut != 'annulee'
GROUP BY id_client
HAVING COUNT (*) >= 2
ORDER BY total_depense DESC ;