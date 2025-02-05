BEGIN;

-- Exo 1

ALTER TABLE Convention
DROP CONSTRAINT IF EXISTS fk_etu;

ALTER TABLE Convention
ADD CONSTRAINT fk_etu
FOREIGN KEY (ide) 
REFERENCES Etudiant(ide)
ON DELETE CASCADE;

SELECT * FROM Etudiant;
SELECT * FROM Convention;

DELETE FROM Etudiant WHERE ide = 8;

SELECT e.ide, e.nom, e.prenom
FROM Etudiant e
INNER JOIN Convention c ON e.ide = c.ide
WHERE c.note > 12
GROUP BY e.ide;

-- Exo 2

ROLLBACK;
