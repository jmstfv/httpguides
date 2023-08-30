---
title: HTTP 504 Gateway Timeout
created_at: 2023-08-29
updated_at: 2023-08-30
description: Learn what the HTTP 504 Gateway Timeout status code means, when it happens, and how to fix it in Apache.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 504 status code means a proxy server (also known as a gateway) didn't receive the response from the upstream server (also known as an origin server) in a timely manner.

Having a proxy server in front of the application (upstream) server is a common pattern in production web apps. Web servers (acting as reverse proxies) are more efficient at and capable of terminating <abbr title="Transport Layer Security">TLS</abbr> connections, dealing with slow clients, compressing requests, and serving static files quickly. Some popular open-source software used as proxies are Apache, Nginx, HAProxy, Varnish, and Caddy.

When proxying requests to the upstream server, make sure to include the following HTTP headers from the web server to the upstream:

    X-Forwarded-For
    X-Forwarded-Host
    X-Forwarded-Port
    X-Forwarded-Proto
    X-Real-Ip

## Apache

if you're running into a 504 status code with Apache, try increasing the <a href="https://httpd.apache.org/docs/current/mod/core.html#timeout" target="_blank" rel="noopener">`TimeOut` directive</a> in your `httpd.conf` file:

    TimeOut 600

Also, match <a href="https://www.php.net/manual/en/info.configuration.php#ini.max-execution-time" target="_blank" rel="noopener">the `max_execution_time` directive</a> in your php.ini config file to the `TimeOut` value you set in your `httpd.conf` file:

    max_execution_time=600

While you can increase the timeout on the web server, it is better to check the upstream server and make sure there are no surprises there.
