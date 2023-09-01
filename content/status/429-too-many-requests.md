---
title: 429 Too Many Requests
created_at: 2023-08-29
updated_at: 2023-09-01
description: Learn what the HTTP 429 Too Many Requests status code means and when servers might return it.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 429 status code means a client has sent too many requests.

<abbr title="Application Programming Interface">API</abbr> services typically rate-limit requests to prevent abuse or to sell access to more expensive plans with fewer restrictions. Rate limits are usually implemented using API keys, but it is not uncommon to limit requests by IP address or user-agent.

When a client reaches a certain threshold of requests (for example, 420 requests in one hour), a server that wants to rate-limit the client will send the `429 Too Many Requests` status code.

The server might respond with the `Retry-After` HTTP header, asking a client to retry a request after a certain period.

Some services include HTTP headers like `X-RateLimit-Limit`, `X-RateLimit-Remaining`, and `X-RateLimit-Reset` to inform clients about a limit, how many requests remain before the limit kicks in, and when the limit resets, respectively.
