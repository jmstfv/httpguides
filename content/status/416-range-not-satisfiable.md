---
title: 416 Range Not Satisfiable
created_at: 2023-08-29
updated_at: 2023-09-01
description: Learn what the HTTP 416 Range Not Satisfiable status code means, when it happens, and how it relates to 216 Partial Content.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 416 status code means a range request is invalid.

For example, when streaming a video, you might want to receive it in chunks (to save bandwidth if you only need a small fraction of the file). You can request a portion of the file by including the `Range` HTTP header:

    Range: bytes=1337-1842

The above header asks the server to send the slice of the data starting from the 1337th byte up to the 1842nd byte.

If the file doesn't have the requested range (for example, requesting the 100-200 kilobyte range from a 50-kilobyte file), the server will return the `416 Range Not Satisfiable` status code.

If the `Range` header is syntactically invalid, the server will most likely ignore it and return [`200 OK`](200-ok.html).

If a `Range` header is valid, but you still get this error, clear your cache and delete your cookies, and try again.

## Try it yourself

Try requesting a range that exceeds the `Content-Length` of a page:

    curl -H 'Range: bytes=4242-5151' https://example.com

## See also

* [206 Partial Content](206-partial-content.html) status code is returned when the range request succeeds, and the server sends you a chunk of the data.
