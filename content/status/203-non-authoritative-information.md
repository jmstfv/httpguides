---
title: 203 Non-Authoritative Information
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 203 Non-Authoritative Information status code means and why you shouldn't use it.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 203 means the request has been modified by the proxy or intermediate server.

The proxy server (also known as gateway) sits in between the client and the upstream server. Proxies can serve multiple purposes: caching, content filtering, security, <abbr title="Transport Layer Security">TLS</abbr> termination, performance improvement, etc...

For example, a proxy in a corporate network can monitor all incoming traffic to filter out _inappropriate_ content. In such cases, `203 Non-Authoritative Information` might be a semantically correct status code to use.

<a href="https://datatracker.ietf.org/doc/html/rfc7231#section-6.3.3" target="_blank" rel="noopener">RFC 7231</a> alludes that the `214 Transformation Applied` status code included in the `Warning` header might be a better fit for such cases. However, the `Warning` header isn't widely used and <a href="https://github.com/httpwg/http-core/issues/139" target="_blank" rel="noopener">soon to be deprecated</a>.

In general, avoid using both the 203 status code and the `Warning` header, as they do not have widespread support and obscure the original status code from the upstream server.
