# BDD CPO Tester via OCPI 2.2.1

<a href="https://www.extrawest.com/"><img src="https://drive.google.com/uc?export=view&id=1kXfNj5WfW2oSMzQR82xYBI6Bw_W8-LpK" width="20%"></a>

CPO Tester is written to simulate requests from eMSP to CPO according OCPI 2.2.1 specification. Application uses
Cucumber testing framework.

Cucumber is a behavior-driven development (BDD) testing framework that uses the Gherkin language to write test cases in
a human-readable format.
With the eMSPs requests simulator on Cucumber, test cases can be written in Gherkin and automated using Cucumber's
testing framework.

The simulator provides a set of predefined OCPI REST requests that can be sent and received by eMSP. These requests
include HTTP requests: GET, POST, PUT, PATCH, DELETE as OCPI specification based on REST API.

## Technologies used

- [Spring Boot](https://spring.io/projects/spring-boot)
- [Cucumber for Java](https://cucumber.io/docs/cucumber/api/?lang=java)
- [Extrawest-OCPI-2.2.1-eMSP-Server](https://github.com/extrawest/Extrawest-OCPI-2.2.1-EMSP-Server)
- [Rest-assured](https://rest-assured.io/)
- [Testcontainers](https://testcontainers.com/)
- [Docker](https://www.docker.com/)

## Requirements

- [Java 17 or higher](https://www.oracle.com/java/)
- [Maven 3.6 or higher](https://maven.apache.org/)

## Features

Requests Initiated by eMSP:
//TODO:: add description here

## Installation

Install 1/2: Add this to pom.xml:

```
<dependency>
    <groupId>com.extrawest</groupId>
    <artifactId>bdd_ocpi2.2.1_cpo</artifactId>
</dependency>
```

Run Docker on machine to be able to use Test DB in docker container.

Install 2/2: Run via command line

```bash
mvn install
```

## Setup

You need to set port via [application.properties](src/main/resources/application.properties). For example:

```
server.port=3000
```

## Running Tests

1. You need to create a feature file. The file should be located
   in ['src/test/resources/features'](src/test/resources/features).
2. You need to write a test scenario.
3. Run the scenario.

Or you can copy scenario script
from [the folder](https://gitlab.extrawest.com/i-training/oleg-shiriaev-training/bdd_ocpi2.2.1_cpo/-/tree/main/src/test/resources/features).
Just change data and run

## Given

###### All text in steps is case-sensitive.

#### Run Docker container and populate Mongo DB for eMSP Server

If your eMSP Server has MongoDB as source of data, you can use Given Step to populate Test Database, e.g.:

```
Given eMSP has "tariffs" data "db/tariffs.json"
```

For this step to work correctly you need to run Docker on your machine, otherwise you will see error log "Could not find
a valid Docker environment".
Put your json scripts with mongo collections or use scripts
from [the folder](https://gitlab.extrawest.com/i-training/oleg-shiriaev-training/bdd_ocpi2.2.1_cpo/-/tree/main/src/main/resources/db)

Before all tests TestContainer creates Mongo Docker Container and waits log message "Connection accepted" two times.
The first "Connection accepted" means that current BDD application is connected to Mongo BD, the second - eMSP Server,
that is under testing, connects to Mongo DB Container.
To connect eMSP Server to test Mongo DB Container you need to provide credentials in eMSP Server's properties file.

```
spring.data.mongodb.host=localhost
spring.data.mongodb.port=27018
spring.data.mongodb.database=test
spring.data.mongodb.auto-index-creation=true
```

Mongo Container is created based on mongo:6.0.3 Docker image and has exposed container's port ```27017``` to hosts
port ```27017```.

## When

Provided query parameters, headers and path parameter are stored in scope of scenario. So parameters can be provided in
first step and omitted in next steps.
E.g:

```gherkin
  When CPO with "party_id" "BEC" and "country_code" "DE" removes his "tariff" with "tariff_id" "Green5"
  Then "tariff" is absent
```

Most OCPI requests has required query parameters "party_id", "
country_code", [Client Owned Object's](https://github.com/ocpi/ocpi/blob/480973547169dee2fe6d12b1a0fe604623efcbb5/transport_and_format.asciidoc#transport_and_format_client_owned_object_push)
id.
In case HTTP request required more query or path parameters they can be provided in separate steps, e.g.:

```gherkin
  When "date_from" path param is "2022-01-01T07:15:10"
  And "date_to" path param is "2025-10-24T07:15:10"
  And "limit" query param is "3"
  And CPO checks "tariff"s in eMSP system
```