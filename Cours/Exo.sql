# https://mickael-martin-nevot.com/institut-g4/sql/?:s40-cm2-langage-de-manipulation-de-donnees-lmd.pdf

select nom, prenom from etudiant;

select * from covention;

select nom, prenom from etudiant where annee = 2;

select * from etudiant where annee = 1 and sexe = 'F';

select nom, prenom from etudiant where annee in (2, 3);
select nom, prenom from etudiant where annee between 1 and 3;
select nom, raisons from societe where adresse LIKE '_ar%';
select ide, ids from convention where date_deb is null;

select nom, prenom from etudiant where sexe = 'F' and annee <=2;

# erreur de syntaxe
select nom, raisons from societe where adresse LIKE '%ar%' AND activite between 7 and 15;

select distinct nom from etudiant;

select raisons as formej, adresse as "Adresse postale" from Societe where ids = 8;

select nom from etudiant where prenom <> 'Lulu' order by nom asc;

select distinct nom from etudiant where annee = 2 order by nom desc;

SELECT ids FROM Personnel WHERE nom = 'Durand' UNION SELECT ids FROM Convention WHERE duree = 4;
SELECT ide FROM Etudiant EXCEPT SELECT ide FROM Convention WHERE intitule LIKE '%logiciel%';
SELECT ide FROM Etudiant WHERE prenom = 'Lulu' INTERSECT SELECT ide FROM Convention WHERE duree <= 3;