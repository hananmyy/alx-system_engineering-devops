## Task 0: Simple Web Stack

This setup uses a single server with the following components:
- Nginx (Web server)
- Application server (e.g. Gunicorn/uWSGI)
- Application codebase
- MySQL database
- Domain `www.foobar.com` pointing to `8.8.8.8` using an A record

### Key Notes
- The web server handles HTTP requests.
- The application server executes business logic.
- The database stores and retrieves data.
- Communication occurs via HTTP over TCP/IP.


# Task 1: Distributed Web Infrastructure

## Overview

This setup distributes traffic to two web application servers via a single load balancer. All backend services connect to one central MySQL database.

## Components

- **HAProxy (Load Balancer)**: Directs traffic using Round Robin distribution algorithm across two app servers.
- **Web + App Servers (2)**: Each handles frontend and backend logic; both contain the same codebase.
- **MySQL Database**: Central data store for application; could later support a Primary-Replica setup.

## Load Balancing

- **Algorithm**: Round Robin evenly spreads incoming requests.
- **Setup**: Active-Active — both servers are live to prevent downtime and distribute load.
- **Scaling**: Supports horizontal scaling by adding more app servers behind the load balancer.

## Issues

- **SPOF**: The single load balancer can fail.
- **No Security**: No encryption (HTTP), firewalls, or DDoS protection.
- **No Monitoring**: Cannot detect slowdowns or failures proactively.

# Task 2: Secured and Monitored Web Infrastructure

## Overview

This architecture builds upon the distributed system by introducing HTTPS, firewalls, and monitoring, transforming the stack into a more secure, production-ready infrastructure.

## Components

- **Load Balancer (HAProxy)**: Routes HTTPS traffic using SSL termination. Protected with a firewall.
- **Web/Application Servers**: Serve frontend and backend logic. Both are firewalled and monitored.
- **MySQL Database**: Central database protected by a firewall and monitored for availability and performance.
- **Firewalls (3 total)**: One on each server to restrict access to approved ports and IP ranges.
- **SSL Certificate**: Enables encrypted communication between users and the load balancer over HTTPS.
- **Monitoring Clients**: Installed on all nodes to collect system and application metrics.

## Security

- **HTTPS**: All client traffic is encrypted to protect sensitive information.
- **SSL Termination**: Done at the load balancer for performance, but internal encryption is recommended in real deployments.
- **Firewalls**: Ensure only necessary services are publicly reachable (e.g., port 443 on LB only).

## Monitoring

- Each server has a monitoring agent to send logs and metrics to a central dashboard.
- Common metrics: CPU, memory, disk, QPS (queries per second), error rates.
- To track web server QPS: enable metrics in Nginx and forward to monitoring platform.

## Limitations

- **Unencrypted internal traffic** if SSL is not re-initiated after termination.
- **Single DB write node** still a SPOF for data integrity.
- **Uniform component stacks** may lead to resource waste and complexity in future scaling.
