# Task 2: Secured and Monitored Web Infrastructure

## Overview

This infrastructure upgrades the distributed setup from Task 1 by introducing **security** and **monitoring** features. The aim is to serve the website `www.foobar.com` securely over HTTPS and gather real-time metrics to ensure reliability and observability.



## Architecture Diagram (Conceptual)
![Diagram Link](<task 2.png>)


##  Security Enhancements

### Firewalls

- **What they do**: Restrict inbound/outbound access to only required ports on each server.
- **Why they're needed**: Reduce the attack surface and ensure only trusted connections are allowed (e.g., Port 443 for HTTPS, Port 3306 for DB).

### HTTPS and SSL Certificate

- **Why HTTPS is used**: Encrypts data in transit to prevent eavesdropping and man-in-the-middle attacks.
- **How it works**: The load balancer uses an SSL certificate to terminate HTTPS connections from users.
- **Benefit**: Ensures confidentiality and integrity of data between the browser and the load balancer.



##  Monitoring System

### Monitoring Clients

- **What they do**: Installed on each server to track system and application metrics such as CPU usage, memory, web traffic, and error rates.
- **Examples**: Sumologic, Datadog Agent, Prometheus Node Exporter.

### How Monitoring Works

- Monitoring agents collect performance and event data.
- Data is pushed or pulled to a centralized logging/visualization platform.
- Alerts or dashboards notify admins of abnormal system behavior.

### How to Monitor Web Server QPS (Queries Per Second)

- Enable web server access logging (e.g., Nginx).
- Use metrics like `requests per second` with tools like Prometheus, or log forwarders.
- Aggregate and visualize the data in the monitoring platform.



## Infrastructure Weaknesses

- **SSL Termination at Load Balancer**: Terminating SSL at the load balancer means traffic between the load balancer and backend servers is unencrypted unless additional measures are taken. This leaves internal communication exposed to interception if the private network is compromised.

- **Single Write-Capable MySQL Server**: Having only one MySQL server accepting write operations creates a bottleneck and a single point of failure. If the database becomes unavailable, no data can be added or modified until it is restored.

- **Uniform Component Deployment**: All servers have the same set of services (web server, application server, monitoring client), which may lead to inefficient use of resources. This can complicate scaling and maintenance, as there's no clear separation of concerns between layers of the infrastructure.



## Summary

This secured and monitored stack improves upon high availability with encrypted connections, restricted access via firewalls, and visibility through logging and metrics. However, areas like internal encryption and database redundancy still require attention in future designs.