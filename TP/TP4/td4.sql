INSERT INTO producteur (raison_sociale, ville) VALUES
('BioFerme', 'Rennes'),
('AgriNature', 'Nantes'),
('VergerBio', 'Bordeaux'),
('FermierDuCoin', 'Lyon'),
('TerreSaine', 'Toulouse'),
('Nara', 'Lannion'),
('MadeleineYuzu', 'Lannion'),
('MomenTea', 'Lannion');


INSERT INTO consommateur (login, email, nom, prenom, ville) VALUES
('jdoe', 'jdoe@email.com', 'Doe', 'John', 'Lannion'),
('asmith', 'asmith@email.com', 'Smith', 'Alice', 'Paris'),
('bdupont', 'bdupont@email.com', 'Dupont', 'Bernard', 'Lannion'),
('cmartin', 'cmartin@email.com', 'Martin', 'Claire', 'Marseille'),
('epierre', 'epierre@email.com', 'Pierre', 'Emma', 'Lannion');


INSERT INTO produit (id, description, produit_par, consomme_par_login, consomme_par_email) VALUES
(1, 'Pommes Bio', 'VergerBio', 'jdoe', 'jdoe@email.com'),
(2, 'Carottes fraîches', 'BioFerme', 'asmith', 'asmith@email.com'),
(3, 'Lait fermier', 'FermierDuCoin', 'bdupont', 'bdupont@email.com'),
(4, 'Miel naturel', 'TerreSaine', 'cmartin', 'cmartin@email.com'),
(5, 'Tomates cerises', 'AgriNature', 'epierre', 'epierre@email.com');




CREATE VIEW LannionProducteurs AS 
SELECT *
FROM producteur
WHERE ville='Lannion'
WITH CHECK OPTION;

--Vérification de si producteur et lannionproducteurs sont pareil

SELECT *
FROM LannionProducteurs
WHERE ville='Lannion';

SELECT *
FROM producteur
WHERE ville='Lannion';

INSERT INTO producteur (raison_sociale, ville) VALUES
('SAS GIRAUMONT', 'Rennes');
--la valeur s'insère pas car la ville respecte pas la consigne de la vue a savoir ville='Lannion'
--par contre il s'insère dans la table d'origine


CREATE VIEW NomsConsommateurs AS
SELECT nom, prenom
FROM Consommateur;


CREATE VIEW ListeProduits AS
SELECT id, description
FROM Produit;

INSERT INTO NomsConsommateurs (nom, prenom) VALUES
('Reichert','Jamal');


INSERT INTO produit (id, description, produit_par, consomme_par_login, consomme_par_email) VALUES
(6, 'Jus de pommes Bio', 'VergerBio', 'jdoe', 'jdoe@email.com');


--Raison sociale du plus gros fournisseur
SELECT COUNT(description) AS somme,produit_par
FROM produit
GROUP BY produit_par
ORDER BY somme DESC
LIMIT 1;

--autre
SELECT produit_par
FROM produit
GROUP BY produit_par
HAVING COUNT(*) = (
    SELECT MAX(produit_count)
    FROM (
        SELECT COUNT(*) AS produit_count
        FROM produit
        GROUP BY produit_par
    ) AS temp
);


