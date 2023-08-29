---
title: 301 Moved Permanently
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 301 Moved Permanently status code means, how it differs from 308 Permanent Redirect, and how it relates to search engine optimization.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 301 status code means a requested resource has been moved to a different URL once and for all.

`301 Moved Permanently` implies a resource has moved permanently to a different location (as indicated in the `Location` header), and from now on, clients should look for this resource in a new location:

    HTTP/2 301 Moved Permanently
    Location: https://example.com/new

## POST requests

Like with [`302 Found`](302-found.html), some browsers have been incorrectly converting POST requests to GET requests upon encountering 301 status code. In such cases, POST data is discarded during a redirect. It goes against the HTTP spec, which states that the client should repeat the request with the same method and body.

If you want to be sure that the request will be retried with the same method and body, use [`308 Permanent Redirect`](308-permanent-redirect.html).

| Request Method | Permanent | Temporary |
|----------|:-------------:|:------:|
| Can change from POST to GET | 301 | [302](302-found.html) |
| Can't change from POST to GET | [308](308-permanent-redirect.html) | [307](307-temporary-redirect.html) |

## Search engines

Upon encountering 301, search engines will eventually remove the page from their indexes and pass most of the _domain authority_ (aka link juice), if not all, to the new page.

## Try it yourself

Unlike browsers, most HTTP clients won't follow redirects: you have to explicitly enable this behavior. For example, to follow redirects in <a href="https://curl.se/" target="_blank" rel="noopener">curl</a>, you will have to pass the <a href="https://curl.se/docs/manpage.html#-L" target="_blank" rel="noopener">`-L, --location`</a> option:

    curl -L http://tryhexadecimal.com

If your HTTP library doesn't automatically follow redirects, you will have to extract the `Location` header and recursively follow it until you receive a non-`3xx` code.
