# Task 0: Simple Web Stack

## Overview

This infrastructure consists of a **single server** configured to serve the website `www.foobar.com`. The setup includes a web server (Nginx), an application server, a codebase, and a MySQL database - all hosted on the same machine.

## Infrastructure Diagram
![Diagram Link](<task 0.png>)

## Key Components

- **Server**: A physical or virtual machine that hosts and runs services. In this case, it processes user requests for the website.
- **Domain Name (foobar.com)**: A human-readable alias mapped to an IP address that allows users to access your website easily.
- **DNS Record (A Record)**: The DNS 'A' record maps `www.foobar.com` to the IPv4 address `8.8.8.8`, enabling browsers to find and reach the server.
- **Web Server (Nginx)**: Accepts HTTP requests from users. It serves static content and proxies dynamic content to the application server.
- **Application Server**: Responsible for executing backend logic (e.g., with a Python or PHP interpreter).
- **Application Files**: The backend and frontend codebase that powers the web application.
- **MySQL Database**: Stores structured data, including user info, content, session details, and other business-critical records.
- **Client-Server Communication**: Occurs via the HTTP protocol, which runs on top of TCP/IP.

## Infrastructure Issues

- **Single Point of Failure (SPOF)**: All services depend on one server. If it goes down, the entire website becomes unavailable.
- **Downtime During Maintenance**: Updating or restarting services (e.g., redeploying code or rebooting the server) causes temporary outages.
- **No Scalability**: This setup cannot handle spikes in user traffic or load distribution. There’s no horizontal scaling.

## Domain Configuration

- The domain `foobar.com` is configured with a `www` **A record** pointing to IP `8.8.8.8`, directing requests to the server hosting the web stack.

