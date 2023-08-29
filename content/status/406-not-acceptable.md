---
title: 406 Not Acceptable
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 406 Not Acceptable status code means and how it relates to content negotiation.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 406 status code means a server can't return the requested version of the resource.

Clients can ask servers to serve a particular version of the resource (for example, <abbr title="Hypertext Markup Language">HTML</abbr> document, image file, <abbr title="JavaScript Object Notation">JSON</abbr> object).

For example, imagine a user has a Spanish locale set as a default (`es-ES`). A browser can (and will) ask a server to provide a Spanish version of the website, if possible, but otherwise fall back to an English version.

    Accept-Language: es-ES, es;q=1, en;q=0.5

This process is called _content negotiation_. Apart from a language, clients can negotiate:

* Content types (<abbr title="Multipurpose Internet Mail Extensions">MIME</abbr>) via the `Accept` header. An image file can be encoded as a JPEG or WebP, an API response can be returned as a JSON or XML.
* Encodings (think compression algorithms) via the `Accept-Encoding` header. The most common ones are <a href="https://almanac.httparchive.org/en/2021/compression#server-settings-for-http-compression" target="_blank" rel="noopener">gzip and brotli</a>.
* Charsets via the `Accept-Charset` header. Since UTF-8 support is ubiquitous, there's little need to the point where  <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Charset" target="_blank" rel="noopener">most modern browsers don't support it</a>. Browsers omit this header <a href="https://www.eff.org/deeplinks/2010/01/primer-information-theory-and-privacy" target="_blank" rel="noopener">to reduce entropy and preserve users' privacy</a>.
* <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Client_hints" target="_blank" rel="noopener">Client hints</a> via the `Accept-CH` header. Client hints is a content negotiation mechanism where clients can proactively inform browsers about supported features. This is an <a href="https://caniuse.com/mdn-http_headers_accept-ch_dpr" target="_blank" rel="noopener">experimental header</a>.

HTTP spec states that browsers can respond with `406 Not Acceptable` when <q>the server is unwilling to supply a default representation</q>. However, in reality, most servers do fall back to the default representation.
