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

-- 5. Insertion des commandes (toutes les possibilités de statut et mode de paiement)
INSERT INTO COMMANDE (numero_commande, date_commande, id_client, id_table, id_employe, statut, montant_total, mode_paiment, commentaire)
VALUES
('CMD-2026-001', '2026-02-15 09:30:00', 1, 1, 3, 'payee', 8.30, 'carte', 'Petit-déjeuner'),
('CMD-2026-002', '2026-02-15 10:15:00', 2, 3, 4, 'payee', 15.50, 'especes', NULL),
('CMD-2026-003', '2026-02-15 12:00:00', 3, 5, 3, 'payee', 22.00, 'mobile', 'Déjeuner groupe'),
('CMD-2026-004', '2026-02-16 08:45:00', 4, 2, 6, 'payee', 6.30, 'cheque', NULL),
('CMD-2026-005', '2026-02-16 14:30:00', 5, 6, 4, 'payee', 12.80, 'carte', 'Terrasse'),
('CMD-2026-006', '2026-02-17 11:00:00', 6, 9, 3, 'payee', 35.50, 'mobile', 'Client VIP fidèle'),
('CMD-2026-007', '2026-02-18 09:00:00', 7, 1, 6, 'payee', 5.30, 'especes', NULL),
('CMD-2026-008', '2026-02-18 16:00:00', 8, 7, 4, 'payee', 9.50, 'carte', NULL),
('CMD-2026-009', '2026-03-01 12:30:00', 9, 4, 3, 'servie', 18.00, NULL, 'Attend le paiement'),
('CMD-2026-010', '2026-03-01 13:00:00', 10, 8, 6, 'servie', 14.30, NULL, NULL),
('CMD-2026-011', '2026-03-02 10:00:00', 1, 3, 4, 'servie', 11.80, NULL, 'Client régulier'),
('CMD-2026-012', '2026-03-02 11:45:00', 2, 5, 3, 'en_cours', 25.50, NULL, 'Grande commande'),
('CMD-2026-013', '2026-03-02 11:50:00', NULL, 6, 6, 'en_cours', 7.00, NULL, 'Client sans compte'),
('CMD-2026-014', '2026-03-02 11:55:00', 3, 10, 4, 'en_cours', 42.00, NULL, 'Réservation VIP'),
('CMD-2026-015', '2026-03-02 12:00:00', NULL, 2, 3, 'en_cours', 4.50, NULL, NULL),
('CMD-2026-016', '2026-02-20 15:00:00', 4, 1, 4, 'annulle', 0.00, NULL, 'Client parti avant service'),
('CMD-2026-017', '2026-02-22 10:30:00', NULL, 4, 6, 'annulle', 0.00, NULL, 'Erreur de commande'),
('CMD-2026-018', '2026-02-25 18:00:00', 5, 7, 3, 'annulle', 0.00, NULL, 'Produit indisponible'),
('CMD-2026-019', '2026-02-28 08:30:00', NULL, 1, 6, 'payee', 4.30, 'especes', 'Emporter'),
('CMD-2026-020', '2026-02-28 14:00:00', NULL, 8, 4, 'payee', 16.50, 'carte', NULL);

-- 6. Insertion des détails de commandes
INSERT INTO DETAIL_COMMANDE (id_commande, id_produit, quantite, prix_unitaire, commentaire)
VALUES
(1, 1, 1, 2.50, NULL),                    -- Espresso
(1, 14, 2, 1.80, NULL),                   -- 2 Croissants
(1, 6, 1, 2.20, 'Peu sucré'),             -- Thé vert
(2, 2, 2, 3.50, NULL),                    -- 2 Cappuccino
(2, 15, 1, 2.00, NULL),                   -- Pain au chocolat
(2, 18, 1, 4.50, NULL),                   -- Cheesecake
(2, 11, 1, 1.50, 'Avec glaçons'),         -- Eau minérale
(3, 21, 2, 8.50, 'Sans croûtons'),        -- 2 Salade César
(3, 9, 1, 3.00, NULL),                    -- Jus d'orange
(3, 11, 2, 1.50, NULL),                   -- 2 Eau minérale
(4, 1, 2, 2.50, 'Double'),                -- 2 Espresso
(4, 14, 1, 1.80, 'Réchauffé'),            -- Croissant
(5, 3, 1, 3.80, NULL),                    -- Latte
(5, 12, 2, 4.50, NULL),                   -- 2 Smoothie fraise
(6, 21, 1, 8.50, NULL),                   -- Salade César
(6, 23, 1, 6.50, NULL),                   -- Quiche lorraine
(6, 18, 2, 4.50, NULL),                   -- 2 Cheesecake
(6, 2, 1, 3.50, 'Extra mousse'),          -- Cappuccino
(6, 8, 2, 3.50, NULL),                    -- 2 Chocolat chaud
(7, 4, 1, 2.80, NULL),                    -- Americano
(7, 10, 1, 2.50, NULL),                   -- Coca Cola
(8, 7, 2, 2.50, 'Bien chaud'),            -- 2 Thé à la menthe
(8, 17, 1, 2.80, NULL),                   -- Muffin chocolat
(8, 13, 1, 3.00, 'Glaçons à côté'),       -- Limonade maison
(9, 22, 2, 5.50, NULL),                   -- 2 Sandwich jambon
(9, 10, 2, 2.50, NULL),                   -- 2 Coca Cola
(9, 11, 2, 1.50, NULL),                   -- 2 Eau minérale
(10, 24, 1, 6.00, 'Extra fromage'),       -- Croque monsieur
(10, 9, 1, 3.00, NULL),                   -- Jus d'orange
(10, 19, 1, 3.80, NULL),                  -- Tarte citron
(10, 11, 1, 1.50, NULL),                  -- Eau minérale
(11, 5, 1, 3.20, NULL),                   -- Café crème
(11, 16, 2, 2.20, NULL),                  -- 2 Chausson aux pommes
(11, 20, 1, 3.50, NULL),                  -- Éclair café
(11, 11, 1, 1.50, 'Fraîche'),             -- Eau minérale
(12, 25, 2, 7.50, 'Sauce à part'),        -- 2 Salade composée
(12, 23, 1, 6.50, NULL),                  -- Quiche lorraine
(12, 13, 1, 3.00, NULL),                  -- Limonade maison
(12, 10, 1, 2.50, NULL),                  -- Coca Cola
(13, 2, 1, 3.50, NULL),                   -- Cappuccino
(13, 20, 1, 3.50, NULL),                  -- Éclair café
(14, 21, 3, 8.50, NULL),                  -- 3 Salade César
(14, 24, 2, 6.00, NULL),                  -- 2 Croque monsieur
(14, 12, 1, 4.50, NULL),                  -- Smoothie fraise
(14, 9, 2, 3.00, 'Frais pressé'),         -- 2 Jus d'orange
(15, 12, 1, 4.50, 'Banane ajoutée'),      -- Smoothie fraise
(19, 1, 1, 2.50, 'À emporter'),           -- Espresso
(19, 14, 1, 1.80, 'À emporter'),          -- Croissant
(20, 22, 1, 5.50, NULL),                  -- Sandwich jambon
(20, 17, 2, 2.80, NULL),                  -- 2 Muffin chocolat
(20, 9, 1, 3.00, NULL),                   -- Jus d'orange
(20, 10, 1, 2.50, NULL);                  -- Coca Cola