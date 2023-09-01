---
title: 426 Upgrade Required
created_at: 2023-08-29
updated_at: 2023-09-01
description: Learn what the HTTP 426 Upgrade Required status code means and how it relates to WebSocket connections.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 426 status code means a server doesn't want to accept the current protocol and wants the client to switch to a different protocol (for example, HTTP/1.1 to WebSocket) or a newer version of the same protocol (for example, HTTP/2 to HTTP/3).

The server responds with the `Upgrade` header indicating the protocol they are willing to accept:

    HTTP/1.1 426 Upgrade Required
    Connection: Upgrade
    Upgrade: WebSocket

## WebSocket

A server is supposed to return `426 Upgrade Required` when the WebSocket <a href="https://datatracker.ietf.org/doc/html/rfc6455#section-4.2.2" target="_blank" rel="noopener">handshake fails due to an incorrect protocol version</a>
 (as presented in the `Sec-WebSocket-Version` HTTP header).

Typically, a WebSocket server will respond with the supported version(s) of the protocol:

    Sec-WebSocket-Version: 13, 8, 7

## See also

* [101 Switching Protocols](101-switching-protocols.html) - when a server accepts protocol upgrade requested by a client.
