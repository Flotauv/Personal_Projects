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

