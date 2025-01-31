# SQL database

[Mickael Martin Nevot](https://mickael-martin-nevot.com/institut-g4/sql/)

## Prepare environment

Create a postgres container

```bash
docker run --name my-postgres \
  -e POSTGRES_USER=root \
  -e POSTGRES_PASSWORD=root \
  -e POSTGRES_DB=postgres-db \
  -p 5432:5432 \
  -d postgres
```

Access the container and to Postgres

```bash
docker exec -it my-postgres bash
psql -U root -d postgres-db
```

Create a adminer container

```bash
docker run -d --name adminer -p 8080:8080 adminer
```

Access the adminer in the browser

```url
http://localhost:8080/?pgsql=host.docker.internal%3A5432&username=root&db=postgres-db&ns=public
```

Connexion information

```text
System: PostgreSQL
Server: host.docker.internal:5432
Username: root
Password: root
Database: postgres-db
```

## Clean environment

Stop and remove the containers

```bash
docker stop my-postgres adminer
docker rm my-postgres adminer
```