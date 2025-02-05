# SQL database

[Mickael Martin Nevot](https://mickael-martin-nevot.com/institut-g4/sql/)

## Prepare environment

Create a Porstgres and Adminer containers

### Postgres container

```bash
docker run --name my-postgres \ # name the container
  -e POSTGRES_USER=root \ # set the user
  -e POSTGRES_PASSWORD=root \ # set the password
  -e POSTGRES_DB=postgres \ # set the database
  -p 5432:5432 \ # map ports like : `host:container`
  -d postgres # get docker image
```

Access the container and to Postgres

```bash
docker exec -it my-postgres psql -U root -d postgres
```

Connexion information

```text
System: PostgreSQL
Server: 
  - localhost:5432 # from the host
  - host.docker.internal:5432 # from another container
Username: root
Password: root
Database: postgres
```

### Adminer container

```bash
docker run --name my-adminer \
  -p 8085:8080 \
  -d adminer
```

Access the adminer in the browser

```url
http://localhost:8085/?pgsql=host.docker.internal%3A5432&username=root&db=postgres&ns=public
```

<!-- ### PGAdmin container

```bash
docker run --name my-pgadmin \
  -e PGADMIN_DEFAULT_EMAIL=root@example.com \
  -e PGADMIN_DEFAULT_PASSWORD=root \
  -p 8085:80 \
  -d dpage/pgadmin4
```

Open pgAdmin in your browser

```bash
http://localhost:8085
``` -->

## Stop environment

Stop the containers

```bash
docker stop my-postgres my-adminer
```

## Start environment

Start the containers

```bash
docker start my-postgres my-adminer
```

## Clean environment

Stop and remove the containers

```bash
docker stop my-postgres my-adminer
docker rm my-postgres my-adminer
```
