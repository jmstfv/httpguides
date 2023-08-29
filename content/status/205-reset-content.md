---
title: 205 Reset Content
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 205 Reset Content status code means and why you shouldn't use it.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 205 status code means a request was successful, and the user agent should _reset_ the document view to its original form.

Theoretically, after a user submits an <abbr title="Hypertext Markup Language">HTML</abbr> form, a browser should clear the form upon receiving the `205 Reset Content` response. Similar to [`204 No Content`](204-no-content.html), servers shouldn't include a response body (payload) with `205 Reset Content`.

Most clients don't handle this response code properly, so you're better off using either the [`200 OK`](200-ok.html) or [`204 No Content`](204-no-content.html) status codes.
