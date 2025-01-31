CREATE TABLE Matiere (
    idm INTEGER PRIMARY KEY,
    intitule CHAR(16),
    nbs INTEGER
);

CREATE TABLE Intervenant (
    idi INTEGER PRIMARY KEY,
    nom VARCHAR(16),
    prenom VARCHAR(14),
    statut CHAR(1),
    CONSTRAINT statut_check CHECK (statut IN ('P', 'V'))
);

CREATE TABLE Etudiant (
    ide INTEGER PRIMARY KEY,
    nom VARCHAR(16),
    prenom VARCHAR(14),
    groupe CHAR(2),
    CONSTRAINT groupe_check CHECK (groupe IN ('G1', 'G2', 'G3'))
);

CREATE TABLE Salle (
    nos VARCHAR(5) PRIMARY KEY,
    typs SMALLINT,
    contenance INTEGER,
    CONSTRAINT typs_check CHECK (typs IN (1, 2))
);

CREATE TABLE Cours (
    idm INTEGER,
    nums INTEGER,
    idi INTEGER,
    nos VARCHAR(5),
    groupe CHAR(2),
    dates DATE,
    phor CHAR(2),
    CONSTRAINT phor_check CHECK (phor IN ('AM', 'PM')),
    CONSTRAINT groupe_check_cours CHECK (groupe IN ('G1', 'G2', 'G3')),
    CONSTRAINT pk_cours PRIMARY KEY (idm, nums),
    FOREIGN KEY (idm) REFERENCES Matiere (idm),
    FOREIGN KEY (idi) REFERENCES Intervenant (idi),
    FOREIGN KEY (nos) REFERENCES Salle (nos)
);

CREATE TABLE Evaluation (
    idm INTEGER,
    ide INTEGER,
    note INTEGER,
    CONSTRAINT pk_evaluation PRIMARY KEY (idm, ide),
    FOREIGN KEY (idm) REFERENCES Matiere (idm),
    FOREIGN KEY (ide) REFERENCES Etudiant (ide)
);

CREATE TABLE Moyennes (
    idm INTEGER,
    groupe CHAR(2),
    moyenne NUMERIC,
    CONSTRAINT pk_moyennes PRIMARY KEY (idm, groupe),
    FOREIGN KEY (idm) REFERENCES Matiere (idm),
    CONSTRAINT groupe_check_moyennes CHECK (groupe IN ('G1', 'G2', 'G3'))
);

\dt
