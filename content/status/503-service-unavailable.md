---
title: 503 Service Unavailable
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 503 Service Unavailable status code means and how it relates to search engine optimization (SEO).
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 503 status code means a server can't handle your request at this moment.

This status code is usually seen when the server is overloaded, under maintenance, or restarting.

Websites might also use this status code to block automated scraping. In such instances, it's advisable to change the `User-Agent` header to a string that resembles a browser and throttle requests. Also, check <a href="/robots.txt" target="_blank" rel="noopener">robots.txt</a> directives to make sure you're abiding by them.

## Search engines

`503 Service Unavailable` is a proper code to return when <a href="https://developers.google.com/search/blog/2011/01/how-to-deal-with-planned-site-downtime" target="_blank" rel="noopener">a website is under maintenance</a>. It signals to search engines that the downtime is temporary. Note that the continuous 4xx or 5xx errors, including 503, might hurt search engine rankings and even get website/webpage deindexed after some time.

Generally speaking, it's better to keep maintenance windows short: a few minutes or hours is fine, several days isn't. If you have a fixed date by which the maintenance will be over, you might want to include a `Retry-After` header.

    Retry-After: Wed, 31 Dec 2042 09:42:00 GMT
