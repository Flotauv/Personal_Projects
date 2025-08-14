/* Jour 5 */

-- Ecrire une requete pour créer des categories de produits :

-- Prix <200 petit budget , 200 - 500 : moyen budget , >500 grand budget

SELECT *, CASE
	WHEN PrixUnitaire<200 THEN "low_budget"
	WHEN PrixUnitaire BETWEEN 200 AND 500 THEN "medium_budget"
	WHEN PrixUnitaire>500 THEN "high_budget"
END AS "Product_type"
FROM PRODUITS;

-- Étiquette sur chaque produit qui indique si le nombre de ventes est <50 , entre 50 et 100 ou >100

SELECT *, CASE
	WHEN QuantiteVendue<50 THEN "low_ordered"
	WHEN QuantiteVendue BETWEEN 50 AND 100 THEN "medium_ordered"
	WHEN QuantiteVendue>100 THEN "high_ordered"
END AS "Product_ordered"
FROM VENTES;

-- Donnez le nom prenom de l'employe qui a réalisé une vente

SELECT EmployeID, nom, prenom ,CASE 
									WHEN COUNT(VenteID)=0 THEN "pas_vente"
                                    WHEN COUNT(VenteID)=1 THEN "1 vente"
                                    WHEN COUNT(VenteID)>1 THEN "bcp vente"
								END AS "NB_ventes"
FROM Employes 
LEFT JOIN VENTES USING(EmployeID)
GROUP BY EmployeID, nom, prenom;

-- Creation catégorie client selon le montant de leur achât.

SELECT ClientID, nom, prenom ,CASE 
									WHEN SUM(MontantTotal)<1000 THEN "silver"
                                    WHEN SUM(MontantTotal) BETWEEN 1000 AND 5000 THEN "gold"
                                    WHEN SUM(MontantTotal)> 5000 THEN "prenium"
								END AS "customer_categorie"
FROM CLIENT
LEFT JOIN VENTES USING(CLientID)
WHERE ClientID in (SELECT clientID FROM VENTES )
GROUP BY ClientID, nom, prenom;


-- Donnez les produits qui n'ont pas été vendus en 2023
SELECT ProduitID,NomProduit
FROM PRODUITS
WHERE ProduitID NOT IN (SELECT ProduitID FROM VENTES WHERE YEAR(DateVente) = 2023);

-- Quels clients ont un historique d'achat supérieur à la moyenne des achats ? 

SELECT ClientID, Nom, Prenom
FROM CLIENT
WHERE ClientID IN (SELECT ClientID FROM VENTES WHERE MontantTotal>(SELECT AVG(MontantTotal) FROM VENTES));

-- Avec un LEFT JOIN 
SELECT ClientID, Nom, Prenom
FROM CLIENT
LEFT JOIN VENTES USING(ClientID)
WHERE MontantTotal>(SELECT AVG(MontantTotal) FROM VENTES);

-- Quels sont les produits qui ont un prix unitaire supérieur à la moyenne des prix. 
SELECT ProduitID, NomProduit 
FROM PRODUITS 
WHERE PrixUnitaire > (SELECT AVG(PrixUnitaire) FROM PRODUITS);

-- Donnez la liste des employés qui ont réalisé aucunes ventes durant le mois de décembre 2022. 

SELECT EmployeID, Nom, Prenom
FROM Employes
WHERE EmployeID NOT IN (SELECT EmployeID FROM VENTES WHERE YEAR(DateVente)= 2022 AND MONTH(DateVente)=12);

/* Avec un left join */

SELECT EmployeID, Nom, Prenom
FROM Employes
LEFT JOIN VENTES USING(EmployeID)
WHERE EmployeID NOT IN (SELECT EmployeID FROM VENTES WHERE YEAR(DateVente)= 2022 AND MONTH(DateVente)=12);

-- Lister les clients qui n'ont jamais réalisé d'achat

SELECT *
FROM Client
WHERE ClientID NOT IN (SELECT ClientID FROM VENTES);

/* ======= Utilisation des sous requêtes dans la clause FROM ======== */

-- Donnez pour chaque employé, le nom, le prénom et la moyenne des ventes annuelles



SELECT EmployeID,YEAR(DateVente) as "Annee", SUM(MontantTotal) as "CA"
FROM VENTES 
GROUP BY EmployeID,Annee;

SELECT EmployeID,Nom,Prenom,Annee, AVG(CA)
FROM
	(SELECT v.EmployeID,Nom,Prenom,YEAR(DateVente) as "Annee", SUM(MontantTotal) as "CA"
	FROM VENTES v
    INNER JOIN Employes USING(EmployeID)
	GROUP BY EmployeID,Annee) AS temp

GROUP BY EmployeID,Nom,Prenom,Annee;


-- Taux de croissance du CA entre 2021 - 2022 

-- Calcul du CA de 2021 

SELECT SUM(MontantTotal) AS CA_2021 
FROM VENTES
WHERE YEAR(DateVente) = 2021;

-- Calcul du CA de 2022 

SELECT SUM(MontantTotal) AS CA_2022
FROM VENTES
WHERE YEAR(DateVente) = 2022;

SELECT ((CA_2022 - CA_2021)/CA_2021)*100 AS "Taux_croissance"
FROM (
	SELECT SUM(MontantTotal) AS CA_2021 
	FROM VENTES
	WHERE YEAR(DateVente) = 2021) as temp,
    
    (SELECT SUM(MontantTotal) AS CA_2022
	FROM VENTES
	WHERE YEAR(DateVente) = 2022) as temp2;

-- Donner la liste des 10 clients qui ont la moyenne d'achat annuelle la plus élevée.

-- Calcul de la moyenne d'achat annuelle :

SELECT ClientID,Nom, Prenom , YEAR(DateVente) AS "Année", SUM(MontantTotal) AS "Somme_achat" 
FROM VENTES
LEFT JOIN CLIENT USING(ClientID)
GROUP BY ClientID,Nom,Prenom,Année;

SELECT ClientID, Nom,Prenom, AVG(Somme_achat) AS "moyenne_achat_annuelle"
FROM (
		SELECT ClientID,Nom, Prenom , YEAR(DateVente) AS "Année", SUM(MontantTotal) AS "Somme_achat" 
		FROM VENTES
		LEFT JOIN CLIENT USING(ClientID)
		GROUP BY ClientID,Nom,Prenom,Année
	) AS temp
GROUP BY ClientID,Nom,Prenom
ORDER BY moyenne_achat_annuelle DESC
LIMIT 10;

/* ======= Joindre plusieurs tables ====== */

SELECT *
FROM Employes emp
	LEFT JOIN Ventes ve USING(EmployeID)
    LEFT JOIN Produits p USING(ProduitID);

-- Donnez la liste des fournisseurs , client et nom produit de ceux qui ont été acheté plus de 1 fois

-- Liste des produits achetés plus de 1 fois
SELECT * 
FROM 
	(
	SELECT ProduitID, COUNT(VenteID) AS "NB_achats"
	FROM Ventes
	GROUP BY ProduitID
	HAVING NB_achats>1
	) as t 
    JOIN PRODUITS USING(ProduitID)
    JOIN VENTES USING(ProduitID)
    JOIN Client USING(ClientID);
    

-- Probleme car on a p
    

SELECT ProduitID,NomProduit,FournisseurID,NomFournisseur,ClientID,Nom,Prenom 
FROM (
	SELECT ProduitID, NomProduit, SUM(QuantiteVendue) AS "NB_achats"
	FROM PRODUITS
	LEFT JOIN VENTES USING(ProduitID)
	GROUP BY ProduitID, NomProduit
    )
LEFT JOIN Fournisseurs USING(ProduitID)
LEFT JOIN 
