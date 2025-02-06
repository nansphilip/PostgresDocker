# SQL database

[Mickael Martin Nevot](https://mickael-martin-nevot.com/institut-g4/sql/)

## Prepare environment

Create a Porstgres and Adminer containers

### Postgres container

Pull and run the Postgres container:

```bash
docker run --name my-postgres -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -e POSTGRES_DB=postgres -p 5432:5432 -d postgres
```

Access to Postgres in the terminal by entering in the container:

```bash
docker exec -it my-postgres psql -U root -d postgres
```

Connection information:
  - System: PostgreSQL
  - Server: 
    - localhost:5432 (from the os directly)
    - host.docker.internal:5432 (from another container)
  - Username: root
  - Password: root
  - Database: postgres

### Adminer container

Pull and run the Adminer container:

```bash
docker run --name my-adminer -p 8085:8080 -d adminer
```

Access the adminer in the browser:

```url
http://localhost:8085/?pgsql=host.docker.internal%3A5432&username=root&db=postgres&ns=public
```

<!-- ### DBeaver container

Pull and run the DBeaver container:

```bash
docker run --name my-dbeaver --rm -ti -p 8085:8978 -d dbeaver/cloudbeaver -v /opt/cloudbeaver/workspace
```

Access the DBeaver in the browser:

```url
http://localhost:8085
``` -->

### PGAdmin container

Pull and run the PGAdmin container:

```bash
docker run --name my-pgadmin -e PGADMIN_DEFAULT_EMAIL=root@example.com -e PGADMIN_DEFAULT_PASSWORD=root -p 8085:80 -d dpage/pgadmin4
```

Access the PGAdmin in the browser:

```url
http://localhost:8085
```

## Stop environment

Stop the containers:

```bash
docker stop my-postgres
docker stop my-adminer
docker stop my-pgadmin
```

## Start environment

Start the containers:

```bash
docker start my-postgres
docker start my-adminer
docker start my-pgadmin
```

## Clean environment

Remove the containers:

```bash
docker rm my-postgres
docker rm my-adminer
docker rm my-pgadmin
```
