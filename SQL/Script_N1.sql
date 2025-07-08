
-- Table complète des produits vendus par l'entreprise
SELECT * FROM DLC.PRODUITS;


-- Table complète des clients totaux de l'entreprise
SELECT * FROM DLC.CLIENT;

-- Selectionner une seule colonne : Selectionner tous les produits vendus par l'entreprise

SELECT NomProduit FROM Produits;

-- Selectionner n colonnes 

SELECT ProduitID,NomProduit FROM PRODUITS;

-- Retourner le nom, prenom des employés de l'entreprise (sans doublons)

SELECT distinct Nom,Prenom FROM DLC.Employes;

-- Retourner le nom, le prix et la description de tous les produits

SELECT distinct NomProduit,PrixUnitaire, Description FROM PRODUITS;

-- Retourner les dates auquelles les ventes ont été réalisées 

SELECT distinct DateVente FROM DLC.Ventes;

-- Donnez la liste de tous les employés qui sont des consultants

SELECT Nom,Prenom FROM DLC.Employes WHERE Fonction='consultant';

-- Donnez la liste des produits où le prix est supérieur à 200 euros

SELECT * FROM DLC.PRODUITS WHERE PrixUnitaire >= 200;

-- Les produits dont les prix est supérieur à 200 euros ou inférieur à 50€

SELECT * FROM DLC.PRODUITS   WHERE PrixUnitaire>= 200 OR PrixUnitaire<=50;

-- Variante : Fonction between

SELECT * FROM DLC.PRODUITS WHERE PrixUnitaire between 50 AND 100;


-- Les informations specifiques du produit Nike Air Max (Fournisseurs etc)

SELECT * FROM DLC.PRODUITS WHERE NomProduit = 'Nike Air Max'; 

-- Avoir des listes comme condition

SELECT * FROM DLC.PRODUITS WHERE FournisseurID IN (12,13,14);

-- Ensemble des clients qui ont un nom commencent par la lettre C
-- Like pour sélectionner selon des conditions
 
 
SELECT * FROM DLC.Client WHERE Nom LIKE "C%";

-- Si on veut le nom des clients qui commencent par la lettre C et finissent par la lettre n 

SELECT * FROM DLC.Client where Nom LIKE "C%A";

-- Le nom contient la lettre c 

SELECT * FROM DLC.Client where Nom LIKE "%c%";


/* =============== ORDER BY ==========
-- Ordonner par ordre décroissant les prix des produits
*/

SELECT * FROM DLC.PRODUITS  WHERE FournisseurID IN (14,2,13,5,34) ORDER BY PrixUnitaire desc;

-- Liste des employés par ordre alphabétique pour le nom 
SELECT * FROM DLC.Employes order by nom asc;
-- Liste des employés par ordre décroissant pour le prénom
SELECT * FROM DLC.Employes order by prenom desc;

-- Résultat : les produits dont le prix est supérieur à 200 et trié par ordre alphabetique

SELECT * FROM DLC.PRODUITS WHERE PrixUnitaire>200 ORDER BY NomProduit asc;
