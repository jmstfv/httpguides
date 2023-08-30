---
title: 502 Bad Gateway
created_at: 2023-08-29
updated_at: 2023-08-30
description: Learn what the HTTP 502 Bad Gateway status code means, when it happens, and how to go about debugging it.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 502 status code means a proxy server (also known as a gateway) didn't receive a _valid_ response from the upstream server (also known as the origin server).

Having a proxy server in front of the application (upstream) server is a common pattern in production web apps. Web servers (acting as reverse proxies) are more efficient at and capable of terminating <abbr title="Transport Layer Security">TLS</abbr> connections, dealing with slow clients, compressing requests, and serving static files quickly. Some popular open-source software used as proxies are Apache, Nginx, HAProxy, Varnish, and Caddy.

Make sure that the upstream server:

* can respond to HTTP requests
* isn't blocked by a firewall
* isn't overloaded with too many requests
* and its hostname can be resolved
