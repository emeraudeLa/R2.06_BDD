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


--(i) Le nombre de fournisseurs différents par couleurs de produits.


--(j) Les numéros des fournisseurs ayant fourni la plus grande variété de produits.


--(k) Les numéros et noms des fournisseurs qui fournissent la plus grande quantité cumulée de produits verts.


--(l) Les numéros des fournisseurs qui fournissent tous les produits originaires de « Dijon ». On recherchera les fournisseurs dont l’image dans FOURNITURE est égale à l’ensemble des produits originaires de dijon.

--(m) Les numéros des fournisseurs qui fournissent tous les produits originaires de leur ville.


--(n) Les numéros des fournisseurs qui fournissent exactement les mêmes produits. Le résultat sera représenté sous forme de couples de numéros de fournisseurs.


--(o) Les couples de numéros de fournisseurs qui ne fournissent aucun produit en commun.

