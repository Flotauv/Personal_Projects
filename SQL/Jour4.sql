-- Jour 4 : Jointures 


-- Produit Cartésien 

SELECT * 
FROM DLC.VENTES,DLC.Employes
WHERE DLC.VENTES.EmployeID = DLC.Employes.EmployeID;

-- Ce

-- Donner pour chaque vente le nom et le prénom de l'employé qui a réalisé la vente 

SELECT VenteID,Nom,Prenom
FROM DLC.VENTES INNER JOIN DLC.Employes ON DLC.Ventes.EmployeID = DLC.Employes.EmployeID;

-- Utilisation USING 

SELECT VenteID,Nom,Prenom
FROM DLC.VENTES INNER JOIN DLC.Employes USING(EmployeID);

-- Pour chaque produit donner le nom du fournisseur 

SELECT DLC.Fournisseurs.NomFournisseur, DLC.Fournisseurs.Adresse , NomProduit
FROM DLC.PRODUITS INNER JOIN DLC.Fournisseurs USING(FournisseurID);

-- Donner le nom et le prenom des employés ayant réalisé la somme des ventes les plus élevées

SELECT EmployeID, SUM(MontantTotal) AS "CA" ,Nom,Prenom
FROM Employes INNER JOIN VENTES USING(EmployeID)
GROUP BY EmployeID,Nom,Prenom
ORDER BY CA desc;

-- Donner pour chaque client le nom , l'adresse ainsi que le nombre d'achat réalisé.

SELECT ClientID,Nom,Prenom,Adresse, COUNT(VENTES.VenteID) AS "NB_ACHATS"
FROM CLIENT JOIN VENTES USING(ClientID)
GROUP BY ClientID,Nom,Prenom,Adresse
ORDER BY NB_ACHATS DESC;


/*==================== LEFT JOIN , RIGHT JOIN ====================*/

-- Donner pour chaque employé le nom , le prenom , le nombre de ventes réalisé (même ceux qui n'ont pas réalisé de ventes).

SELECT EmployeID,Nom,Prenom, COUNT(VenteID) AS "NB_VENTE"
FROM Employes 
LEFT JOIN VENTES USING(EmployeID)
GROUP BY EmployeID,Nom,Prenom
ORDER BY NB_VENTE DESC ;

-- Donnez pour chaque fournisseur son nom , son email , et le nombre de produits fournis (laissez les fournieeurs qui ne fournissent pas de produits)

SELECT NomFournisseur,Email, COUNT(p.ProduitID) AS "NB_PRODUIT_FOURNIS"
FROM Fournisseurs f
LEFT JOIN PRODUITS p USING(FournisseurID)
GROUP BY NomFournisseur,Email
ORDER BY NB_PRODUIT_FOURNIS DESC;

-- Donnez le nom, le prenom et la moyenne des ventes par client (conservez les clients qui n'ont pas de ventes)

SELECT Nom,Prenom , COALESCE(AVG(MontantTotal),0) AS "MOY_VENTES" 
FROM CLIENT 
LEFT JOIN VENTES USING(ClientID)
GROUP BY Nom,Prenom
ORDER BY MOY_VENTES DESC;

SELECT ClientID,Nom,Prenom , COALESCE(SUM(MontantTotal),0) AS "SOMME_ACHAT" 
FROM CLIENT 
LEFT JOIN VENTES USING(ClientID)
GROUP BY CLientID,Nom,Prenom
ORDER BY SOMME_ACHAT DESC;

-- Création de vue : Ensemble des ventes de l'année 2021

CREATE VIEW Vente2021_3 AS 
SELECT *
FROM VENTES v
WHERE YEAR(DateVente) = 2021;

-- Creation d'une vue des produits dont le prix est supérieur à 500€
CREATE VIEW Prod2Sup500 AS
SELECT *
FROM PRODUITS 
WHERE PrixUnitaire >= 500;

-- Sous requête SQL -- 

-- Donnez la liste des clients qui ont réalisé aucun achat.

SELECT * 
FROM CLIENT 
WHERE ClientID NOT IN (SELECT ClientID FROM VENTES);

-- Client qui ont réalisé au moins une vente 

SELECT * 
FROM CLIENT 
WHERE ClientID IN (SELECT ClientID FROM VENTES);