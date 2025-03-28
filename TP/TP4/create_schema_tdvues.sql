drop schema if exists "TdVues" cascade;

create schema "TdVues";
set schema 'TdVues';

create table producteur (
  raison_sociale    varchar(25),
  ville             varchar(255),
  primary key(raison_sociale)
);
 
create table consommateur (
  login   varchar(10),
  email   varchar(50),
  nom     varchar(50)   not null,
  prenom  varchar(50)   not null,
  ville   varchar(255)  not null default 'Lannion',
  primary key (login, email),
  unique(nom, prenom, ville)
);

create table produit(
  id                  integer,
  description         varchar(100),
  produit_par         varchar(25)   not null,
  consomme_par_login  varchar(10),
  consomme_par_email  varchar(50),
  primary key (id),
  foreign key (produit_par) references producteur(raison_sociale),
  foreign key (consomme_par_login,consomme_par_email) 
      references consommateur (login, email)
);