---
--- TP 1 - LMD - Client - Commande - Stock
---



-- Q1 tous les articles

SELECT *
FROM stock;

-- Q2 tous les clients

SELECT *
FROM client;

-- Q3 toutes les commandes

SELECT *
FROM commande;

-- Q4 le nom de chaque article

SELECT nom_art
FROM stock;

-- Q5 le nom et l'adresse de chaque client

SELECT nom_cli,adresse_cli
FROM client;

-- Q6 le nom et le numero des clients dont l'adresse n'est pas connue

SELECT nom_cli, num_cli
FROM client
WHERE adresse_cli IS NULL;

-- Q7 les articles de type Philosophie

SELECT *
FROM stock
WHERE type_art = 'Philosophie';

-- Q8 nom et type des article de type  Philosophie ou Litterature

SELECT nom_art, type_art
FROM stock
WHERE type_art = 'Philosophie' OR type_art = 'Litterature';

-- Q9 nom et type des articles dont la quantite en stock est >=100

SELECT nom_art, type_art
FROM stock
WHERE quantite_art >=100;

-- Q10 articles de type Sciences dont la quantite en stock
-- est inferieure a 100

SELECT *
FROM stock
WHERE type_art = 'Sciences' AND quantite_art<100;

-- Q11 nom des articles de type Sciences dont la quantite en stock
-- est inferieure a 100

SELECT nom_art
FROM stock
WHERE type_art = 'Sciences' AND quantite_art<100;

-- Q12 nom des articles dont la valeur du stock est > 1000

SELECT nom_art
FROM stock
WHERE (prix_art*quantite_art)>1000;

-- Q13 nom et type des articles qui sont en rupture de stock

SELECT nom_art, type_art
FROM stock
WHERE quantite_art=0;

-- Q14 nom et type des articles qui sont approvisionnés

SELECT nom_art, type_art
FROM stock
WHERE quantite_art>0;

-- Q15  nom des articles commandés

SELECT DISTINCT nom_art
FROM stock
INNER JOIN commande ON num_art=num_art_c;

-- Q16 nom des clients ayant commandé

SELECT DISTINCT nom_cli
FROM client
INNER JOIN commande ON num_cli=num_cli_c;

-- Q17 numéro des clients n'ayant jamais commandé

SELECT DISTINCT nom_cli
FROM client
WHERE nom_cli NOT IN (
  SELECT DISTINCT nom_cli
  FROM client
  INNER JOIN commande ON num_cli=num_cli_c);

-- Q18 commandes qui concernent des articles qui ne sont pas de type
-- 'Philosophie'

SELECT *
FROM commande
INNER JOIN stock ON num_art_c=num_art
WHERE type_art!='Philosophie';


-- Q19 nom des articles de type Sciences dont au moins une commande 
-- a un montant >800

SELECT nom_art
FROM stock
INNER JOIN commande ON num_art=num_art_c
WHERE type_art='Sciences' AND (quantite_art_c*prix_art)>800;

-- Q20 Valeur du stock

SELECT SUM(prix_art*quantite_art) AS valeur_stock
FROM stock;

-- Q21 Somme des montants des commandes

SELECT SUM(quantite_art_c*prix_art) AS somme_montant
FROM stock
INNER JOIN commande ON num_art=num_art_c;

-- Q22 nom des clients ayant commande(au moins un) article de type Philosophie

SELECT DISTINCT nom_cli
FROM commande
INNER JOIN client ON num_cli_c=num_cli
INNER JOIN stock ON num_art_c=num_art
WHERE type_art='Philosophie';

-- Q23 numéro des articles sujets a au moins deux commandes
-- (qu'est ce qui identifie une commande) ?

--En cours
SELECT num_art_c
FROM commande;


-- Q24 Couples de  numero de clients (n1,n2) tels que les clients soient differents
-- et aient meme adresse





-- Q25 nombre de clients




-- Q26 quantité minimale en stock





-- Q27 Quantite maximale en stock des articles de type Philosophie





-- Q28 moyenne des quantites en stock




-- Q39 nombre de commandes du client numero 1





-- Q30 nom des articles commandes par les clients no 4 ou  no 2 





-- Q31 nom des articles non commandes par les clients no 4 ou no 2



-- Q32 nom des articles tels qu'il existe au moins une commande de quantite
-- supérieure à celle en stock





-- Q33 numéro des articles qui ne sont commandés qu'une seule fois





-- Q34 la moyenne des quantites commandees des articles
-- de type Litterature




-- Q36 Numéros des clients et  des articles commandés par 
-- ce client. Les numéros des clients n'ayant rien commandé devront apparaitre

-- Pas proposée  


/* -36- Par numéro article: la somme et le maximum des quantités commandées. */

/* -37- Pour chaque article, son nom, la plus petite quantité commandée, la plus grande et la moyenne des quantités commandées. */
	
/* -38- Le numéro des articles sujets à au moins 2 commandes. */

/* -39- Le numéro des articles sujets à au plus 3 commandes. */

/* -40- Le numéro des articles sujets à exactement 2 commandes. */

/* -41- Le nom des articles dont la somme des quantités commandées excède 100 */

/* -42- Le nom et le numéro des clients ayant passé au moins 2 commandes du même produit */

/* -43- Le nom et le numéro des clients ayant passé au moins 2 commandes de produits différents  */

/* -44- La moyenne des quantités commandées de chaque article de type 'Litterature' */

/* -45- La moyenne des quantités commandées pour les articles sujets à au moins 3 commandes */

/* -46- Le numéro des articles dont la moyenne des quantités commandées est supérieure à 15 */

/* -47- Le nom des clients ayant effectué au moins 3 commandes */

/* -48- Combien de jours séparent la première et la dernière commande de chaque client ? */

/* -49- Quelle est la date de la dernière commande de chaque client ?  */

/*
*
*	REQUETES COMPLEXES
*
*/

/* -50- le nom des articles dont la quantité en stock est maximale.*/

/* -51- le nom des articles dont au moins une commande est de quantité commandée supérieure à la quantité en stock.*/

/* -52- le nom des articles dont la somme des quantités commandées est supérieure à la quantité en stock.*/

/* -53- le nom des articles tels que toutes les commandes sont de quantité supérieure à celle en stock .
         ( 2 versions selon que l'on considère les articles non  commandés ou pas). */

/* -54- le numéro des articles qui ne sont commandés qu'une seule fois.*/

/* -55- le numéro des clients qui ont commandé tous les livres de Philosophie.*/

/* -56- le plus ancien client (numéro et nom). */

/* -57- le premier client à avoir acheté un exemplaire de '1984'.*/

/* -58- la dernière commande en date de chaque client.*/


/*
*
*	REQUETES SUR LES DATES
*
*/

-- 59 - La date d'aujourd'hui selon le format: \og lundi 16 décembre 2013\fg{}.
-- 60 - L'heure courante sous la forme: \og 13:24:52\fg{}.
-- 61 - Quelles sont les commandes passées en octobre 2013?
-- 62 - Quelles sont les commandes passées il y a au plus trente jours?
-- 63 - Nom des clients ayant passé des commandes il y a au plus  trente jours?
-- 64 - Quelles sont les commandes passes entre le 16/08/2013 et le 16/11/2013 ?
-- 65 - Nom des clients ayant passé une commande un vendredi?
-- 66 - Nom des clients ayant passé une commande un jeudi ou un vendredi?
-- 67 - Quels sont les clients (numéro et nom) qui ont passé des commandes au cours du premier trimestre de l'année courante?
-- 68 - Quels sont les clients (numéro et nom) qui n'ont pas passé de commande durant les deux derniers mois (60 jours)?
-- 69 - Quels sont les clients qui ont passé toutes leurs commandes durant le même mois?
