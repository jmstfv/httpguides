---
title: 300 Multiple Choices
created_at: 2023-08-29
updated_at: 2023-08-30
description: Learn what the HTTP 300 Multiple Choices status code means and when servers might return it.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 300 status code means a server can redirect the client to more than one location based on the client's choice.

This status code is rarely used, and the behavior among browsers is inconsistent. For example, upon encountering the `300 Multiple Choices` status code, Webkit-based browsers will redirect you straight to the URL found in the `Location` header.

If you want a user to choose between redirects, the most _bulletproof_ way would be to present them with a list of links (in <abbr title="Hypertext Markup Language">HTML</abbr>) to choose from. That would be <a href="https://datatracker.ietf.org/doc/html/rfc7231#section-6.4.1" target="_blank" rel="noopener">in line with RFC</a> as well:

<blockquote cite="https://datatracker.ietf.org/doc/html/rfc7231#section-6.4.1">[...] the server SHOULD generate a payload in the 300 response containing a list of representation metadata and URI reference(s) from which the user or user agent can choose the one most preferred. [...] A specific format for automatic selection is not defined by this specification because HTTP tries to remain orthogonal to the definition of its payloads.</blockquote>
