---
title: 408 Request Timeout
created_at: 2023-08-29
updated_at: 2023-08-31
description: Learn what the HTTP 408 Request Timeout status code means and how it relates to the speculative optimization used by modern browsers.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 408 status code means a server has decided to close the connection after waiting too long to receive the data from the client.

Once a server establishes a <abbr title="Transmission Control Protocol">TCP</abbr> connection, it waits for the client to send the data. If the client hasn't sent the data within the allotted time window (timeout), the server closes the connection by sending a `Connection` header with a `close` value.

    Connection: close

## Preconnects

Modern browsers use <a href="https://www.igvita.com/posa/high-performance-networking-in-google-chrome/#predictor" target="_blank" rel="noopener">speculative optimization techniques</a> to speed up browsing. For instance, hovering over a link or typing a URL into a browser bar is a good proxy that the user will want to visit those pages next, so browsers can preemptively kick off a <abbr title="Domain Name System">DNS</abbr> lookup or TCP handshake.

The problem is that a lot of TCP connections opened by the browser <a href="https://bugs.chromium.org/p/chromium/issues/detail?id=85229" target="_blank" rel="noopener">remain idle</a>. Since most of those connections can go unused (and time out in the meantime), <a href="https://bugs.chromium.org/p/chromium/issues/detail?id=377581" target="_blank" rel="noopener">some users can get the `408 Request Timeout` status code</a> by the time they open the page.
