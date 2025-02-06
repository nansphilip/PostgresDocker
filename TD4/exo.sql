BEGIN;

SELECT * FROM Cours;
SELECT * FROM Etudiant;
SELECT * FROM Evaluation;
SELECT * FROM Intervenant;
SELECT * FROM Matiere;
SELECT * FROM Moyennes;
SELECT * FROM Salle;

-- Exo 1
-- Indiquez la note maximale obtenue par étudiant, et rendue par intervenant et par matière.

-- Solution avec les ID
SELECT ev.ide as eval, ev.idm as matiere, c.idi as prof, MAX(note) AS note_maximale
FROM Evaluation ev
JOIN Cours c ON ev.idm = c.idm
GROUP BY GROUPING SETS ( (ev.ide), (ev.idm), (c.idi) );

-- Solution avec les noms
SELECT (e.nom, e.prenom) AS etudiant, (i.nom, i.prenom) AS intervenant, (m.intitule) AS matiere, MAX(note) AS note_maximale
FROM Evaluation ev
JOIN Etudiant e ON ev.ide = e.ide
JOIN Matiere m ON ev.idm = m.idm
JOIN Cours c ON ev.idm = c.idm
JOIN Intervenant i ON c.idi = i.idi
GROUP BY GROUPING SETS ( (etudiant), (intervenant), (matiere) );

-- Exo 2
-- Dans quelle(s) salle(s) (déterminée par nos et contenance) s’est / se sont déroulée(s) le plus de séances de cours ?

-- Solution
WITH table_provisoire AS (
    SELECT s.nos, s.contenance, COUNT(c.nos) AS nb_cours
    FROM Salle s
    JOIN Cours c ON s.nos = c.nos
    GROUP BY s.nos, s.contenance
)
SELECT nos, contenance, nb_cours
FROM table_provisoire
WHERE nb_cours = (SELECT MAX(nb_cours) FROM table_provisoire);

-- Exo 3
-- Donnez le classement des cinq meilleurs étudiants de la promo en affichant également leurs noms et moyennes obtenues.

WITH moyenne_etudiant AS (
    SELECT
        et.nom AS nom,
        et.prenom AS prenom,
        ROUND(AVG(ev.note), 2) AS moyenne,
        RANK() OVER (ORDER BY ROUND(AVG(ev.note), 2) DESC) AS classement
    FROM Etudiant et
    JOIN Evaluation ev ON et.ide = ev.ide
    GROUP BY et.nom, et.prenom
)
SELECT classement, nom, prenom, moyenne
FROM moyenne_etudiant
WHERE classement <= 5;

-- Exo 4
-- Quels sont les noms et statuts des intervenants qui ont assuré toutes les séances recensées de cours de chaque matière ?



-- Exo 5
-- Pour chaque salle de contenance supérieure ou égale à 20, indiquez le nombre de cours qu’elle a accueillis (0 en cas d’aucun cours).


-- Exo 6
-- Ajoutez 4 points à l’ensemble des notes obtenues, tout en limitant à 20 les notes dépassant cette barre après mise à jour. Pensez à rétablir la base de données dans son état initial à la fin de l’exercice.

ROLLBACK;
