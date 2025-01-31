select nom, salaire from personnel where prenom like '%en%' order by nom ASC;

select avg(duree) from convention where note >= 12;

select note, min(duree), avg(duree), max(duree) from convention group by note;

select duree, count(distinct ide) from convention group by duree;