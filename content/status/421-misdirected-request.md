---
title: 421 Misdirected Request
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 421 Misdirected Request status code means, when it happens, and how to work around it.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 421 status code means a server received a request that wasn't intended for it and is unable or unwilling to handle the request.

Under the HTTP/2 protocol, browsers will try to reuse connections. During the <abbr title="Transport Layer Security">TLS</abbr> handshake, a server presents a certificate valid for `lol.example.com` and `yikes.example.com`. The client can reuse the connection and try to connect to `yikes.example.com`. If the server doesn't want or can't accept the reused connection, it can return the `421 Misdirected Request` response.

This usually happens when multiple websites are hosted on the same server, sharing the same SSL/TLS certificate (wildcard certificate or multiple <abbr title="Subject Alternative Name">SANs</abbr>), and accessible via HTTP/2 protocol.

<a href="https://bugs.chromium.org/p/chromium/issues/detail?id=546991" target="_blank" rel="noopener">Some browsers</a> will retry a request after encountering this status code.

You have several options around this problem:

* Using separate servers, IP addresses, and SSL/TLS certificates for each website.
* Using <a href="https://httpd.apache.org/docs/current/mod/mod_http2.html#misdirected" target="_blank" rel="noopener">the same configuration</a> for all websites.
* Disabling HTTP/2 support.
* Disabling SSL/TLS session reuse.
