SET SCHEMA 'distribill';
-- 1.Quels sont les noms des produits commercialisés par l’entreprise ?
SELECT nomp FROM produit;

-- 2.Quels sont les produits originaires de ’Dijon’ ?
SELECT * FROM produit WHERE origine='Dijon';

-- 3.Quels sont les noms des produits originaires de ’Dijon’ ?
SELECT nomp FROM produit WHERE origine='Dijon';

-- 4.Quels sont les numéros des fournisseurs qui fournissent quelque chose ?
SELECT DISTINCT nofour FROM fourniture;

-- 5.Quels sont les numéros des fournisseurs qui ne fournissent rien ?
SELECT nofour FROM fournisseur WHERE nofour NOT IN (SELECT nofour FROM fourniture);

-- 6.Quels sont les numéros des fournisseurs qui fournissent au moins le produit ’P6’ ?
SELECT nofour FROM fourniture WHERE noproduit='P6';

-- 7.Quels sont les numéros des fournisseurs qui fournissent quelque chose d’autre que ’P6’ ?
SELECT DISTINCT nofour FROM fourniture WHERE noproduit!='P6';

-- 8.Quels sont les numéros des fournisseurs qui ne fournissent pas ’P6’ ?
SELECT DISTINCT nofour FROM fournisseur WHERE nofour NOT IN (SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P6');

-- 9.Quels sont les numéros des fournisseurs qui fournissent quelque chose mais pas ’P6’ ? 
SELECT DISTINCT nofour FROM fourniture WHERE nofour NOT IN (SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P6');

-- 10.Quels sont les numéros des Fournisseurs qui ne fournissent que ’P6’ ?
SELECT nofour FROM fourniture WHERE noproduit='P6' AND nofour NOT IN(SELECT nofour FROM fourniture WHERE noproduit!='P6');

-- 11.Quels sont les numéros des fournisseurs qui fournissent ’P4’ ou ’P6’ ?
SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P6' OR noproduit='P4';

-- 12.Quels sont les numéros des fournisseurs qui fournissent ’P4’ et ’P6’ ?
SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P6' INTERSECT SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P4';

-- 13.Quels sont les numéros des fournisseurs qui ne fournissent ni ’P4’ ni ’P6’ ?
SELECT DISTINCT nofour FROM fourniture WHERE nofour NOT IN (SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P6' OR noproduit='P4');

-- 14.Quels sont les numéros et noms des fournisseurs qui fournissent ’P6’ ?
SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour;

-- 15.Quels sont les numéros et noms des fournisseurs qui ne fournissent ni ’P4’ ni ’P6’ ?
SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour WHERE fourniture.nofour NOT IN (SELECT DISTINCT fourniture.nofour FROM fourniture WHERE noproduit='P6' OR noproduit='P4'); ;

-- 16.Quels sont les numéros,noms et villes des fournisseurs qui fournissent au moins un produit originaire de leur ville ?
SELECT DISTINCT fournisseur.nofour, nomf, ville FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.origine=fournisseur.ville;

-- 17.Quels sont les produits qui sont de même couleur ? Le résultat sera présenté par des couples de numéros de produits.
SELECT DISTINCT p1.nomp, p2.nomp
FROM produit p1, produit p2
WHERE p1.couleur=p2.couleur
AND p1.nomp != p2.nomp;

-- 18.Quels sont les produits de même couleur que la salade (certaines salades sont rouges, d’autres vertes ...) ?
SELECT DISTINCT p1.nomp, p2.nomp
FROM produit p1, produit p2
WHERE p1.nomp='Salade'
AND p1.couleur=p2.couleur
AND p1.nomp != p2.nomp;

-- 19.Quels sont les numéros des fournisseurs qui fournissent des produits verts ou rouges ?
SELECT DISTINCT fournisseur.nofour FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Rouge' OR produit.couleur='Vert';

-- 20.Quels sont les numéros des fournisseurs qui fournissent des produits verts et rouges ?
SELECT DISTINCT fournisseur.nofour FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Rouge'
INTERSECT
SELECT DISTINCT fournisseur.nofour FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Vert';


-- 21.Quels sont les numéros et noms des fournisseurs qui ne fournissent pas de produit vert ?
SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE fournisseur.nofour NOT IN 
(SELECT DISTINCT fournisseur.nofour FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Vert');

-- 22.Quels sont les numéros et noms des fournisseurs qui ne fournissent que des produits verts ?
SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE fournisseur.nofour NOT IN 
(SELECT DISTINCT fournisseur.nofour FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur!='Vert');


-- 23.Quels sont les numéros et noms des fournisseurs qui ne fournissent que des produits verts ou jaunes ?
SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Vert'
INTERSECT 
SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Jaune';
