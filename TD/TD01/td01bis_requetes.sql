SET SCHEMA 'distribill';
--(a) Pour chaque fournisseur ayant honoré une commande, la variété en nombre de produits différents commandés.
SELECT COUNT(noproduit),nofour
FROM fourniture
GROUP BY nofour;

--(b) Pour chaque fournisseur ayant honoré une commande, la variété en nombre de produits différents commandés ainsi que la quantite globale de produit commandé.
SELECT COUNT(noproduit) AS variete,SUM(quantite) AS global,nofour
FROM fourniture
GROUP BY nofour;

--(c) Pour chaque fournisseur ayant honoré une commande, le nombre de produits verts commandés ainsi que la quantité globale de produits verts commandés.
SELECT COUNT(fourniture.noproduit) AS nb_produit_vert,SUM(quantite) AS qte_commandee,nofour
FROM fourniture
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE couleur='Vert'
GROUP BY nofour;

--(d) Les numéros des fournisseurs ayant fourni plus de 2 produits différents.
WITH fourn AS(
SELECT COUNT(noproduit) AS nb_produit_diff,nofour
FROM fourniture
GROUP BY nofour)
SELECT nb_produit_diff,nofour
FROM fourn
WHERE nb_produit_diff>=2;

--(e) La quantité moyenne de produits fournis par couleurs.
SELECT AVG(fourniture.quantite) AS moyenne,produit.couleur
FROM fourniture
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
GROUP BY produit.couleur;

--(f) La quantité maximum de produits fournis par noms de fournisseurs (on ne distinguera pas les deux Bourhis dans un premier temps).
SELECT SUM(fourniture.quantite) AS quantite_max,nomf
FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
GROUP BY nomf;

--(g) Les numéros des fournisseurs fournissant une quantité de produit supérieur à 10.
WITH qte AS(
SELECT SUM(fourniture.quantite) AS quantite_max,fourniture.nofour
FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
GROUP BY fourniture.nofour)
SELECT *
FROM qte
WHERE quantite_max>=10;

--(h) Le nom et la quantité minimum fournie pour chaque produit originaire de Dijon.
SELECT DISTINCT nomp, MIN(quantite)
FROM fourniture
INNER JOIN produit ON fourniture.noproduit = produit.noproduit
WHERE origine='Dijon'
GROUP BY nomp;

--(i) Le nombre de fournisseurs différents par couleurs de produits.
SELECT COUNT(fourniture.nofour) AS nbFour, couleur
FROM fourniture
INNER JOIN produit ON fourniture.noproduit = produit.noproduit
GROUP BY couleur;

--(j) Les numéros des fournisseurs ayant fourni la plus grande variété de produits.
SELECT COUNT(DISTINCT noproduit) AS variete, nofour
FROM fourniture
GROUP BY nofour;

--(k) Les numéros et noms des fournisseurs qui fournissent la plus grande quantité cumulée de produits verts.
SELECT fourniture.nofour, nomf, SUM(fourniture.quantite) AS qteVert
FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour = fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit = produit.noproduit
WHERE couleur='Vert'
GROUP BY fourniture.nofour, nomf;

--(l) Les numéros des fournisseurs qui fournissent tous les produits originaires de « Dijon ». On recherchera les fournisseurs dont l’image dans FOURNITURE est égale à l’ensemble des produits originaires de dijon.
WITH proDij AS(
SELECT noproduit
FROM produit
WHERE origine='Dijon')
SELECT fourniture.nofour,fourniture.noproduit
FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour = fournisseur.nofour
INNER JOIN proDij ON fourniture.noproduit = proDij.noproduit
GROUP BY fourniture.nofour, fourniture.noproduit;

--Correction du (l)
SELECT f1.nofour
FROM fournisseur f1
WHERE NOT EXISTS (
SELECT p.noproduit
FROM produit p
WHERE p.origine='Dijon'
AND NOT EXISTS (
SELECT *
FROM fourniture f2
WHERE f2.noproduit = p.noproduit
AND f2.nofour = f1.nofour));

--(m) Les numéros des fournisseurs qui fournissent tous les produits originaires de leur ville.
SELECT f1.nofour
FROM fournisseur f1
WHERE NOT EXISTS (
SELECT p.noproduit
FROM produit p
WHERE p.origine=f1.ville
AND NOT EXISTS (
SELECT *
FROM fourniture f2
WHERE f2.noproduit = p.noproduit
AND f2.nofour = f1.nofour));

--(n) Les numéros des fournisseurs qui fournissent exactement les mêmes produits. Le résultat sera représenté sous forme de couples de numéros de fournisseurs.


--(o) Les couples de numéros de fournisseurs qui ne fournissent aucun produit en commun.
SELECT DISTINCT f1.nofour, f2.nofour FROM fournisseur f1, fournisseur f2
WHERE f1.nofour < f2.nofour
AND NOT EXISTS (
SELECT 1 FROM fourniture do1
JOIN fourniture fo2 ON fo1.noproduit=fo2.noproduit
WHERE fo1.nofour=f1.nofour
AND fo2.nofour=f2.nofour);
