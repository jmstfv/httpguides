---
title: 428 Precondition Required
created_at: 2023-08-29
updated_at: 2023-09-01
description: Learn what the HTTP 428 Precondition Required status code means and how it's used to minimize the risk of conflicts during unsafe methods.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 428 status code occurs when a server requires a client to use a conditional request.

HTTP supports conditional requests (requests that contain one or more `If-*` headers), which are often used in caching. Conditional requests can also be used to verify the integrity of files through checksums.

It can be useful when a client wants to update a resource they retrieved a while back. While the client has been making changes, the file could have been updated or deleted in the meantime (_lost update problem_ is the term-of-art). By forcing clients to use a conditional request, the server minimizes the risk of conflicts.

    PUT /upload HTTP/2

The server should reply with instructions on how to resubmit the request correctly. In most cases, you'd have to include the `If-Match` header.

    HTTP/2 428 Precondition Required

## See also

* [412 Precondition Failed](412-precondition-failed.html) - a status code server uses when one or more preconditions aren't met.
