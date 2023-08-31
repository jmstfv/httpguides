---
title: 405 Method Not Allowed
created_at: 2023-08-29
updated_at: 2023-08-31
description: Learn what the HTTP 405 Method Not Allowed status code means and when it happens.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 405 status code means a server doesn't support the requested HTTP method.

For example, sending a PATCH request to an endpoint that only supports GET requests will trigger the HTTP 405 error.

When responding with this status code, the server should include the `Allow` header, indicating supported HTTP methods (even though this is a requirement, not all websites abide by this rule).

    Allow: GET, HEAD, POST

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

Note that some firewalls and network <abbr title="Access Control Lists">ACLs</abbr> might disable particular HTTP methods for increased security. The <abbr title="Open Web Application Security Project">OWASP</abbr> recommends <a href="https://owasp.org/www-community/attacks/Cross_Site_Tracing" target="_blank" rel="noopener">disabling the HTTP TRACE method</a> because it can be used for the _Cross-Site Tracing (XST)_ attack.

## Try it yourself

Send a `TRACE` request method using <a href="https://curl.se/docs/manpage.html#-X" target="_blank" rel="noopener">`-X, --request`</a> option in <a href="https://curl.se/" target="_blank" rel="noopener">curl</a>:

    curl -X TRACE https://example.com

## Trivia

HTTP/1.0 and HTTP/1.1 defined the LINK and UNLINK HTTP methods, but they <a href="https://datatracker.ietf.org/doc/html/draft-snell-link-method-12" target="_blank" rel="noopener">never gained wide adoption</a>. Roughly speaking, LINK is equivalent to a hyperlink in the HTTP realm, while UNLINK is for removing relations established by LINK.
