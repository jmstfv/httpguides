---
title: 100 Continue
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 100 Continue status code means, how servers can use it to save bandwidth, and how curl handles the Expect header.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 100 status code means a request looks good so far and that the client should continue with the request.

Imagine a case where you want to upload a large file to the server. Most web servers have limits on acceptable sizes of incoming messages to prevent <abbr title="Denial of Service">DoS</abbr> attacks (there can be other restrictions, such as authentication, authorization, or lack of support for particular HTTP methods). Instead of wasting bandwidth to send the file and having the request fail somewhere along the way, you can ask the server if it is OK to proceed with the upload.

This mechanism gives the server a chance to error prematurely before the client can send the request body.

`100 Continue` is an informational status code, and in most cases, you won't have to deal with it directly. [Informational status codes (`1xx`)](/#informational-1xx) are temporary and should not be treated as final responses.

## Expect header

You can request permission by including the `Expect` header with the request:

    POST /media HTTP/1.1
    Host: example.com
    Content-Type: video/mp4
    Content-Length: 42424242
    Expect: 100-continue

If the server decides that the request looks acceptable, it will respond with the `100 Continue` status code:

    HTTP/1.1 100 Continue

Note that the `Expect` header <a href="https://datatracker.ietf.org/doc/html/rfc7231#section-5.1.1" target="_blank" rel="noopener">can only have a single value</a>, which is `100-Continue`.

## curl

<a href="https://curl.se" target="_blank" rel="noopener">curl</a> includes the `Expect` header automatically if one of the following holds:

* the request <a href="https://github.com/curl/curl/issues/169" target="_blank" rel="noopener">isn't HTTP/2</a>
* the HTTP request method is PUT
* the HTTP request method is POST, and the message body is either unknown or exceeds 1 megabyte

This mechanism <a href="https://curl.se/mail/lib-2017-07/0013.html" target="_blank" rel="noopener">can cause unnecessary delays</a> in servers that don't handle it properly. That's why curl sends the `Expect` header <a href="https://github.com/curl/curl/pull/4814" target="_blank" rel="noopener">when the body exceeds 1 megabyte</a> (<a href="https://curl.se/mail/lib-2020-01/0050.html" target="_blank" rel="noopener">up from 1 kilobyte</a>).

## See also

* [417 Expectation Failed](417-expectation-failed.html) - status code servers use when they don't support or couldn't understand the `Expect` header.
