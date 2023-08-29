---
title: 204 No Content
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 204 No Content status code means, when it is used, and how it relates to CORS preflight requests.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 204 status code means a request was successful, and the server doesn't have a response body (payload) to return.

This status code is useful when clients don't need or servers don't have a response body. Some real-life examples:

* deleting a record in the <abbr title="Application Programming Interface">API</abbr> (using the HTTP DELETE method)
* saving file progress in the document editor (for example, Google Docs)
* [CORS preflight requests](#preflight-requests)

<a href="https://datatracker.ietf.org/doc/html/rfc7231#section-6.3.5" target="_blank" rel="noopener">HTTP spec</a> states that the <q cite="https://datatracker.ietf.org/doc/html/rfc7231#section-6.3.5">response is terminated by the first empty line after the header fields</q>. Most HTTP clients indeed ignore the response body upon encountering a `204 No Content` response. Despite that, some web servers still include it.

## Preflight requests

`204 No Content` is commonly used as a response to <abbr title="Cross-Origin Resource Sharing">CORS</abbr> preflight requests. Clients use preflight requests to check if servers can handle actual CORS requests:

    OPTIONS /fly HTTP/1.1
    Origin: https://example.com
    Access-Control-Request-Method: DELETE
    Access-Control-Request-Headers: Content-Type

If the server can understand CORS and allows the client to send a DELETE request, for example, it will respond with a `204 No Content` and CORS-related headers:

    HTTP/1.1 204 No Content
    Access-Control-Allow-Origin: *
    Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE
    Access-Control-Allow-Headers: Content-Type
    Access-Control-Max-Age: 86400
