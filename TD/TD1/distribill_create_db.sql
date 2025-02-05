DROP SCHEMA IF EXISTS distribill CASCADE;
CREATE SCHEMA distribill;
SET SCHEMA 'distribill';

DROP TABLE IF EXISTS fournisseur;
CREATE TABLE fournisseur(
  nofour CHAR(3) NOT NULL,
  nomF VARCHAR(50) NOT NULL,
  ville VARCHAR(50) NOT NULL,
  CONSTRAINT pk_fournisseur PRIMARY KEY (nofour)
);

DROP TABLE IF EXISTS produit;
CREATE TABLE produit(
  noproduit CHAR(3) NOT NULL,
  nomP VARCHAR(50) NOT NULL,
  origine VARCHAR(50) NOT NULL,  
  couleur VARCHAR(50) NOT NULL,
  CONSTRAINT pk_produit PRIMARY KEY (noproduit)
);

DROP TABLE IF EXISTS fourniture;
CREATE TABLE fourniture(
  noproduit CHAR(3) NOT NULL,
  nofour CHAR(3) NOT NULL,
  quantite INT NOT NULL,
  CONSTRAINT pk_fourniture PRIMARY KEY (noproduit, nofour),
  CONSTRAINT fourniture_fk_fournisseur FOREIGN KEY (nofour) REFERENCES fournisseur(nofour),   
  CONSTRAINT fourniture_fk_produits FOREIGN KEY (noproduit) REFERENCES produit(noproduit)
);


INSERT INTO fournisseur(nofour, nomF, ville) VALUES
  ('F1','Bourhis','Paris'),
  ('F2','Bourhis','Paris'),
  ('F3','Collet','Reims'),
  ('F4','Bossuet','Dijon'),
  ('F5','Mercier','Riec'),
  ('F6','Tanguy','Lannion');


INSERT INTO produit (noproduit, nomP, couleur, origine) VALUES
  ('P1','Cassis','Rouge','Dijon'),
  ('P2','Champagne','Blanc','Reims'),
  ('P3','Huitre','Vert','Riec'),
  ('P4','Moutarde','Jaune','Dijon'),
  ('P5','Salade','Vert','Nice'),
  ('P6','Cornichon','Vert','Dijon'),
  ('P7','Muscadet','Blanc','Nantes');


INSERT INTO fourniture (nofour, noproduit, quantite) VALUES
  ('F1','P1',1),
  ('F1','P4',1),
  ('F1','P5',8),
  ('F1','P6',2),
  ('F2','P2',1),
  ('F2','P4',1),
  ('F3','P2',5),
  ('F3','P4',1),
  ('F4','P4',2),
  ('F4','P5',7),
  ('F4','P6',3),
  ('F5','P3',10);
