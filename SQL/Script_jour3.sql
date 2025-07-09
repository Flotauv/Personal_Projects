-- Jour 3 

-- Avoir le nom des clients qui contiennent qu'une fois la lettre 'a' 

SELECT * FROM DLC.CLIENT WHERE NOM LIKE "%a%" AND NOT NOM LIKE "%a%a%";

-- Contient deux occurences de la lettre a

SELECT * FROM DLC.CLient WHERE NOM LIKE "%a%a%";

/* ============== Expressions Regulière ========= */


-- Liste des produits qui comportent TV dans leur nom

-- Avec LIKE
SELECT * FROM DLC.PRODUITS WHERE NomProduit LIKE "%TV%";

-- Avec REGEX

SELECT * FROM DLC.PRODUITS WHERE NomProduit regexp 'TV';

-- Nom des clients qui commencent par la lettre D avec REGEXP

SELECT * FROM DLC.CLIENT WHERE NOM REGEXP '^D';

-- Nom des produits qui se terminent par la lettre M

SELECT * FROM DLC.PRODUITS WHERE NomProduit LIKE "%M";
SELECT * FROM DLC.PRODUITS WHERE NomProduit regexp "M$";

-- Liste des clients dont le numéro contient 'O5' ou 'O4'

SELECT * FROM DLC.CLIENT WHERE NumeroTelephone regexp "04|05|06";

-- Liste des clients qui ont un numéro qui commence par 05 ou se termine par 94

SELECT * FROM DLC.CLIENT WHERE NumeroTelephone regexp "^05|94$";

-- Liste des clients qui ont dans leur nom la lettre R et A mais pas directement suivies

SELECT * FROM DLC.CLIENT WHERE Nom LIKE "%R_a%";

SELECT * FROM DLC.CLIENT WHERE Nom regexp "R.a";

-- Liste des clients qui ont comme nom qui commence par R et se termine par A

SELECT * FROM DLC.CLIENT WHERE Nom LIKE "R%" AND Nom LIKE "%A"; 

SELECT * FROM DLC.CLIENT WHERE Nom REGEXP "R.A";

-- Liste des clients dont le nom contient it , ie , il , is 

SELECT * FROM DLC.CLIENT WHERE Nom REGEXP "i[etls]";

-- liste clients par ordre alphabétique 

SELECT * FROM DLC.CLIENT  order by NOM asc LIMIT 10;

-- 10 produits les plus chères
SELECT * FROM DLC.PRODUITS order by PrixUnitaire desc LIMIT 10;

-- Avoir le nombre de clients dans la base de données

SELECT COUNT(distinct ClientID) AS "NB_CLIENT" FROM DLC.CLIENT; 

-- Calculez la somme des ventes

SELECT SUM(MontantTotal) AS "SOMME_TOTALE" FROM DLC.VENTES;

-- Calculez la moyenne des ventes 

SELECT AVG(MontantTotal) AS "AVG_VENTES" FROM DLC.VENTES;

SELECT MIN(MontantTotal) AS "MIN_VENTE" FROM DLC.VENTES;
SELECT MAX(MontantTotal) AS "MAX_VENTE" FROM DLC.VENTES;

-- Avoir le produit vendu le plus chère et le produit vendu le moins chère

SELECT MIN(PrixUnitaire) AS "Pr - chère", MAX(PrixUnitaire) AS "Pr + chère" FROM DLC.PRODUITS;

