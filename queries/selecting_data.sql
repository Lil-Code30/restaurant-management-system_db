/*
SELECT ALL
*/
--tout les produits
SELECT * FROM produit;


/*
SELECT DISTINCT
*/
-- Liste des categories (sans doublons)
SELECT DISTINCT categorie FROM produit;

-- villes des clients
SELECT DISTINCT SUBSTRING_INDEX(adresse,',',-1) AS ville FROM CLIENT;

-- combinaison de colonnes distinctes
SELECT DISTINCT categorie, emplacement
FROM produit p, table_restaurant t;


/*
WHERE - Filtrage avancé
*/
-- produits d'une categorie
SELECT * FROM produit WHERE categorie = 'Boisson chaude';

-- prix dans une plage 
SELECT nom_produit, prix_unitaire
FROM produit
WHERE prix_unitaire BETWEEN 2.00 AND 4.00;

-- plusieurs categories
SELECT * FROM produit
WHERE categorie IN ('Viennoiserie', 'Patisserie');

-- stock faible
SELECT nom_produit, stock_disponible
FROM produit
WHERE stock_disponible < stock_min;

-- Client avec email
SELECT nom, prenom, email
FROM client
WHERE email IS NOT NULL;


/*
Opérateurs logiques (AND, OR, NOT)
*/
-- AND : toutes les conditions doivent etre vraies
SELECT * FROM produit
WHERE categorie = 'Boisson chaude' AND prix_unitaire < 3.00;

-- OR : au moins une conditions vraie
SELECT * FROM produit
WHERE categorie = 'Plat' OR prix_unitaire > 5.00;

-- NOT : negation
SELECT * FROM produit
WHERE NOT categorie = 'Boisson chaude';

-- combinaison complexe avec parenthese
SELECT * FROM produit
WHERE (categorie = "Boisson chaude" OR categorie = "Boisson froide") 
AND prix_unitaire BETWEEN 2.00 AND 4.00
AND stock_disponible > 20;

-- Clients VIP actifs
SELECT nom, prenom, points_fidelite
FROM client
WHERE carte_fidelite = TRUE
AND points_fidelite >= 100
AND email IS NOT NULL;

/*
ORDER BY - Tri des résultats
*/
-- Tri croissant (par defaut)
SELECT nom_produit, prix_unitaire
FROM produit
ORDER BY prix_unitaire ASC;

-- Tri decroissant 
SELECT nom, prenom, points_fidelite
FROM client
ORDER BY points_fidelite DESC;

-- tri multiple
SELECT nom_produit, categorie, prix_unitaire
FROM produit
ORDER BY categorie ASC, prix_unitaire DESC;

-- tri avec CASE
SELECT nom_produit, stock_disponible
FROM produit
ORDER BY 
    CASE 
        WHEN stock_disponible = 0 THEN  1
        WHEN stock_disponible < 20 THEN 2
        ELSE 3  
    END,
    nom_produit;


/*
LIMIT et OFFSET
*/
-- les 5 premiers resultats
SELECT * FROM produit LIMIT 5;

-- top 3 clients fideles
SELECT nom, prenom, points_fidelite
FROM client
ORDER BY points_fidelite DESC
LIMIT 3;

-- pagination : 10 par page, page 2
SELECT * FROM produit
ORDER BY nom_produit
LIMIT 10 OFFSET 10;


/*
LIKE et Wildcards
*/
-- commence par 'C'
SELECT * FROM produit WHERE nom_produit LIKE 'C%';

-- Termine par 'ette'
SELECT * FROM produit WHERE nom_produit LIKE '%ette';

-- Contient 'choco'
SELECT * FROM produit WHERE nom_produit LIKE '%choco%';

-- deuxieme caractere est 'a'
SELECT * FROM client WHERE nom LIKE '_a%';

-- Exactement 5 caracteres
SELECT * FROM produit WHERE nom_produit LIKE '_____';

-- NE commence PAS par 'A'
SELECT * FROM client WHERE nom NOT LIKE 'A%';

-- insensible a la case 
SELECT * FROM produit WHERE LOWER(nom_produit) LIKE '%caf%'

SELECT * FROM produit
WHERE description LIKE '%50\%%' ESCAPE '\\';