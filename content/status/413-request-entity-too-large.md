---
title: 413 Request Entity Too Large
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 413 Request Entity Too Large status code means, when it happens, and how to work around it in Apache and Nginx.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 413 status code means a server refuses to process the request because the request body (also known as request entity or payload) is too large.

The server may choose to close the connection to prevent the client from finishing the request. However, if the condition is temporary (for example, data upload quota for an <abbr title="Application Programming Interface">API</abbr> service), the server should send the `Retry-After` HTTP header prompting the client to retry after a certain period.

## Apache

You can impose the limit on request body size by setting the <a href="https://httpd.apache.org/docs/current/mod/core.html#limitrequestbody" target="_blank" rel="noopener">`LimitRequestBody` config</a> in Apache. It defaults to `0`, which means there are no restrictions on request body size.

    LimitRequestBody 1024000

It is worth mentioning that the limit is typically imposed by PHP. To increase the file upload and POST request size to 10 megabytes, for example, set `upload_max_filesize` and `post_max_size` configs in the `php.ini` file.

    upload_max_filesize = 10M
    post_max_size = 10M

## Nginx

In Nginx, the request body size limit is governed by the <a href="https://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size" target="_blank" rel="noopener">`client_max_body_size` config</a>, which is set to `1M` (1 megabyte) by default. To increase the limit to 10 megabytes, for example, set the following line in `/etc/nginx/nginx.conf` file.

    client_max_body_size 10M;

You can disable the file size checking altogether by setting `client_max_body_size` to `0`, although you open yourself up for a <abbr title="Denial of Service">DoS</abbr> attack.
