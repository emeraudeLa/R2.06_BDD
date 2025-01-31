SET SCHEMA 'distribill';

SELECT nomp FROM produit;

SELECT * FROM produit WHERE origine='Dijon';

SELECT nomp FROM produit WHERE origine='Dijon';

SELECT DISTINCT nofour FROM fourniture;

SELECT nofour FROM fournisseur WHERE nofour NOT IN (SELECT nofour FROM fourniture);

SELECT nofour FROM fourniture WHERE noproduit='P6';

SELECT DISTINCT nofour FROM fourniture WHERE noproduit!='P6';

SELECT DISTINCT nofour FROM fournisseur WHERE nofour NOT IN (SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P6');

SELECT DISTINCT nofour FROM fourniture WHERE nofour NOT IN (SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P6');

SELECT nofour FROM fourniture WHERE noproduit='P6' AND nofour NOT IN(SELECT nofour FROM fourniture WHERE noproduit!='P6');

SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P6' OR noproduit='P4';

SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P6' INTERSECT SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P4';

SELECT DISTINCT nofour FROM fourniture WHERE nofour NOT IN (SELECT DISTINCT nofour FROM fourniture WHERE noproduit='P6' OR noproduit='P4');

SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour;

SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour WHERE fourniture.nofour NOT IN (SELECT DISTINCT fourniture.nofour FROM fourniture WHERE noproduit='P6' OR noproduit='P4'); ;

SELECT DISTINCT fournisseur.nofour, nomf, ville FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.origine=fournisseur.ville;

SELECT DISTINCT p1.nomp, p2.nomp
FROM produit p1, produit p2
WHERE p1.couleur=p2.couleur
AND p1.nomp != p2.nomp;

SELECT DISTINCT p1.nomp, p2.nomp
FROM produit p1, produit p2
WHERE p1.nomp='Salade'
AND p1.couleur=p2.couleur
AND p1.nomp != p2.nomp;

SELECT DISTINCT fournisseur.nofour FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Rouge' OR produit.couleur='Vert';

SELECT DISTINCT fournisseur.nofour FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Rouge'
INTERSECT
SELECT DISTINCT fournisseur.nofour FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Vert';


SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE fournisseur.nofour NOT IN 
(SELECT DISTINCT fournisseur.nofour FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Vert');

SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE fournisseur.nofour NOT IN 
(SELECT DISTINCT fournisseur.nofour FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur!='Vert');


SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Vert'
INTERSECT 
SELECT DISTINCT fournisseur.nofour, nomf FROM fourniture
INNER JOIN fournisseur ON fourniture.nofour=fournisseur.nofour
INNER JOIN produit ON fourniture.noproduit=produit.noproduit
WHERE produit.couleur='Jaune';
