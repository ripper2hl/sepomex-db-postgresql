# sepomex-db-postgresql

[![](https://img.shields.io/docker/stars/jesusperales/sepomex-db-postgresql.svg)](https://hub.docker.com/r/jesusperales/sepomex-db-postgresql/ 'Docker hub')
[![](https://img.shields.io/docker/pulls/jesusperales/sepomex-db-postgresql.svg)](https://hub.docker.com/r/jesusperales/sepomex-db-postgresql/ 'Docker hub')

Es una base de datos en PostgreSQL con la información del archivo de texto
que ofrece *SEPOMEX* de forma normailzada.


## Iniciar base de datos

Para ejecutar la base de datos es necesario correr el comando:

`docker run -p 5432:5432 -e POSTGRES_PASSWORD=sepomex -e POSTGRES_USER=sepomex -d jesusperales/sepomex-db-postgresql:latest`

base de datos : sepomex

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

## Generar la información de la base de datos:

* Utilizamos un contenedor de base de datos postgres.

  ```bash
  docker run -p 5432:5432 -e POSTGRES_PASSWORD="sepomex" -e POSTGRES_USER=sepomex -d postgres:latest
  ```

* Es necesario correr el proyecto [sepomex](https://github.com/ripper2hl/sepomex).

  ```bash
  export spring_profiles_active=local
  mvn spring-boot:run
  ```  

* Descargamos el **archivo de texto** de la pagina de [sepomex](https://www.correosdemexico.gob.mx/SSLServicios/ConsultaCP/CodigoPostal_Exportar.aspx).

* Abrimos el archivo de texto(con gedit) y lo guardamos como UTF-8, esto es importante para mantener los acentos.

* Cargamos el archivo usando el metodo cargaMasiva que se encuentra en swagger.

* Ejecutamos el siguiente comando para obtener el backup.

  ```bash
  docker exec -t nombre-contenedor pg_dump --if-exists -c -U sepomex > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
  ```

* Reemplazamos el archivo data.sql.

* Construimos la imagen de docker.

  ```bash
  docker build . -t sepomex-db-postgresql
  docker run -p 5432:5432 -e POSTGRES_PASSWORD=sepomex -e POSTGRES_USER=sepomex sepomex-db-postgresql
  ```
