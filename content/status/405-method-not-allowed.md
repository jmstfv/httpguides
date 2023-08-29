---
title: 405 Method Not Allowed
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 405 Method Not Allowed status code means and when it happens.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 405 status code means a server doesn't support the requested HTTP method.

For example, sending a POST request to the endpoint that only supports GET requests will trigger the HTTP 405 error.

When responding with this status code, the server might include the `Allow` header indicating supported HTTP methods.

    Allow: GET, HEAD

Note that some firewalls and network <abbr title="Access-control Lists">ACLs</abbr> might disable particular HTTP methods for increased security. The <abbr title="Open Web Application Security Project">OWASP</abbr> recommends <a href="https://owasp.org/www-community/attacks/Cross_Site_Tracing" target="_blank" rel="noopener">disabling the HTTP TRACE method</a> because it can be used for the "Cross-Site Tracing (XST)" attack.

As of today, there are 9 available HTTP methods:

* HEAD
* GET
* POST
* PUT
* PATCH
* DELETE
* OPTIONS
* TRACE
* CONNECT

## Trivia

HTTP/1.0 and HTTP/1.1 defined LINK and UNLINK HTTP methods, but they <a href="https://datatracker.ietf.org/doc/html/draft-snell-link-method-12" target="_blank" rel="noopener">never gained wide adoption</a>. Roughly speaking, LINK is an equivalent of a hyperlink in the HTTP realm, while UNLINK is for removing relations established by LINK.
