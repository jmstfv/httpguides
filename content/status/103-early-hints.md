---
title: 103 Early Hints
created_at: 2023-08-29
updated_at: 2025-02-12
description: Learn what the HTTP 103 Early Hints status code means, how servers can use it to speed up web browsing, and where the Link header fits into the picture.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 103 status code means a server is sending HTTP headers that are likely to be included in the final response.

The most practical example of this is the server sending `Link` HTTP headers. Servers can inform clients in advance that they will likely need certain resources, allowing clients to start downloading them immediately and thus improving page load times.

     HTTP/2 103 Early Hints
     Link: </tailbreeze.css>; rel=preload; as=style
     Link: </voodoo.js>; rel=preload; as=script

Servers can send <a href="https://datatracker.ietf.org/doc/html/rfc8297#section-2" target="_blank" rel="noopener">one or more `103 Early Hints` responses</a>:

     HTTP/2 103 Early Hints
     Link: </tailbreeze.js>; rel=preload; as=script

`Link` headers only serve as hints: the server might or might not include those headers in a final response.

     HTTP/2 200 OK
     Content-Length: 4242
     Link: </voodoo.js>; rel=preload; as=script
     Link: </tailbreeze.css>; rel=preload; as=style
     Link: </tailbreeze.js>; rel=preload; as=script
     Link: </tailstorm.js>; rel=preload; as=script

`Link` HTTP header serves the same purpose as the `<link>` <abbr title="Hypertext Markup Language">HTML</abbr> tag - informing clients to pre-emptively fetch resources. HTTP headers can be used in contexts where HTML can't, such as stylesheets, scripts, and web fonts. Despite that, the `<link>` tag <a href="https://almanac.httparchive.org/en/2021/resource-hints#http-header" target="_blank" rel="noopener">is used more often</a>.

    <link rel="preload" href="https://example.com/voodoo.js" as="script">

## Support

`103 Early Hints` is an <a href="https://datatracker.ietf.org/doc/rfc8297/" target="_blank" rel="noopener">experimental status code</a>, so the support among <a href="https://bugs.chromium.org/p/chromium/issues/detail?id=671310" target="_blank" rel="noopener">browsers</a>, HTTP libraries, and web servers is very limited.

Chrome <a href="https://chromium.googlesource.com/chromium/src/+/master/docs/early-hints.md" target="_blank" rel="noopener">has started an experiment</a> to learn the effectiveness of Early Hints.
