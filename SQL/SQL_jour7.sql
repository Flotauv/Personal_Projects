/* ============ Synthèse + découverte fcts ============== */

-- ROW_NUMBER()

SELECT *,
		ROW_NUMBER()
        OVER() AS Lignes
FROM VENTES;


-- LEAD/ LAG 

SELECT YEAR(DateVente) AS Annee,
		SUM(MontantTotal) AS CA,
        LAG(SUM(MontantTotal),1,0) OVER(ORDER BY YEAR(DateVEnte)) AS CAPrecedent,
        LEAD(SUM(MontantTotal),1,0) OVER(ORDER BY YEAR(DateVente)) AS CAPSuivant
FROM VENTES
GROUP BY Annee;

-- FIRST VALUE / LAST VALUE()
-- Donnez le premier produit que le client a acheté, il faut donc partitionner la base 
SELECT ClientID,ProduitID,DateVente, 
		FIRST_VALUE(ProduitID) 
        OVER(PARTITION BY ClientID ORDER BY DateVente ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS PremierAchat
FROM Ventes;
        
-- CTE 
SELECT ClientID,YEAR(DateVente) AS Annee, SUM(MontantTotal) AS CA
    FROM VENTES
    GROUP BY Annee,ClientID;
WITH CA_table AS (
	SELECT ClientID,YEAR(DateVente) AS Annee, SUM(MontantTotal) AS CA,
    RANK() OVER(PARTITION BY YEAR(DateVente) ORDER BY (SUM(MontantTotal)) DESC) AS Classement
    FROM VENTES
    GROUP BY Annee,ClientID
)
SELECT * 
FROM CA_table
WHERE Classement BETWEEN 1 AND 3;

-- Les clients qui ont dépensé plus en moyenne que la moyenne des clients 

/* On cherche combien ont dépensé les clients en tout */

SELECT AVG(MontantTotal) AS Moyenne_ref FROM Ventes;

SELECT ClientID,Nom,Prenom, SUM(MontantTotal) AS CA
FROM Ventes
INNER JOIN Client USING(ClientID)
GROUP BY ClientID,Nom,Prenom
HAVING CA > AVG(MontantTotal);

-- Ou avec le WHERE avec sous requête

WITH avg_table AS (
SELECT ClientID,SUM(MontantTotal) AS CA
FROM Ventes
GROUP BY ClientID)
SELECT *
FROM avg_table
WHERE CA > (SELECT AVG(MontantTotal) AS Moyenne_ref FROM Ventes);


/* ======== Fcts ensemblistes ========= */

-- Donnez la liste combinée des noms de tous les employés et de tous les clients

SELECT Nom
FROM Employes
UNION
SELECT Nom
FROM Client
UNION
SELECT NomFournisseur AS Nom
FROM Fournisseurs;


INSERT INTO Employes(EmployeID,Nom,Prenom,Email,Fonction,NumeroTelephone) VALUES(200,"Kevin","Jean","kevjea,@gmail.com","cadre",098745);

UPDATE 
SET PrixUnitaire = 100
WHERE Nom = "Nike Air Max";

