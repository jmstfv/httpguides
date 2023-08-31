---
title: 401 Unauthorized
created_at: 2023-08-29
updated_at: 2023-08-31
description: Learn what the HTTP 401 Unauthorized status code means, how it differs from 403 Forbidden, and how to deal with it.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 401 status code means a server requires authentication for the request.

HTTP has multiple <a href="https://www.iana.org/assignments/http-authschemes/http-authschemes.xhtml" target="_blank" rel="noopener">authentication schemes</a>, with <a href="https://datatracker.ietf.org/doc/html/rfc7617" target="_blank" rel="noopener">Basic</a> being the most common one.

    GET /supersecret HTTP/2

If the server wants you to authenticate, it will send the `WWW-Authenticate` header with the desired authentication method:

    HTTP/2 401 Unauthorized
    WWW-Authenticate: Basic realm="You Shall Not Pass"

Clients can authenticate by sending the `Authorization` header with credentials and a type of scheme they use:

    Authorization: Basic UGuz3XfqNdXC4VTng6VzYW1e

## 401 vs 403

[`403 Forbidden`](403-forbidden.html) is more appropriate when you don't have access to a particular resource or action, while `401 Unauthorized` is for cases when you're either not authenticated or authenticated incorrectly.

To portray this as a private party analogy:

* 401 - Anyone who knows the _secret word_ can get in. If you don't know what that word is, you're out. You can try as many times as you want.
* [403](403-forbidden.html) - Your name is not on the list, and you won't be able to get in. Don't even try.
* [404](404-not-found.html) - Some private parties don't want outsiders to know the party exists. Maybe something is going on there, but you won't be able to tell from _the outside_.

Perhaps the better name for these status codes would have been `401 Unauthenticated` and `403 Unauthorized`.
