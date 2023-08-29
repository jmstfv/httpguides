---
title: 417 Expectation Failed
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 417 Expectation Failed status code means and how it relates to the Expect HTTP header.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 417 status code means a server couldn't understand or doesn't support the `Expect` header.

Before making a request, clients may ask permission from the server to proceed with the request. It's useful when clients are about to send a large body and do not waste bandwidth in case the server declines their request. This process is facilitated with the help of the `Expect` header. This header <a href="https://datatracker.ietf.org/doc/html/rfc7231#section-5.1.1" target="_blank" rel="noopener">can only have a single value</a>, which is `100-Continue`.

[Some HTTP clients/libraries](100-continue.html#curl) append the `Expect` header to every request. If you keep getting the `417 Expectation Failed` error, try unsetting this header before retrying the request. If you can't remove this header, you can pass the empty value instead:

    Expect:

## Try it yourself

Send the `Expect` HTTP header with a non-empty value other than `100-Continue`:

    curl -H 'Expect: LOL' -X POST https://example.com

## See also

* [100 Continue](100-continue.html) - status code servers use when they understood the `Expect` header and are ready to proceed with the request.
