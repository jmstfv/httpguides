---
title: 505 HTTP Version Not Supported
created_at: 2023-08-29
updated_at: 2023-08-30
description: Learn what the HTTP 505 HTTP Version Not Supported status code means, when it happens, and how to resolve it.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 505 status code means the server doesn't support the _major_ HTTP version you're requesting.

It occurs when you specify a non-existent (for example, HTTP/1.2) or unsupported (for example, HTTP/3) HTTP protocol version in your request.

You might also encounter the `505 HTTP Version Not Supported` status code if you send a valid and supported HTTP version to the server with trailing whitespace. According to the <a href="https://datatracker.ietf.org/doc/html/rfc7230#section-2.6" target="_blank" rel="noopener">HTTP 1.1 spec</a>, the version of the HTTP message should contain the string `HTTP`, followed by a forward slash, and the protocol version formatted as `<major>.<minor>`.

    HTTP "/" DIGIT "." DIGIT

If you're using the protocol version without a minor version (for example, HTTP/2 or HTTP/3), you can omit the minor version part.

## Bad URL

In some cases, the server might return this status code when the URL is invalid or malformed. Make sure the request URL is valid, and all characters are properly encoded. Pay extra attention to whitespaces, and replace them with `%20` if you find any (URL encoding for a whitespace character).
