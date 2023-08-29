---
title: 415 Unsupported Media Type
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 415 Unsupported Media Type status code means, why this error happens, and how to resolve it.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 415 status code means a server refuses to process the request because the request body (also known as request entity or payload) format is unsupported.

This error might happen when the `Content-Type` or `Content-Encoding` header(s) are _incorrect_ or missing. The server also reserves the right to return this status code upon inspecting the body, notwithstanding the correctness of those headers.

## Content-Type

`Content-Type` header indicates the <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types" target="_blank" rel="noopener">media type (<abbr title="Multipurpose Internet Mail Extensions">MIME</abbr>)</a> of the payload. Make sure you include this header with all HTTP requests containing a request body, namely POST, PUT, and PATCH requests.

    Content-Type: application/json

## Content-Encoding

`Content-Encoding` header indicates which compression method (encoding) is applied to the request body. Compression speeds up web browsing and saves bandwidth by encoding data using fewer bits than the original representation. <a href="https://almanac.httparchive.org/en/2021/compression#server-settings-for-http-compression" target="_blank" rel="noopener">Most common compression algorithms</a> used on the web today are gzip and brotli.

    Content-Encoding: br, gzip, deflate
