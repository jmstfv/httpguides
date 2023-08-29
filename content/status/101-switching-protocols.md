---
title: 101 Switching Protocols
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 101 Switching Protocols status code means and how it relates to WebSocket protocol upgrades.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 101 status code means a server is switching to a different protocol requested by a client.

## Protocol upgrades

The protocol upgrade mechanism is commonly used to establish WebSocket connections. After the WebSocket connection is established, the server can use both HTTP and WebSocket protocols to communicate with the client (WebSocket protocol is designed to share the same ports as HTTP).

You can initiate protocol changes by sending the `Upgrade` and `Connection` headers:

    GET /socket HTTP/1.1
    Host: chat.example.com
    Origin: https://example.com
    Upgrade: websocket
    Connection: Upgrade
    Sec-WebSocket-Key: t5JpHMbiL1wzlkV1GBhzqw==
    Sec-WebSocket-Extensions: permessage-deflate
    Sec-WebSocket-Protocol: wamp
    Sec-WebSocket-Version: 13

If the server supports and is willing to talk using a new protocol, it will send back the `101 Switching Protocols` status code with the `Upgrade` header. If the server doesn't want or can't upgrade the connection, it will respond with the [`200 OK`](200-ok.html) status code.

    HTTP/1.1 101 Switching Protocols
    Upgrade: websocket
    Connection: Upgrade
    Sec-Websocket-Accept: hz2kBDN0IrJPZHpoMoci6V9RzEE=
    Sec-Websocket-Extensions: permessage-deflate

Once the WebSocket handshake has completed successfully, the client and server can start transferring data.

Note that you can't upgrade HTTP/2 connections to different protocols because <a href="https://datatracker.ietf.org/doc/html/rfc7540#section-8.1.2.2" target="_blank" rel="noopener">HTTP/2 doesn't use connection-specific headers</a>. That's a design decision since, in HTTP/2, the <q cite="https://datatracker.ietf.org/doc/html/rfc7540#section-8.1.2.2">connection-specific metadata is conveyed by other means</q>.

## Trivia

You might notice that the terms `101 Web Socket Protocol Handshake` and `101 Switching Protocols` are used interchangeably. They both mean the same thing.

## See also

* [426 Upgrade Required](426-upgrade-required.html) - when the server wants to force the client to upgrade a protocol.
