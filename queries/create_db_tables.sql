
-- Table client
CREATE TABLE client (
    id_client INT AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    telephone VARCHAR(20),
    adresse TEXT,
    date_inscription DATE DEFAULT(CURRENT_DATE),
    carte_fidelite BOOLEAN DEFAULT FALSE,
    points_fidelite INT DEFAULT 0,
    date_naissance DATE,
    PRIMARY KEY (id_client),
    CONSTRAINT chk_points CHECK (points_fidelite >= 0)
);

-- Table produit
CREATE TABLE produit (
    id_produit INT AUTO_INCREMENT,
    nom_produit VARCHAR(100) NOT NULL,
    categorie ENUM('Boisson chaude', 'Boisson froide', 'Viennoiserie','Patisserie' , 'Plat') NOT NULL,
    prix_unitaire DECIMAL(6,2) NOT NULL,
    stock_disponible INT DEFAULT 0,
    stock_min INT DEFAULT 10,
    description TEXT,
    date_ajout DATE DEFAULT(CURRENT_DATE),
    actif BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_produit),
    CONSTRAINT chk_prix CHECK (prix_unitaire > 0),
    CONSTRAINT chk_stock CHECK (stock_disponible >= 0)
);

-- Table Employe
CREATE TABLE employe (
    id_employe INT AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    post ENUM('manager', 'barista', 'server', 'serveuse', 'cuisinier', 'caissier') NOT NULL,
    date_embauche DATE NOT NULL,
    salaire DECIMAL(8,2),
    telephone VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    adresse TEXT,
    actif BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_employe),
    CONSTRAINT chk_salaire CHECK (salaire > 0)
);

CREATE TABLE TABLE_RESTAURANT (
    id_table INT AUTO_INCREMENT,
    numero_table INT NOT NULL UNIQUE,
    capacite INT NOT NULL, 
    emplacement ENUM('interieur','terasse', 'vip') DEFAULT 'interieur',
    est_disponible BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_table),
    CONSTRAINT chk_capacite CHECK (capacite > 0 AND capacite <= 20)
);


-- Table commande
CREATE TABLE commande (
    id_commande INT AUTO_INCREMENT,
    numero_commande VARCHAR(20) UNIQUE NOT NULL,
    date_commande DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_client INT,
    id_table INT,
    id_employe INT,
    statut ENUM('en_cours', 'servie', 'payee', 'annulle') DEFAULT 'en_cours',
    montant_total DECIMAL(8,2),
    mode_paiment ENUM('especes', 'carte','cheque', 'mobile'),
    commentaire TEXT,
    PRIMARY KEY (id_commande),
    FOREIGN KEY (id_client) REFERENCES client(id_client) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (id_table) REFERENCES TABLE_RESTAURANT(id_table) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (id_employe) REFERENCES employe(id_employe) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT chk_montant CHECK (montant_total >= 0)
);

-- Table detail_commande
CREATE TABLE detail_commande (
    id_detail INT AUTO_INCREMENT,
    id_commande INT NOT NULL,
    id_produit INT NOT NULL,
    quantite INT NOT NULL DEFAULT 1,
    prix_unitaire DECIMAL(5,2) NOT NULL,
    commentaire VARCHAR(200),
    PRIMARY KEY (id_detail),
    FOREIGN KEY (id_commande) REFERENCES commande(id_commande) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_quantite CHECK (quantite > 0)
);