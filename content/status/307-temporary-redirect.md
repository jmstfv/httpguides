---
title: 307 Temporary Redirect
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 307 Temporary Redirect status code means, how it differs from HTTP 302 Found, and how it relates to the Strict Transport Security (HSTS).
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 307 status code means a requested resource has been temporarily moved to a different location.

The new (relative) URL is indicated by a `Location` header:

    Location: /now

## 307 vs 302

`307 Temporary Redirect` is similar to [`302 Found`](302-found.html) in a way that they both indicate a temporary redirect.

Some browsers, like Mosaic, Netscape, and Internet Explorer, have been incorrectly switching to GET requests upon encountering the [302](302-found.html) status code, even if the original request was done with a different HTTP method. With 307, the method and request body of the previous request will be reused for the subsequent request.

| Request Method | Permanent | Temporary |
|----------|:-------------:|:------:|
| Can change from POST to GET | [301](301-moved-permanently.html) | [302](302-found.html) |
| Can't change from POST to GET | [308](308-permanent-redirect.html) | 307 |

## Browser support

`307 Temporary Redirect` was introduced in HTTP/1.1, while [`302 Found`](302-found.html) first appeared in HTTP/1.0 (1999). If the backward compatibility with ancient clients is a consideration, use [302](302-found.html).

## Strict Transport Security (HSTS)

Strict Transport Security (HSTS) is an HTTP header protecting the website against protocol downgrade and cookie hijacking attacks.

If you add the `preload` directive to your HSTS header and <a href="https://hstspreload.org" target="_blank" rel="noopener">request your domain to be preloaded</a>, your domain will eventually be added to the preload list, which is shared across major browsers.

After your domain is preloaded, whenever someone tries to access your website over an unencrypted connection (`http://`), most modern browsers will issue an internal redirect to an encrypted version (`https://`) of a website with a 307 status code.
