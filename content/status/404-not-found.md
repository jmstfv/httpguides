---
title: 404 Not Found
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 404 Not Found status code means and how it relates to search engine optimization (SEO).
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 404 status code means a resource doesn't exist or the server doesn't want clients to know that it exists.

`404 Not Found` doesn't specify whether the resource is temporarily or permanently gone. If you want to signal that the resource was permanently and deliberately removed, use [`410 Gone`](410-gone.html).

## Search engines

Upon encountering the `404 Not Found` error, search engines eventually remove a page from their indexes, albeit slower than they do with 410s.

## Soft 404

In the <abbr title="Search Engine Optimization">SEO</abbr> world, soft 404 is a page that tells the user it doesn't exist but returns the [`2xx` status code](/#success-2xx). This often happens when the developer serves a custom error page but forgets to set the appropriate status code.

Upon encountering soft 404s, <a href="https://developers.google.com/search/docs/advanced/crawling/soft-404-errors" target="_blank" rel="noopener">search engines might remove</a> the page from their indexes.
