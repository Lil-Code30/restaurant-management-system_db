-- 1. Insertion des produits
INSERT INTO PRODUIT (nom_produit, categorie, prix_unitaire, stock_disponible, description)
VALUES
('Espresso', 'Boisson chaude', 2.50, 100, 'Café court et corsé'),
('Cappuccino', 'Boisson chaude', 3.50, 100, 'Espresso avec mousse de lait'),
('Latte', 'Boisson chaude', 3.80, 100, 'Café au lait onctueux'),
('Americano', 'Boisson chaude', 2.80, 100, 'Espresso allongé'),
('Café crème', 'Boisson chaude', 3.20, 80, 'Café avec crème'),
('Thé vert', 'Boisson chaude', 2.20, 80, 'Thé vert nature'),
('Thé à la menthe', 'Boisson chaude', 2.50, 70, 'Thé vert à la menthe'),
('Chocolat chaud', 'Boisson chaude', 3.50, 60, 'Chocolat onctueux'),
('Jus d''orange', 'Boisson froide', 3.00, 50, 'Jus pressé 100%'),
('Coca Cola', 'Boisson froide', 2.50, 100, 'Soda 33 cl'),
('Eau minérale', 'Boisson froide', 1.50, 150, 'Eau 50 cl'),
('Smoothie fraise', 'Boisson froide', 4.50, 30, 'Smoothie frais'),
('Limonade maison', 'Boisson froide', 3.00, 40, 'Limonade artisanale'),
('Croissant', 'Viennoiserie', 1.80, 40, 'Croissant pur beurre'),
('Pain au chocolat', 'Viennoiserie', 2.00, 35, 'Pain au chocolat artisanal'),
('Chausson aux pommes', 'Viennoiserie', 2.20, 25, 'Chausson fait maison'),
('Muffin chocolat', 'Patisserie', 2.80, 25, 'Muffin au chocolat'),
('Cheesecake', 'Patisserie', 4.50, 15, 'Cheesecake New York style'),
('Tarte citron', 'Patisserie', 3.80, 20, 'Tarte au citron meringuée'),
('Éclair café', 'Patisserie', 3.50, 18, 'Éclair au café'),
('Salade César', 'Plat', 8.50, 20, 'Salade César poulet'),
('Sandwich jambon', 'Plat', 5.50, 30, 'Sandwich jambon beurre'),
('Quiche lorraine', 'Plat', 6.50, 18, 'Quiche maison'),
('Croque monsieur', 'Plat', 6.00, 25, 'Croque monsieur gratiné'),
('Salade composée', 'Plat', 7.50, 20, 'Salade de saison');

-- 2. Insertion des clients
INSERT INTO CLIENT (nom, prenom, email, telephone, carte_fidelite, points_fidelite, date_naissance)
VALUES
('Alami', 'Fatima', 'f.alami@email.com', '0612345678', TRUE, 150, '1985-03-15'),
('Bennani', 'Youssef', 'y.bennani@email.com', '0623456789', TRUE, 220, '1990-07-22'),
('Chakir', 'Amina', 'a.chakir@email.com', '0634567890', FALSE, 0, '1995-11-08'),
('Drissi', 'Mohamed', 'm.drissi@email.com', '0645678901', TRUE, 85, '1988-01-30'),
('El Fassi', 'Laila', 'l.elfassi@email.com', '0656789012', FALSE, 0, '1992-05-18'),
('Filali', 'Rachid', 'r.filali@email.com', '0667890123', TRUE, 310, '1983-09-25'),
('Hamdi', 'Sanaa', 's.hamdi@email.com', '0678901234', TRUE, 125, '1987-12-12'),
('Idrissi', 'Karim', 'k.idrissi@email.com', '0689012345', FALSE, 0, '1998-04-05'),
('Jabri', 'Nadia', 'n.jabri@email.com', '0690123456', TRUE, 180, '1991-08-20'),
('Kettani', 'Omar', 'o.kettani@email.com', '0601234567', FALSE, 0, '1996-02-14');

-- 3. Insertion des tables du restaurant
INSERT INTO TABLE_RESTAURANT (numero_table, capacite, emplacement)
VALUES
(1, 2, 'interieur'),
(2, 2, 'interieur'),
(3, 4, 'interieur'),
(4, 4, 'interieur'),
(5, 6, 'interieur'),
(6, 2, 'terasse'),
(7, 4, 'terasse'),
(8, 4, 'terasse'),
(9, 8, 'vip'),
(10, 6, 'vip');

-- 4. Insertion des employés
INSERT INTO EMPLOYE (nom, prenom, post, date_embauche, salaire, telephone, email)
VALUES
('Tahiri', 'Hassan', 'manager', '2023-01-15', 8000.00, '0661234567', 'h.tahiri@cafe.com'),
('Mansouri', 'Sara', 'barista', '2023-03-20', 4500.00, '0672345678', 's.mansouri@cafe.com'),
('Kadiri', 'Omar', 'server', '2024-01-10', 4000.00, '0683456789', 'o.kadiri@cafe.com'),
('Benslimane', 'Nadia', 'server', '2024-02-15', 4000.00, '0694567890', 'n.benslimane@cafe.com'),
('Zahraoui', 'Mehdi', 'cuisinier', '2023-06-01', 5500.00, '0605678901', 'm.zahraoui@cafe.com'),
('Amrani', 'Leila', 'server', '2024-03-01', 4000.00, '0616789012', 'l.amrani@cafe.com'),
('Berrada', 'Youssef', 'barista', '2023-09-15', 4500.00, '0627890123', 'y.berrada@cafe.com'),
('Chraibi', 'Samira', 'caissier', '2024-04-01', 4200.00, '0638901234', 's.chraibi@cafe.com');