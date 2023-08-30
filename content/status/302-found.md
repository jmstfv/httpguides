---
title: 302 Found
created_at: 2023-08-29
updated_at: 2023-08-30
description: Learn what the HTTP 302 Found status code means, how it differs from 307 Temporary Redirect, and how it relates to search engine optimization (SEO).
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 302 status code means a target resource has temporarily moved to a different URL, indicated in the `Location` header.

Unlike with [301](301-moved-permanently.html) and [307](307-temporary-redirect.html) status codes, 302 signals to clients not to update their links and to keep hitting this endpoint.

    HTTP/2 302 Found
    Location: https://example.com/new

## POST requests

Like with [`301 Moved Permanently`](301-moved-permanently.html), some browsers have been incorrectly converting POST requests to GET requests upon encountering a 302 status code. In such cases, POST data is discarded during a redirect, which goes against the HTTP spec, which states that the client should repeat the request with the same method and body.

If you want to be sure that the request will be retried with the same method and body, use [`307 Temporary Redirect`](307-temporary-redirect.html).

| Request Method | Permanent | Temporary |
|----------|:-------------:|:------:|
| Can change from POST to GET | [301](301-moved-permanently.html) | 302 |
| Can't change from POST to GET | [308](308-permanent-redirect.html) | [307](307-temporary-redirect.html) |

## Search engines

Upon encountering 302, search engines will not replace the page from their indexes, and this status code doesn't pass the _domain authority_ to a new page. Consider using [`301 Moved Permanently`](301-moved-permanently.html) if you want to move a URL to a new location.

Redirects have performance implications, which might negatively impact search engine rankings.
