---
title: 411 Length Required
created_at: 2023-08-29
updated_at: 2023-09-01
description: Learn what the HTTP 411 Length Required status code means and how it relates to Content-Length HTTP header.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 411 status code indicates that a request lacks a `Content-Length` header.

The `Content-Length` HTTP header contains the size of the request body (in bytes) and should be sent with all requests that have a request body (payload), typically POST, PUT, and PATCH requests.

    Content-Length: 42

`Content-Length` header is ignored when the data `Transfer-Encoding` header is present.
