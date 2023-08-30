---
title: 308 Permanent Redirect
created_at: 2023-08-29
updated_at: 2023-08-30
description: Learn what the HTTP 308 Permanent Redirect status code means, how it differs from 301 Moved Permanently, and how it relates to search engine optimization (SEO).
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 308 status code means a requested resource has been moved to a different URL once and for all, and from now on, clients should look for this resource in a new location (as indicated in the `Location` header):


     HTTP/2 308 Permanent Redirect
     Location: https://example.com/new

## 308 vs 301

308 is similar to the [`301 Moved Permanently`](301-moved-permanently.html) status code: the redirect is permanent, and clients should update their links.

The difference is that with 308, clients _should_ reuse the same request method and body that appeared in the original request.

| Request Method | Permanent | Temporary |
|----------|:-------------:|:------:|
| Can change from POST to GET | [301](301-moved-permanently.html) | [302](302-found.html) |
| Can't change from POST to GET | 308 | [307](307-temporary-redirect.html) |

## Browser support

`308 Permanent Redirect` was <a href="https://datatracker.ietf.org/doc/html/rfc7238" target="_blank" rel="noopener">introduced in 2014</a>, so <a href="https://caniuse.com/mdn-http_status_308" target="_blank" rel="noopener">ancient browsers don't support it</a>. If backward compatibility with ancient clients is a consideration, use [301](301-moved-permanently.html).

## Search engines

Search engines treat 308 the same way they do [301s](301-moved-permanently.html#search-engines): they pass most, if not all, of the _domain authority_ (aka link juice) to the new URL.
