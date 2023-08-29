---
title: 411 Length Required
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 411 Length Required status code means and how it relates to Content-Length HTTP header.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 411 status code indicates that a request lacks a `Content-Length` header.

`Content-Length` HTTP header contains the size of the request body (in bytes) and should be sent with all requests that have a request body. Typically, these are POST, PUT, and PATCH requests.

    Content-Length: 42

`Content-Length` header is ignored when the data `Transfer-Encoding` header is present.

## Try it yourself

Send a POST request to example.com with an empty body and without a `Content-Length` header, and you will receive a `411 Length Required` status code:

    curl --verbose -X POST https://example.com

Try resending the same request with a `Content-Length` header, and you will get a [`200 OK`](200-ok.html) response:

    curl --verbose -X POST -H 'Content-Length: 0' https://example.com
