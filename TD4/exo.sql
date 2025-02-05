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

-- SELECT s.nos, s.contenance, COUNT(*) as nb_seances
-- FROM Salle s
-- JOIN Cours c ON s.nos = c.nos
-- GROUP BY s.nos, s.contenance
-- HAVING COUNT(*) = (
--     SELECT COUNT(*)
--     FROM Cours
--     GROUP BY nos
--     ORDER BY COUNT(*) DESC
--     LIMIT 1
-- );

-- Exo 3
-- Donnez le classement des cinq meilleurs étudiants de la promo en affichant également leurs noms et moyennes obtenues.

SELECT e.nom, e.prenom, AVG(ev.note) as moyenne
FROM Etudiant e
JOIN Evaluation ev ON e.ide = ev.ide
GROUP BY e.ide, e.nom, e.prenom
ORDER BY moyenne DESC
LIMIT 5;

-- Exo 4
-- Quels sont les noms et statuts des intervenants qui ont assuré toutes les séances recensées de cours de chaque matière ?

SELECT DISTINCT i.nom, i.statut
FROM Intervenant i
JOIN Cours c ON i.idi = c.idi
GROUP BY i.idi, i.nom, i.statut
HAVING COUNT(DISTINCT c.idm) = (SELECT COUNT(*) FROM Matiere);

-- Exo 5
-- Pour chaque salle de contenance supérieure ou égale à 20, indiquez le nombre de cours qu’elle a accueillis (0 en cas d’aucun cours).

SELECT s.nos, s.contenance, COUNT(c.nos) as nb_cours
FROM Salle s
LEFT JOIN Cours c ON s.nos = c.nos
WHERE s.contenance >= 20
GROUP BY s.nos, s.contenance
ORDER BY s.nos;

ROLLBACK;


-- Exo 6
-- Ajoutez 4 points à l’ensemble des notes obtenues, tout en limitant à 20 les notes dépassant cette barre après mise à jour. Pensez à rétablir la base de données dans son état initial à la fin de l’exercice.

BEGIN;

-- Sauvegarde des notes
CREATE TEMP TABLE temp_notes AS SELECT * FROM Evaluation;

-- Mise à jour des notes
UPDATE Evaluation 
SET note = CASE 
    WHEN note + 4 > 20 THEN 20 
    ELSE note + 4 
END;

-- Pour restaurer
UPDATE Evaluation SET note = temp_notes.note
FROM temp_notes
WHERE Evaluation.idm = temp_notes.idm 
AND Evaluation.ide = temp_notes.ide;

DROP TABLE temp_notes;

ROLLBACK;
