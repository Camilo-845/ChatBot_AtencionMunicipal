# Dockerfile
FROM postgres:latest

# Copiar los scripts SQL en el directorio de inicialización
COPY ./DDL.sql /docker-entrypoint-initdb.d/
COPY ./DML.sql /docker-entrypoint-initdb.d/
COPY ./Functions.sql /docker-entrypoint-initdb.d/
COPY ./StoreProcedures.sql /docker-entrypoint-initdb.d/
COPY ./Views.sql /docker-entrypoint-initdb.d/