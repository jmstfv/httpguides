---
title: 407 Proxy Authentication Required
created_at: 2023-08-29
updated_at: 2023-08-31
description: Learn what the HTTP 407 Proxy Authentication Required status code means, how it differs from 401 Unauthorized, and when it is used.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 407 status code means a proxy requires authentication for the request.

The proxy server (also known as a gateway) sits between the client and the upstream server. Proxies can serve multiple purposes: caching, content filtering, security, <abbr title="Transport Layer Security">TLS</abbr> termination, performance improvement, etc...

This status code is similar to [`401 Unauthorized`](401-unauthorized.html), where the server wants the client to authenticate before proceeding with the request.

    GET /secret HTTP/2

The only difference is that the proxy sends the `Proxy-Authenticate` header when it wants clients to authenticate, instead of the `WWW-Authenticate` header in [401](401-unauthorized.html).

    HTTP/2 407 Proxy Authentication Required
    Proxy-Authenticate: Basic realm="You Shall Not Pass"
