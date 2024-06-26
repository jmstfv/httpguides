---
title: 431 Request Header Fields Too Large
created_at: 2023-08-29
updated_at: 2024-05-10
description: Learn what the HTTP 431 Request Headers Fields Too Large status code means, when this error happens, and how to work around it in Nginx, Node.js, and Apache.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 431 status code indicates that a server refuses to process a request because HTTP headers are too large.

While the HTTP spec doesn't impose any limits on the size of headers, most web servers do. Servers can use this status code when the size of a single header field or the total size of all headers exceeds the limit.

More often than not, the culprit is a cookie-related header (`Set-Cookie` or `Cookie`). It is also worth checking the `Referer` and `User-Agent` headers as they can be easily spoofed.

## HTTP/2

According to the <a href="https://httpwg.org/specs/rfc7540.html#CompressCookie" target="_blank" rel="noopener">HTTP/2 specification</a>, the cookie header may be split into multiple header fields for better compression efficiency (HPACK). That might cause a problem when there are too many cookie-related header fields.

While you can configure some web servers to accommodate larger cookies, keep in mind that this could open an avenue for a denial of service (DoS) attack.

Make sure to clear cookies from your browser before tweaking the configuration parameters.

## Nginx

Instead of returning the 431 status code when the cookie or header size is too large, Nginx responds with the `400 Bad Request Request Header Or Cookie Too Large`. To accommodate larger cookies or headers, keep increasing the <a href="https://nginx.org/en/docs/http/ngx_http_core_module.html#client_header_buffer_size" target="_blank" rel="noopener">`client_header_buffer_size`</a> directive until you get a [`200 OK`](200-ok.html) response:

    client_header_buffer_size 128k;

If you're using the HTTP/2 module for nginx, you can configure the <a href="https://nginx.org/en/docs/http/ngx_http_v2_module.html#http2_max_header_size" target="_blank" rel="noopener">`http2_max_header_size`</a> to control the allowed size of all headers. The default is `16K`, which means all headers can occupy no more than 16 kilobytes of space after decompression.

Also, consider increasing the limit for the <a href="https://nginx.org/en/docs/http/ngx_http_v2_module.html#http2_max_field_size" target="_blank" rel="noopener">maximum size of a request header field (HPACK-compressed)</a>. The default is `4k`, which means a request header's name or value can't exceed 4 kilobytes.

    http2_max_header_size 32k;
    http2_max_field_size 8k;

Nginx will <a href="https://trac.nginx.org/nginx/ticket/1520" target="_blank" rel="noopener">disconnect the HTTP/2 session</a> upon encountering large headers or request lines instead of returning 431 or [414](414-request-uri-too-long.html) status codes.

## Apache

Apache limits the length of HTTP headers to 8,190 bytes (8 kilobytes). You can change this default by specifying the <a href="https://httpd.apache.org/docs/current/mod/core.html#limitrequestfieldsize" target="_blank" rel="noopener">`LimitRequestFieldSize` directive</a>:

    LimitRequestFieldSize 16382

If that doesn't resolve the 431 errors, consider modifying the <a href="https://httpd.apache.org/docs/current/mod/core.html#limitrequestline" target="_blank" rel="noopener">`LimitRequestLine` directive</a> as well; this governs the maximum size of the HTTP request line.

Keep in mind that these directives must be defined before loading virtual hosts, which means they should be placed **at the top of your config file**.

## Node.js

In Node.js, the default limit for header size was reduced from about 80 kilobytes to <a href="https://github.com/nodejs/node/commit/186035243fad247e3955fa0c202987cae99e82db" target="_blank" rel="noopener">8 kilobytes</a> to prevent <a href="https://nodejs.org/en/blog/vulnerability/november-2018-security-releases#denial-of-service-with-large-http-headers-cve-2018-12121" target="_blank" rel="noopener">denial of service attacks</a> using large HTTP headers (<a href="https://nvd.nist.gov/vuln/detail/CVE-2018-12121" target="_blank" rel="noopener">CVE-2018-12121</a>). However, since this configuration was immutable at the time, the change <a href="https://github.com/nodejs/node/issues/24692" target="_blank" rel="noopener">broke many applications</a>, necessitating an increase to <a href="https://github.com/nodejs/node/commit/bd9f4d295495b11d2e460b320681e18a11524bb8" target="_blank" rel="noopener">16 kilobytes</a> in later versions.

Starting from <a href="https://github.com/nodejs/node/pull/24811" target="_blank" rel="noopener">versions 10.15.0 and 11.6.0</a>, you can pass the `--max-http-header-size` flag to control the maximum header size.

    node --max-http-header-size=65536 index.js

Alternatively, you could pass the <a href="https://nodejs.org/api/http.html#http_http_maxheadersize" target="_blank" rel="noopener">`maxHeaderSize`</a> option for servers and client requests.

## See also

* [413 Request Entity Too Large](413-request-entity-too-large.html) - when the server rejects connections when it deems the request body too large.
