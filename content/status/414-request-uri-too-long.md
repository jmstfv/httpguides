---
title: 414 Request-URI Too Long
created_at: 2023-08-29
updated_at: 2025-11-01
description: Learn what the HTTP 414 URI Too Long status code means, why this error happens, and how to work around it in Apache and Nginx.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 414 status code indicates that a server refuses to process a request because the <abbr title="Uniform Resource Identifier">URI</abbr> is too long.

This error might occur for several reasons:

* when the POST request was (incorrectly) converted to the GET request, creating a large query string
* infinite redirects keep expanding the URL on each redirect
* a malicious user is trying to <abbr title="Denial of Service">DoS</abbr> a server by sending a long URL

While <a href="https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.12" target="_blank" rel="noopener">HTTP 1.1 spec</a> doesn't mandate any hard limits concerning the URI length, most modern browsers impose a limit of <a href="https://chromium.googlesource.com/chromium/src/%2B/HEAD/docs/security/url_display_guidelines/url_display_guidelines.md#url-length" target="_blank" rel="noopener">2MB</a>, whereas search engines and <a href="https://developers.cloudflare.com/support/troubleshooting/http-status-codes/4xx-client-error/error-414/#cloudflare-specific-information" target="_blank" rel="noopener">CDNs</a> tend to have tigher limits.

Overwhelmingly, this happens when someone _misuses_ GET requests to send form data encoded in a large query string. In such instances, it's better to stick to POST requests unless you have _a very good reason_ not to. Most web servers do allow you to increase the default limit if you want to accommodate such use cases.

## Nginx

If your nginx error logs contain the message `client sent too long URI while reading client request line`, it means the request URI has exceeded the allowed limit.

In nginx, the maximum allowed URI length is defined by the <a href="https://nginx.org/en/docs/http/ngx_http_core_module.html#large_client_header_buffers" target="_blank" rel="noopener">`large_client_header_buffers`</a> directive, which consists of two values: _number_ and _size_ of buffers. It defaults to `4 8k`, which means Nginx caps each request line to 8 kilobytes.

    large_client_header_buffers 4 128K;

If you still get 414 responses from Nginx, keep increasing the buffer size (the second part, `16K` in the above example). Don't forget to reload/restart your server each time you change a config.

## Apache

You can increase the maximum allowed URI length in Apache by tweaking the <a href="https://httpd.apache.org/docs/current/mod/core.html#limitrequestline" target="_blank" rel="noopener">`LimitRequestLine`</a> directive. By default, Apache accepts URIs up to 8190 bytes.

    LimitRequestLine 128000

## Trivia

Due to backward compatibility requirements, Apple platforms (macOS and iOS) can accept URIs <a href="https://github.com/apple/swift-corelibs-foundation/blob/af3bfa27cccc5b20420ef9dc4ea15341e83611b5/CoreFoundation/URL.subproj/CFURLComponents_URIParser.c#L715" target="_blank" rel="noopener">up to 2 gigabytes in size</a>.

## See also

* [431 Request Header Fields Too Large](431-request-header-fields-too-large.html) - when HTTP headers are too large for the server to accept.
