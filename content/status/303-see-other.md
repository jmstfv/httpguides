---
title: 303 See Other
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 303 (See Other) status code means.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 303 status code means a redirect to another location, which provides an _indirect_ response to the request.

Imagine a case where you want to place an order online. You submit a POST or PUT request, and a server redirects you to a confirmation page. To find out if the order was successfully placed, you will have to send a GET request to an endpoint in the `Location` header:

    HTTP/2 303 See Other
    Location: https://example.com/yolo
