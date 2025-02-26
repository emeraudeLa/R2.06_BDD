-- Ce script crée trois tables dans le schéma public.
-- A exécuter avec : psql -h <hostame> -U <login> -d <database> -f create_pg_tp1a_pour_etu.sql
-- Ne fonctionne pas dans SQLWorkbench/J à cause des commandes \copy

-- Décommenter les trois lignes qui suivent pour les créer dans un schéma 'commerce'
-- DROP SCHEMA IF EXISTS commerce CASCADE;
-- CREATE SCHEMA commerce;
-- SET SCHEMA 'commerce';

--
-- Name: clients; Type: TABLE; Schema: public; 
--

CREATE TABLE client (
    num_cli numeric(3,0) NOT NULL,
    nom_cli character varying(20),
    adresse_cli character varying(20)
);



--
-- Name: commandes; Type: TABLE; Schema: public; 
--

CREATE TABLE commande (
    date_com date NOT NULL,
    num_art_c numeric(3,0) NOT NULL,
    num_cli_c numeric(3,0) NOT NULL,
    quantite_art_c numeric(5,0) NOT NULL
);



--
-- Name: stock; Type: TABLE; Schema: public; 
--

CREATE TABLE stock (
    num_art numeric(3,0) NOT NULL,
    nom_art character varying(40),
    type_art character varying(20),
    prix_art numeric(6,2),
    quantite_art numeric(5,0)
);



--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; 
--

\COPY client (num_cli, nom_cli, adresse_cli) FROM stdin;
1	Arniel	Servel Lannion
2	Legudec	Brel. Lannion
3	Bolin	Ker Huel Lannion
4	Durand	Bd dArmor Lannion
5	Mazer	\N
6	Murton	Ker Huel Lannion
7	Legros	La Clarte Perros
8	Duchemin	Brel. Lannion
9	Guidroc	Ker Huel Lannion
10	Podrez	\N
\.


--
-- Data for Name: commandes; Type: TABLE DATA; Schema: public; 
--

\COPY commande (date_com, num_art_c, num_cli_c, quantite_art_c) FROM stdin;
2013-11-30	1	5	10
2013-06-22	3	6	10
2013-06-04	4	6	20
2013-06-08	5	6	20
2014-01-01	2	5	40
2014-01-03	4	2	1
2014-01-09	4	4	2
2014-01-15	3	1	10
2014-01-27	1	3	10
2014-03-03	8	1	30
2014-03-04	8	4	5
2014-03-08	5	2	10
2014-03-17	1	4	10
2014-03-18	3	7	20
2014-03-22	4	7	10
2014-03-22	3	8	20
2014-04-02	2	7	55
2014-04-03	2	5	90
2014-04-12	3	1	2
2014-04-19	7	2	8
2014-04-19	4	2	3
\.


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; 
--

\COPY stock (num_art, nom_art, type_art, prix_art, quantite_art) FROM stdin;
1	Mathematiques : Algebre	Sciences	40.00	20
2	Mathematiques : Analyse	Sciences	12.00	20
3	Perception et Realite	Philosophie	23.00	400
4	Le moi	Philosophie	2.00	900
5	Vie de Zograffi	Litterature	20.00	400
6	Terre des Hommes	Litterature	19.00	40
7	Voyages Imaginaires	Litterature	18.00	300
8	1984	Litterature	8.00	80
9	Germinal	Litterature	40.00	20
10	La Programmation	Sciences	40.00	0
\.


--
-- Name: clients clients_pk; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_pk PRIMARY KEY (num_cli);


--
-- Name: commandes commandes_pk; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (date_com, num_art_c, num_cli_c);


--
-- Name: stock stock_pk; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (num_art);


--
-- Name: commandes commandes_fk1; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY commande
    ADD CONSTRAINT commande_fk_stock FOREIGN KEY (num_art_c) REFERENCES stock(num_art);


--
-- Name: commandes commandes_fk2; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY commande
    ADD CONSTRAINT commande_fk_client FOREIGN KEY (num_cli_c) REFERENCES client(num_cli);

--
-- PostgreSQL database dump complete
--


