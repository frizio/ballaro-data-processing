CREATE TABLE mercati(comune CHAR(30), provincia CHAR(30), regione CHAR(30), nome CHAR(50), osmid BIGINT PRIMARY KEY, longitude REAL, latitude REAL);
--- cat ~/CODE/Projects-personali/ballaro/ballaro-data-processing/out/Mappa-dei-negozi-di-frutta-e-verdura-in-Italia_postproc.csv | psql `heroku config:get DATABASE_URL` -c "COPY mercati FROM STDIN WITH (FORMAT CSV);"

CREATE TABLE coltivazioni(id CHAR(5), provincia CHAR(30), tipo CHAR(50), quantita REAL);
--- cat ~/CODE/Projects-personali/ballaro/ballaro-data-processing/out/produzione_totale_per_provincia_2018_cleaned_postproc.csv | psql `heroku config:get DATABASE_URL` -c "COPY coltivazioni FROM STDIN WITH (FORMAT CSV);"

CREATE TABLE pescato(id INT PRIMARY KEY, porto CHAR(30), latitude REAL, longitude REAL, specie CHAR(50), quantita REAL);
--- cat ~/CODE/Projects-personali/ballaro/ballaro-data-processing/out/lista_sbarcato_per_porto_cleaned_tot_postproc.csv | psql `heroku config:get DATABASE_URL` -c "COPY pescato FROM STDIN WITH (FORMAT CSV);"

CREATE TABLE porti(id INT PRIMARY KEY, nome CHAR(30), latitude REAL, longitude REAL);
--- cat ~/CODE/Projects-personali/ballaro/ballaro-data-processing/out/porti_italiani.csv | psql `heroku config:get DATABASE_URL` -c "COPY porti FROM STDIN WITH (FORMAT CSV);"
