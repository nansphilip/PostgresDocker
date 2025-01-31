-- V1.0.0

DROP TABLE IF EXISTS Convention;
DROP TABLE IF EXISTS Etudiant;
DROP TABLE IF EXISTS Personnel;
DROP TABLE IF EXISTS Societe;

CREATE TABLE Etudiant (
    ide INTEGER NOT NULL PRIMARY KEY, 
    nom VARCHAR(25) NOT NULL,
    prenom VARCHAR(20),
    email VARCHAR(25) UNIQUE,
    sexe CHAR(1) 	
        CONSTRAINT ck_sex
        CHECK (sexe IN ('M', 'F') OR sexe IS NULL),
    daten DATE,
    adresse VARCHAR(60),
    annee SMALLINT DEFAULT 3 CHECK (annee < 4),
    tel CHAR(14)
        CONSTRAINT ck_tel 
        CHECK (tel SIMILAR TO '[0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9]')
);

CREATE TABLE Societe (
    ids INTEGER NOT NULL PRIMARY KEY,
    nom VARCHAR(25) NOT NULL UNIQUE,
    raisons VARCHAR(20),
    activite INTEGER,
    adresse VARCHAR(60)
);

CREATE TABLE Personnel (
    idp INTEGER NOT NULL PRIMARY KEY,
    nom VARCHAR(25) NOT NULL,
    prenom VARCHAR(20),
    ids INTEGER NOT NULL,
    salaire REAL,
    CONSTRAINT fk_soc FOREIGN KEY (ids) REFERENCES Societe(ids)
);

CREATE TABLE Convention (
    ide INTEGER NOT NULL,
    ids INTEGER NOT NULL,
    idp INTEGER NOT NULL,
    datec DATE,
    date_deb DATE,
    duree INTEGER,
    intitule VARCHAR(50),
    note INTEGER,
    CONSTRAINT pk_con PRIMARY KEY (ide, ids, idp),
    CONSTRAINT fk_etu FOREIGN KEY (ide) REFERENCES Etudiant(ide),
    CONSTRAINT fk_soc FOREIGN KEY (ids) REFERENCES Societe(ids),
    CONSTRAINT fk_per FOREIGN KEY (idp) REFERENCES Personnel(idp),
    CONSTRAINT ch_dat CHECK (datec < date_deb)
);

INSERT INTO Etudiant VALUES (8, 'Dupond', 'Lulu', 'dupond.lulu@jmail.com', 'M', '2001-03-16', 'Aix_en_Pce', 3, '01-23-45-67-89');
INSERT INTO Etudiant VALUES (12, 'Duvent', 'Yves', 'duvent.yves@jmail.com', 'M', '2001-04-20', 'Marseille', 2, '01-23-45-67-89');
INSERT INTO Etudiant VALUES (14, 'Dupond', 'Maurice', 'dupond.maurice@jmail.com', 'M', '2002-04-17', 'Marseille', 3, '01-23-45-67-89');
INSERT INTO Etudiant VALUES (15, 'Durand', 'Helene', 'durand.helene@jmail.com', 'F', '2002-04-18', 'Gardanne', 1, '01-23-45-67-89');
INSERT INTO Etudiant VALUES (17, 'Tapioca', 'Lulu', 'tapioca.lulu@jmail.com', 'M', '2000-05-11', NULL, 3, '01-23-45-67-89');
INSERT INTO Etudiant VALUES (45, 'Deschamps', 'Jean', 'deschamps.jean@jmail.com', 'M', '2002-04-20', 'Aix_en_Pce', 2, '01-23-45-67-89');

INSERT INTO Societe VALUES (8, 'Microware', 'SARL', 8 ,'Aix_en_Pce');
INSERT INTO Societe VALUES (13, 'EdF', 'SEM', 15, 'Marseille');
INSERT INTO Societe VALUES (21, 'TOTAL', 'SA', 9, 'Fos_sur_Mer');
INSERT INTO Societe VALUES (34, 'Almacom', 'SARL', 7, 'Aubagne');

INSERT INTO Personnel VALUES (2, 'Durand', 'Jules', 8, 3100);
INSERT INTO Personnel VALUES (4, 'Dupond', 'Emile', 8, 2420);
INSERT INTO Personnel VALUES (7, 'Toulemonde', 'Rene', 8, 1960);
INSERT INTO Personnel VALUES (12, 'Mirabeau', 'Regine', 13, 1810.5);
INSERT INTO Personnel VALUES (19, 'Petitjean', 'Helene', 21, 1750);
INSERT INTO Personnel VALUES (53, 'Duvent', 'Yves', 34, 3200);
INSERT INTO Personnel VALUES (61, 'Martin', 'Louis', 21, 2670);

INSERT INTO Convention VALUES (8, 8, 2, '2020-6-10', NULL, 3, 'conception d''un logiciel …', 16);
INSERT INTO Convention VALUES (17, 8, 7, '2020-5-8', NULL, 4, '… realisation d''un serveur WEB', 14);
INSERT INTO Convention VALUES (15, 13, 12, '2020-4-12', '2020-7-01', 5, '… logiciel de controle / commande', 11);
INSERT INTO Convention VALUES (17, 34, 53, '2021-3-2', NULL, 6, 'logiciel de transfert de fichiers', 14);
INSERT INTO Convention VALUES (8, 34, 53, '2021-3-2', '2021-5-15', 6, 'prototype de modem externe', 18);
INSERT INTO Convention VALUES (12, 13, 12, '2020-6-2', NULL, 6, '… carte d''acquisition', 13);
INSERT INTO Convention VALUES (8, 21, 19, '2020-5-21', NULL, 5, 'logiciel de traitement d''images', 17);
INSERT INTO Convention VALUES (15, 8, 4, '2021-6-6', NULL, 6, '… driver de carte video', 10);