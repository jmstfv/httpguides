---
title: 501 Not Implemented
created_at: 2023-08-29
updated_at: 2023-08-31
description: Learn what the HTTP 501 Not Implemented status code means and how it differs from 405 Method Not Allowed.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 501 status code means a server can't process the request because it doesn't support a particular feature.

The most common example of this would be sending an unsupported request method to the server.

This status code is similar to [405 Method Not Allowed](405-method-not-allowed.html). Semantically, `4xx` are client errors, while `5xx` are server errors. It implies that 405 is appropriate when a client shouldn't have requested the particular method, while 501 means a server doesn't understand the requested method.

## Try it yourself

Send an arbitrary request method using <a href="https://curl.se/docs/manpage.html#-X" target="_blank" rel="noopener">`-X, --request`</a> option in <a href="https://curl.se/" target="_blank" rel="noopener">curl</a>:

    curl -X LOL http://example.com
