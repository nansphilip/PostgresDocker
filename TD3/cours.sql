BEGIN;

SELECT nom, duree
FROM Etudiant e
INNER JOIN Convention c
ON e.ide = c.ide
WHERE DATE_PART('year', daten) = 2001;

SELECT nom, duree
FROM Etudiant e
LEFT OUTER JOIN Convention c
ON e.ide = c.ide
WHERE DATE_PART('year', daten) = 2001;

SELECT nom, duree
FROM Etudiant e
RIGHT OUTER JOIN Convention c
ON e.ide = c.ide
WHERE DATE_PART('year', daten) = 2001;

SELECT nom, duree
FROM Etudiant e
FULL OUTER JOIN Convention c
ON e.ide = c.ide
WHERE DATE_PART('year', daten) = 2001;

SELECT ide
FROM Etudiant e
WHERE NOT EXITSS (
    SELECT ide FROM Convention c
    WHERE c.ide = e.ide
);

ROLLBACK;
