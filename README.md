Spring Boot | Spring Cloud | Microservices | Config Server
# Spring Cloud Config Server

## Overview

This project implements a **centralized configuration server** for a microservices architecture using **Spring Boot** and **Spring Cloud Config Server**.

The Config Server acts as an intermediary between microservices and a dedicated configuration repository. Instead of hardcoding configuration values inside each service, configuration files are stored in a separate repository and fetched dynamically by services at runtime.

This approach provides better maintainability, scalability, and separation of concerns in distributed systems.

---

## Key Concepts

In a microservices environment, services often require configuration such as:

* database connection properties
* API keys
* service-specific settings
* environment configurations

Instead of duplicating these values across services, they are managed centrally through the Config Server.

### Benefits

* **Centralized configuration management**
* **Improved maintainability**
* **Environment-based configuration**
* **Reduced configuration duplication**
* **Cleaner service code without hardcoded values**

---

## Architecture

```text
             ┌─────────────────────┐
             │   Microservices     │
             │ user-service        │
             │ gateway-service     │
             │ other services      │
             └─────────┬───────────┘
                       │
                       ▼
             ┌─────────────────────┐
             │   Config Server     │
             │ Spring Cloud Config │
             └─────────┬───────────┘
                       │
                       ▼
             ┌─────────────────────┐
             │  Config Repository  │
             │     ms-config       │
             │   (GitHub Repo)     │
             └─────────────────────┘
```

### Configuration Flow

1. A microservice starts.
2. The service requests configuration from the Config Server.
3. The Config Server retrieves configuration from the configuration repository.
4. The configuration values are returned to the requesting service.

---

## Tech Stack

* Java
* Spring Boot
* Spring Cloud Config Server
* Gradle
* GitHub (configuration repository)
* Render (deployment platform)

---

## Project Structure

```text
config-server
 ├─ src/main/java
 │   └─ configserver
 │        └─ ConfigServerApplication
 │
 ├─ src/main/resources
 │   └─ application.yml
 │
 ├─ build.gradle
 └─ README.md
```

---

## Configuration Repository

Configuration files are stored in a separate repository:

Example structure:

```text
ms-config
 ├─ application.yml
 ├─ user-service.yml
 └─ gateway-service.yml
```

Example configuration:

```yaml
app:
  message: Hello from Config Server
```

---

## Running the Config Server

### Clone the repository

```
git clone <repository-url>
cd config-server
```

### Run the application

```
./gradlew bootRun
```

The Config Server will start on:

```
http://localhost:8888
```

---

## Fetching Configuration

Services can retrieve configuration using the following endpoint pattern:

```
http://<config-server-host>:8888/{application-name}/{profile}
```

Example:

```
http://localhost:8888/user-service/default
```

---

## Deployment

This project can be deployed to **Render** or other cloud platforms.

Environment variables may be required to access the configuration repository.

Example:

```
GIT_USERNAME=<github-username>
GIT_PASSWORD=<github-personal-access-token>
```

---

## Example Use Case

Instead of storing configuration directly inside a microservice:

```
user-service
 └─ application.yml
```

Configuration is externalized and stored in the configuration repository:

```
ms-config
 └─ user-service.yml
```

The service retrieves configuration dynamically from the Config Server during startup.

---

## Learning Purpose

This project was created as part of a **personal exploration of microservices architecture**, focusing on:

* centralized configuration management
* separation of configuration from application code
* understanding how microservices communicate with a configuration server

---

## Future Improvements

Possible enhancements for this project:

* integrate **service discovery**
* add **API Gateway**
* implement **multiple environment configurations (dev, staging, prod)**
* secure configuration using **Spring Cloud Vault**

---

## Author

Personal exploration project focused on learning and implementing microservices infrastructure components.
