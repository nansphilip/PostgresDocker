Voici un exemple avec des données concrètes pour chaque cas :

### Création des tables et insertion des données

```sql
CREATE TABLE table1 (
    id INT,
    name TEXT
);

CREATE TABLE table2 (
    id INT,
    name TEXT
);

INSERT INTO table1 (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO table2 (id, name) VALUES
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');
```

---

### **1. UNION**

Combine les données des deux tables en supprimant les doublons.

```sql
SELECT id, name
FROM table1
UNION
SELECT id, name
FROM table2;
```

**Résultat :**
```
 id |  name   
----+---------
  1 | Alice
  2 | Bob
  3 | Charlie
  4 | David
```

---

### **2. DIFFERENCE (EXCEPT)**

Renvoie les lignes de `table1` qui ne sont pas dans `table2`.

```sql
SELECT id, name
FROM table1
EXCEPT
SELECT id, name
FROM table2;
```

**Résultat :**
```
 id |  name   
----+---------
  1 | Alice
```

---

### **3. INTERSECTION**

Renvoie les lignes communes entre les deux tables.

```sql
SELECT id, name
FROM table1
INTERSECT
SELECT id, name
FROM table2;
```

**Résultat :**
```
 id |  name   
----+---------
  2 | Bob
  3 | Charlie
```

---

Ces requêtes permettent de manipuler et comparer les données des deux tables efficacement !
