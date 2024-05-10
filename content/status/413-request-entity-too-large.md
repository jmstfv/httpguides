---
title: 413 Request Entity Too Large
created_at: 2023-08-29
updated_at: 2024-05-10
description: Learn what the HTTP 413 Request Entity Too Large status code means, when it happens, and how to work around it in Apache and Nginx.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 413 status code means a server refuses to process the request because the request body (also known as the request entity or payload) is too large.

The server may choose to close the connection to prevent the client from completing the request. However, if the condition is temporary (for example, a data upload quota for an <abbr title="Application Programming Interface">API</abbr> service), the server should send the `Retry-After` HTTP header, prompting the client to retry after a certain period.

## Apache

You can impose a limit on the request body size by setting the <a href="https://httpd.apache.org/docs/current/mod/core.html#limitrequestbody" target="_blank" rel="noopener">`LimitRequestBody`</a> directive in Apache. The default is set to 1GB (1073741824 bytes). In earlier versions of Apache (2.4.53 and earlier), the default was `0`, meaning there were no restrictions on the request body size.

    LimitRequestBody 1024000

Keep in mind that this directive must be defined before loading virtual hosts, which means it should be placed **at the top of your config file**.

Worth mentioning that the limit is typically imposed by PHP. To increase the file upload and POST request size to 10 megabytes, for example, set the `upload_max_filesize` and `post_max_size` configs in the `php.ini` file.

    upload_max_filesize = 10M
    post_max_size = 10M

## Nginx

In Nginx, the request body size limit is governed by the <a href="https://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size" target="_blank" rel="noopener">`client_max_body_size` config</a>, which is set to `1M` (1 megabyte) by default. To increase the limit to 10 megabytes, for example, set the following line in `/etc/nginx/nginx.conf` file.

    client_max_body_size 10M;

You can disable the file size checking altogether by setting `client_max_body_size` to `0`, although you open yourself up to a <abbr title="Denial of Service">DoS</abbr> attack.

## See also

* [431 Request Header Fields Too Large](431-request-header-fields-too-large.html) - when the server rejects connections when it deems the request headers too large.
