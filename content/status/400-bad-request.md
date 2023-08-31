---
title: 400 Bad Request
created_at: 2023-08-29
updated_at: 2023-08-31
description: Learn what the HTTP 400 Bad Request status code means and when it happens.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 400 status code means a server doesn't want to process a request because of a client error.

It's a generic, catch-all status code that's best used when there aren't [more descriptive status codes available](/#client-error-4xx).

Common causes of `400 Bad Request` errors:

* malformed request body (payload)
* bad/malformed URL
* large request body, headers, or cookies ([413](413-request-entity-too-large.html) and [431](431-request-header-fields-too-large.html) status codes would be more appropriate in those cases)
* invalid or expired cookie
