---
title: 425 Too Early
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 425 Too Early status code means, when it happens, how widely browsers support it, and how it relates to WebDAV.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 425 status code means a server rejects the request because there's a possibility of a replay attack.

<abbr title="Transport Layer Security">TLS</abbr> 1.3 introduced a concept of a zero-round trip time (<abbr title="Zero Round Trip Time">0-RTT</abbr>, also known as TLS Early Data), where a client that _reconnects_ to a server can send data immediately without additional TLS handshakes (i.e., reducing Time To First Byte on TLS connections). While Early Data can speed up the connection by saving one or two round-trip delays, it introduces an avenue for a replay attack.

If the server perceives the possibility of a replay attack to be significant, it can respond with `425 Too Early` and expect clients to resend the request without Early Data.

## Browser support

Firefox added support for the `425 Too Early` in <a href="https://bugzilla.mozilla.org/show_bug.cgi?id=1406908" target="_blank" rel="noopener">version 58</a>. As of this writing, Firefox browsers earlier than version 58 account for <a href="https://caniuse.com/mdn-http_status_425" target="_blank" rel="noopener">less than 0.5% of global usage</a>.

## WebDAV Unordered Collection

In the draft version of <a href="https://datatracker.ietf.org/doc/html/draft-ietf-webdav-ordering-protocol-00#section-11.1" target="_blank" rel="noopener">RFC 3648</a>, the 425 status code was supposed to mean that the order in the <abbr title="Web Distributed Authoring and Versioning">WebDAV</abbr> collection has been violated. It's a non-standard status code that never gained wide adoption and is obsolete at this point.
