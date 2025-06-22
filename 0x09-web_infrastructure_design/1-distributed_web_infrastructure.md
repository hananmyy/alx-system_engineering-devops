# Task 1: Distributed Web Infrastructure

## Overview

This infrastructure setup improves upon the single-server design by distributing services across multiple servers. It introduces load balancing for high availability and scaling, while preserving a shared backend database to centralize data.

The website `www.foobar.com` is resolved via DNS and handled by a load balancer, which distributes requests to two web/application servers. Both servers access a central MySQL database.


## Architecture Diagram
![Diagram Link](<task 1.png>)


## Component Explanations

### Load Balancer (HAProxy)
- **Purpose**: Directs incoming traffic evenly across available servers to reduce load and improve uptime.
- **Why Add It**: Prevents a single server from being overwhelmed. Enables fault tolerance if one app server fails.
- **Distribution Algorithm**: **Round Robin** - requests are routed sequentially to each backend server in turn, ensuring an even load distribution.
- **Setup Type**: **Active-Active** - both application servers are simultaneously live and handle requests in parallel.  
  - *Active-Passive*, by contrast, keeps one server in standby mode and only activates it on failure.

### Web and Application Servers (2 Instances)
- **Why Add Them**: Increases scalability and resilience. If one fails, the other can continue serving users.
- **Role**: Each handles web requests via Nginx, processes backend logic, and reads/writes to the shared database.
- **Application Files**: Identical copies of the codebase are deployed to both servers for consistency.

### MySQL Database
- **Purpose**: Stores structured data used by the application - user info, posts, transactions, etc.
- **Optional Enhancement**: Primary-Replica Configuration (not required here but relevant for future scaling).
  - **Primary Node**: Accepts both read and write operations.
  - **Replica Node**: Receives real-time or near-real-time updates from the primary and supports read-only queries to distribute load.



## SPOF & Design Limitations

- **Single Point of Failure (SPOF)**: While app servers are redundant, the **load balancer** is still a SPOF unless made redundant itself.
- **Security Gaps**: No HTTPS or firewall implementation yet. Vulnerable to attacks, sniffing, or data breaches.
- **No Monitoring**: There’s no visibility into server health, traffic patterns, or performance bottlenecks.



## DNS Configuration

- The domain `www.foobar.com` uses a **DNS A record** to map to the IP address of the **load balancer**.