CREATE TABLE fourniture (
quantite INTEGER,
noproduit CHAR(3),
nofour CHAR(3),
CONSTRAINT fourniture_pk PRIMARY KEY(noproduit,nofour),
CONSTRAINT fourniture_fk1 FOREIGN KEY (noproduit)
  REFERENCES produit(noproduit),
CONSTRAINT fourniture_fk2 FOREIGN KEY (nofour)
  REFERENCES fournisseur(nofour)
);
