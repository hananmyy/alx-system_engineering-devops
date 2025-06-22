# Task 3: Scale Up – Advanced Web Infrastructure

## Overview

This advanced infrastructure builds on prior iterations by further decoupling components, clustering the load balancer, and distributing roles across multiple dedicated servers. It enhances scalability, fault tolerance, and maintainability by isolating responsibilities and eliminating remaining single points of failure.

## Architecture Diagram (Conceptual)
![Diagram Link](<task 3.png>)


## Components

### 1. Load Balancer Cluster (HAProxy)

We now have a **clustered load balancing setup**, consisting of two HAProxy instances. This configuration provides high availability: if one load balancer goes down, the other seamlessly takes over.

- **Why it’s added**: Prevents a single point of failure at the entry point of the infrastructure. Enables continuous availability of the website even if one load balancer crashes or undergoes maintenance.

### 2. Dedicated Web Server

The web server is now hosted on its own machine and handles static content, SSL termination, and initial routing.

- **Why it’s added**: Separating the web server from application logic improves performance and modularity. It reduces resource contention and simplifies scaling of the presentation layer independently of the application logic.

### 3. Dedicated Application Server

The application server runs backend logic - processing dynamic user requests, interacting with the database, and executing core functionality.

- **Why it’s added**: Isolating the app server allows for specialized scaling and performance tuning. Backend logic is typically more resource-intensive and benefits from separate handling.

### 4. Dedicated Database Server (MySQL)

The database now resides on its own server, separate from the app and web layers.

- **Why it’s added**: Improves data integrity, allows for strict access control, and provides the ability to implement advanced database configurations, such as clustering or replication in future stages.

### 5. Additional Server

One additional server is added to accommodate the split components and clustering requirement. This could be used to:
- Host one of the HAProxy instances
- Serve as a future monitoring or cache layer
- Provide flexibility for blue/green deployments or backups

## Application Server vs Web Server

- **Web Server (e.g., Nginx)**:
  - Serves static content (HTML, CSS, images)
  - Terminates SSL connections
  - Proxies dynamic requests to the application server

- **Application Server (e.g., Gunicorn, uWSGI, Node.js)**:
  - Processes dynamic content
  - Executes business logic
  - Interfaces with the database

Separating these roles follows the **separation of concerns** principle, enhancing scalability and fault isolation.

## Summary

This scaled-up infrastructure introduces modularity, redundancy, and production-grade practices. By clustering the load balancer and separating core services onto dedicated servers, the system is now capable of supporting higher traffic, easier debugging, and safer deployments, while remaining resilient against failure at any single point.