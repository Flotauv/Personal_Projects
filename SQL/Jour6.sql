/* =========================== SQL jour 6 ========================== */


-- FCT de fenêtrage --  

SELECT ProduitID, NomProduit, SUM(QuantiteVendue) AS "Nb_produits"
FROM PRODUITS
INNER JOIN VENTES using (ProduitID)
GROUP BY ProduitID,NomProduit
ORDER BY CA DESC;

-- On va mettre un classement sur ls produits en fonction du nombre de ventes

SELECT ProduitID,SUM(QuantiteVendue) as "Nb_produits", -- Attention la variable Nb_produits n'existe pas encore
	DENSE_RANK() OVER(ORDER BY SUM(QuantiteVendue) DESC) AS Classement
FROM Ventes
GROUP BY ProduitID;

-- Ajoutez avec le nom et prénom des employés qui ont réalisé le plus grand chiffre d'affaire

SELECT EmployeID,Nom,Prenom,SUM(MontantTotal) AS "CA",
	DENSE_RANK()
    OVER(ORDER BY SUM(MontantTotal) DESC) AS Classement
FROM Ventes
INNER JOIN Employes USING(EmployeID)
GROUP BY EmployeID;


-- Donnez par année de top 3 des meilleurs vendeurs


SELECT EmployeID, Nom, Prenom, YEAR(DateVente) as "Annee",SUM(MontantTotal) as "CA",
	DENSE_RANK()
    OVER( PARTITION BY YEAR(DateVente)) AS Classement
FROM Ventes v
INNER JOIN Employes USING(EmployeID)
GROUP BY EmployeID,Nom,Prenom,Annee;

CREATE VIEW classement AS
SELECT EmployeID,Nom,Prenom,Annee,CA,Classement
FROM ( SELECT EmployeID,Nom,Prenom,YEAR(DateVente) AS Annee,SUM(MontantTotal) AS "CA", 
	RANK()
    OVER(
    PARTITION BY(YEAR(DateVente))
    ORDER BY SUM(MontantTotal) DESC
    ) AS Classement
FROM Ventes v
INNER JOIN Employes USING(EmployeID)
GROUP BY EmployeID,Nom,Prenom,YEAR(DateVente)) AS temp
WHERE Classement BETWEEN 1 AND 3;

/* Donnez le top 3 des clients en terme de chiffre d'affaires par trimestre fct QUARTER */

SELECT * FROM (
SELECT EmployeID,Nom,Prenom, YEAR(DateVente) AS "Annee",QUARTER(DateVente) as Trimestre, SUM(MontantTotal) as "CA",
	DENSE_RANK()
	OVER(
	PARTITION BY (QUARTER(DateVente)) 
	ORDER BY SUM(MontantTotal) DESC) AS Classement
FROM VENTES
JOIN Employes USING(EmployeID)
GROUP BY EmployeID,Annee,Trimestre) AS Classement
WHERE Classement BETWEEN 1 AND 3;  

-- Fonction LAG 

SELECT YEAR(DateVente) as "Annee", SUM(MontantTotal) AS "CA"
FROM Ventes
GROUP BY Annee;

SELECT YEAR(DateVente) as "Annee", SUM(MontantTotal) AS "CA", SUM(MontantTotal) - LAG(SUM(MontantTotal),1,0)
	OVER( ORDER BY YEAR(DateVente)) AS DIFF
FROM Ventes
GROUP BY Annee;
	
/* taux de croissance */

SELECT YEAR(DateVente) as "Annee", SUM(MontantTotal) AS "CA", (SUM(MontantTotal) - LAG(SUM(MontantTotal),1,0)
	OVER( ORDER BY YEAR(DateVente))) / (LAG(SUM(MontantTotal),1,0) OVER (ORDER BY YEAR(DateVente)))*100 AS Tx_croissance
FROM Ventes
GROUP BY Annee;

/* ventes totales par trimestre pour chaque année et comment les ventes ont évoluéalter */

SELECT YEAR(DateVente) as "Annee",QUARTER(DateVente) AS Trimestre, SUM(MontantTotal) AS "CA", (SUM(MontantTotal) - LAG(SUM(MontantTotal),1,0)
	OVER( ORDER BY YEAR(DateVente))) / (LAG(SUM(MontantTotal),1,0) OVER (ORDER BY YEAR(DateVente)))*100 AS Tx_croissance
FROM Ventes
GROUP BY Annee,Trimestre;


SELECT YEAR(DateVente) as Annee ,QUARTER(DateVente) AS Trimestre, AVG(MontantTotal) AS CA, 
	RANK()
    OVER (PARTITION BY  YEAR(DateVente), QUARTER(DateVente) ORDER BY AVG(MontantTotal) DESC ) AS Classement,
    (AVG(MontantTotal) - LAG(AVG(MontantTotal),1,0) OVER ( ORDER BY QUARTER(DateVente))) / (LAG(AVG(MontantTotal),1,0) OVER (ORDER BY QUARTER(DateVente)))*100 AS Tx_croissance
FROM VENTES
GROUP BY YEAR(DateVente),QUARTER(DateVente);

