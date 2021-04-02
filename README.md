# Task-Manager
Task Manager built on Spring Boot

## Run locally

To run this application locally, you need :  
 * To have Java JDK 8 or above installed and an IDE to import the project.
 * MySQL installed in your system.

After opening the IDE import this project as Existing Maven Project.

There are few changes to be made in \src\main\resources\application.properties file

```
spring.datasource.url=jdbc:mysql://localhost/{enter the name of DB to be used }
spring.datasource.username={username credentials for your project}
spring.datasource.password={ password for that username}
```

Your app should be up and running on `localhost:8080`

## Tech Stack
  * **Spring Boot Framework.**
  * **MySQL database.**
  * **HTML, CSS, Bootstrap and JSP files for front end.**
