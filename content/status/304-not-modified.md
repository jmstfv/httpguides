---
title: 304 Not Modified
created_at: 2023-08-29
updated_at: 2023-08-30
description: Learn what the HTTP 304 Not Modified status code means and how it is used in caching.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 304 is a response code servers use when they don't see a need to transfer a resource.

`304 Not Modified` is a response to conditional HEAD and GET requests. The most common use-case is caching. For example, a browser can request a <abbr title="Cascading Style Sheets">CSS</abbr> file only if it has changed since the previous request; otherwise, a browser returns a cached copy stored locally.

Clients and servers use two sets of headers to enable this:

* `Last-Modified` and `If-Modified-Since` - date and time when the resource was last updated
* `ETag` and `If-None-Match` - a unique hash identifying the resource

Servers usually include `Last-Modified` and `ETag` headers in their responses (both can be used interchangeably). When clients send subsequent requests to the server, they include the values in those headers in the `If-Modified-Since` and `If-None-Match` headers, respectively.

When used in combination, `If-None-Match` takes precedence over `If-Modified-Since` because it's more accurate to compare and track hashes rather than timestamps.

    GET /voodoo.css HTTP/2
    If-Modified-Since: Sun, 27 Jan 2021 08:28:37 GMT
    If-None-Match: "1fd5d0a5-30d"

If the file hasn't been modified, the server returns `304 Not Modified` without a body.

    HTTP/2 304 Not Modified

`304 Not Modified` is the equivalent of the [`200 OK`](200-ok.html) response if it hadn't been for the conditional request.
