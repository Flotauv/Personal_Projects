-- Creation tables
CREATE TABLE DLC.CLIENT (
	ClientID INT PRIMARY KEY,
    Nom varchar(50),
    Prenom varchar(50),
    Adresse varchar(100),
    Email varchar(50),
    NumeroTelephone varchar(15)
);

CREATE TABLE DLC.PRODUITS (
ProduitID INT primary key,
NomProduit varchar(20),
Description TEXT,
PrixUnitaire DECIMAL(10,2)
);

CREATE TABLE DLC.VENTES (
VenteID INT primary key,
DateVente DATE,
ClientID INT references CLIENT(ClientID),
ProduitID INT references PRODUIT(ProduitID),
QuantiteVendue INT,
MontantTotal decimal(5,2)
);

-- Ajout d'éléments dans les tables


INSERT INTO DLC.CLIENT (ClientID, Nom, Prenom, Adresse,Email, NumeroTelephone) 
VALUES 
	(1, 'Doe', 'John', '123 Rue de la Demo', 'john.doe@email.com', '1234567890'),
	(2, 'Smith', 'Alice', '456 Avenue Exemple', 'alice.smith@email.com', '9876543210'),
    (3, 'Johnson', 'Bob', '789 Rue Test', 'bob.johnson@email.com', '5551234567'),
    (4, 'Garcia', 'Maria', '321 Elm Street', 'maria.garcia@email.com', '9998887777'),
    (5, 'Chen', 'Li', '555 Oak Avenue', 'li.chen@email.com', '1112223333');

DESCRIBE DLC.CLIENT;
DESCRIBE DLC.PRODUITS;

-- Insertion de données de démonstration dans la table "Produits"
INSERT INTO DLC.Produits (ProduitID, NomProduit, Description, PrixUnitaire)
VALUES
    (1, 'Produit A', 'Description du Produit A', 10.99),
    (2, 'Produit B', 'Description du Produit B', 15.99),
    (3, 'Produit C', 'Description du Produit C', 8.49),
    (4, 'Produit D', 'Description du Produit D', 22.50),
    (5, 'Produit E', 'Description du Produit E', 12.75);
    
-- Insertion de données de démonstration dans la table "Ventes"
INSERT INTO DLC.Ventes (VenteID, DateVente, ClientID, ProduitID, QuantiteVendue, MontantTotal)
VALUES
    (1, '2023-01-15', 1, 1, 5, 54.95),
    (2, '2023-01-16', 2, 1, 3, 32.97),
    (3, '2023-01-17', 3, 2, 2, 31.98),
    (4, '2023-01-18', 4, 3, 4, 33.96),
    (5, '2023-01-19', 5, 4, 1, 22.50);




