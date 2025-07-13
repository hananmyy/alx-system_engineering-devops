# SSL Load Balancer Deployment — ALX Capstone Project

**Project Role**: DNS setup, load balancing, SSL termination, and HTTP redirect

## Domain
**Primary Domain**: `firstvmlab.ddns.net` (registered via No-IP)

## Infrastructure Overview

 `firstvm`  -  Load Balancer  - `192.168.56.101` 
 `backend1` -  Web Server 1  - `192.168.56.102` 
 `backend2` -  Web Server 2  - `192.168.56.103` 

## Task 0: World Wide Web

- Created DNS hostname: `firstvmlab.ddns.net`
- Simulated subdomains via `/etc/hosts`:
`www.firstvmlab.ddns.net` lb-01.firstvmlab.ddns.net web-01.firstvmlab.ddns.net web-02.firstvmlab.ddns.ne

- Built `0-world_wide_web` Bash script:
- Audits DNS resolution with `dig` and `awk`
- Accepts domain and optional subdomain arguments
- Verified using:
```bash
getent hosts www.firstvmlab.ddns.net
curl www.firstvmlab.ddns.net
```


## Task 1: SSL Termination with HAProxy

**Objective**: Enable secure HTTPS access on the load balancer (`firstvm`) using a valid SSL certificate.

### Steps Taken

1. Checked public IP:
   ```bash
   curl ifconfig.me
   ```
- Updated No-IP DNS to point firstvmlab.ddns.net to this IP.
2. Stopped HAProxy to free port 80:
`sudo systemctl stop haproxy`

3.  Requested SSL certificate from Let's Encrypt
`sudo certbot certonly --standalone -d firstvmlab.ddns.net`

4. Combined cert files into a single .pem
`sudo bash -c 'cat /etc/letsencrypt/live/firstvmlab.ddns.net/fullchain.pem /etc/letsencrypt/live/firstvmlab.ddns.net/privkey.pem > /etc/ssl/private/haproxy.pem'`

5. Edited HAProxy config (/etc/haproxy/haproxy.cfg)
frontend https-in
    bind *:443 ssl crt /etc/ssl/private/haproxy.pem
    default_backend web-backends

backend web-backends
    balance roundrobin
    server backend1 192.168.56.102:80 check
    server backend2 192.168.56.103:80 check

6. Restarted HAProxy:
`sudo systemctl start haproxy`

7. Verified HTTPS content
`curl -s https://firstvmlab.ddns.net`
Expected output includes "ALX"



## Task 2: Redirect HTTP to HTTPS

**Objective**:  
Automatically redirect all HTTP traffic (port 80) to HTTPS (port 443) using HAProxy.

### Steps Taken

1. **Edited HAProxy configuration to include HTTP-to-HTTPS redirection**
  ```txt
  frontend http-in
      bind *:80
      redirect scheme https code 301 if !{ ssl_fc }

2. Restarted HAProxy:
sudo systemctl start haproxy

3. Verified HTTP redirect
`curl -I http://firstvmlab.ddns.net`
-**Expected**:
HTTP/1.1 301 Moved Permanently
Location: https://firstvmlab.ddns.net/

4. Verified secure content
`curl -s https://firstvmlab.ddns.net`
Output contains "ALX"