###Overview

A simple Spring Boot REST API, backed by a Postgres database.

Aims to illustrate a possible asset address schema.

### To Run

You will need Docker and Java 11 installed and set as your Java home. 

* From the main project directory, run the following command to start Postgres on port 5433:

`compose up -d`

* You should be able to connect using user ```postgres``` and password ```example```.

* To start Spring Boot server, run following command from main project directory

```./gradlew bootRun```

### Accessing The API

* To retrieve all assets:

```curl http://localhost:8080/assets```

* To retrieve assets for specific BU:

```curl "http://localhost:8080/assets?unit=UK"```

* To retrieve assets in translated form:

```curl -q "http://localhost:8080/assets?translate=true"```

