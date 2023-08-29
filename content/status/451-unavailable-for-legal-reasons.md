---
title: 451 Unavailable For Legal Reasons
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 451 Unavailable For Legal Reasons status code means and when it is used.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 451 status code means a client can't access a resource due to legal reasons.

Some countries routinely send takedown requests <a href="https://transparency.automattic.com/wordpress-dot-com/country-block-list/" target="_blank" rel="noopener">to major websites</a>. In such cases, `451 Unavailable For Legal Reasons` is the appropriate the status code to return.

When the <abbr title="General Data Protection Regulation">GDPR</abbr> legislation went into effect, many news websites decided to limit access to their content to European IP addresses by returning the 451 status code.

The server usually includes the `Link` HTTP header indicating who ordered the blockage of the resource:

    HTTP/2 451 Unavailable For Legal Reasons
    Link: <https://spqr.example.com/senate>; rel="blocked-by"

## Trivia

Number 451 is a reference to Ray Bradbury's novel <a href="https://en.wikipedia.org/wiki/Fahrenheit_451" target="_blank" rel="noopener">Fahrenheit 451</a>. In the futuristic, dystopian-esque society, books are outlawed and burned by the _firemen_. 451 °F is a temperature at which book paper combusts.
