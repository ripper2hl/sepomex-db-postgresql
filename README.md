# sepomex-db-postgresql

Es una base de datos en PostgreSQL con la información del archivo de texto
que ofrece *SEPOMEX* de forma normailzada.


## Iniciar base de datos

Para ejecutar la base de datos es necesario correr el comando:

`docker run -p 5432:5432 -d sepomex-db-postgresql:latest`

Las credenciales:

base de datos : sepomex

usuario : sepomex

contraseña: sepomex

## Tablas

* asentamiento_tipo
* ciudad
* codigo_postal
* colonia
* estado
* inegi_clave_ciudad
* inegi_clave_municipio
* municipio
* zona_tipo

