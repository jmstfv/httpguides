---
title: 410 Gone
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 410 Gone status code means, when it is an appropriate code to return, and how it differs from 404 Not Found.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 410 status code means a resource is gone forever.

`410 Gone` implies that the resource was intentionally removed, and clients shouldn't look for it in the future. Think of it as a more specific version of [`404 Not Found`](404-not-found.html), which doesn't imply anything about the future availability of the resource.

When in doubt, use [404](404-not-found.html).

## Search engines

Search engines <a href="https://www.youtube.com/watch?v=xp5Nf8ANfOw" target="_blank" rel="noopener">remove the page from their indexes</a> upon encountering the `410 Gone` status code (generally faster than they do with 404s).
