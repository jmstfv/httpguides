---
title: HTTP Status Codes Guides
description: A collection of articles explaining Hypertext Transfer Protocol (HTTP) response status codes. The knowledge combined here comes from RFCs, mailing lists, bug reports, code repositories, Q&A forums, and hard-won life experiences (as opposed to copying and pasting RFCs without any value add).
---

The knowledge combined here comes from RFCs, mailing lists, bug reports, code repositories, Q&A forums, and hard-won life experiences (as opposed to copying and pasting RFCs without any value add).

Guides are written from the developer/webmaster perspective.

See [About page](about.html) for more information.

## Informational (1xx)

These status codes indicate that the request was received while processing is still continuing.

* [HTTP 100 - Continue](/status/100-continue.html)
* [HTTP 101 - Switching Protocols](/status/101-switching-protocols.html)
* [HTTP 103 - Early Hints](/status/103-early-hints.html)

## Success (2xx)

These status codes indicate the request was successfully understood and accepted by the server.

* [HTTP 200 - OK](/status/200-ok.html)
* [HTTP 201 - Created](/status/201-created.html)
* [HTTP 202 - Accepted](/status/202-accepted.html)
* [HTTP 203 - Non-Authoritative Information](/status/203-non-authoritative-information.html)
* [HTTP 204 - No Content](/status/204-no-content.html)
* [HTTP 205 - Reset Content](/status/205-reset-content.html)
* [HTTP 206 - Partial Content](/status/206-partial-content.html)

## Redirection (3xx)

These status codes indicate the client should take an additional step to complete the request.

* [HTTP 300 - Multiple Choices](/status/300-multiple-choices.html)
* [HTTP 301 - Moved Permanently](/status/301-moved-permanently.html)
* [HTTP 302 - Found](/status/302-found.html)
* [HTTP 303 - See Other](/status/303-see-other.html)
* [HTTP 304 - Not Modified](/status/304-not-modified.html)
* [HTTP 307 - Temporary Redirect](/status/307-temporary-redirect.html)
* [HTTP 308 - Permanent Redirect](/status/308-permanent-redirect.html)

## Client errors (4xx)

These status codes are reserved for cases when the error is caused by the client.

* [HTTP 400 - Bad Request](/status/400-bad-request.html)
* [HTTP 401 - Unauthorized](/status/401-unauthorized.html)
* [HTTP 402 - Payment Required](/status/402-payment-required.html)
* [HTTP 403 - Forbidden](/status/403-forbidden.html)
* [HTTP 404 - Not Found](/status/404-not-found.html)
* [HTTP 405 - Method Not Allowed](/status/405-method-not-allowed.html)
* [HTTP 406 - Not Acceptable](/status/406-not-acceptable.html)
* [HTTP 407 - Proxy Authentication Required](/status/407-proxy-authentication-required.html)
* [HTTP 408 - Request Timeout](/status/408-request-timeout.html)
* [HTTP 409 - Conflict](/status/409-conflict.html)
* [HTTP 410 - Gone](/status/410-gone.html)
* [HTTP 411 - Length Required](/status/411-length-required.html)
* [HTTP 412 - Precondition Failed](/status/412-precondition-failed.html)
* [HTTP 413 - Request Entity Too Large](/status/413-request-entity-too-large.html)
* [HTTP 414 - Request URI Too Long](/status/414-request-uri-too-long.html)
* [HTTP 415 - Unsupported Media Type](/status/415-unsupported-media-type.html)
* [HTTP 416 - Range Not Satisfiable](/status/416-range-not-satisfiable.html)
* [HTTP 417 - Expectation Failed](/status/417-expectation-failed.html)
* [HTTP 418 - I'm a Teapot](/status/418-im-a-teapot.html)
* [HTTP 421 - Misdirected Request](/status/421-misdirected-request.html)
* [HTTP 422 - Unprocessable Entity](/status/422-unprocessable-entity.html)
* [HTTP 425 - Too Early](/status/425-too-early.html)
* [HTTP 426 - Upgrade Required](/status/426-upgrade-required.html)
* [HTTP 428 - Precondition Required](/status/428-precondition-required.html)
* [HTTP 429 - Too Many Requests](/status/429-too-many-requests.html)
* [HTTP 431 - Request Header Fields Too Large](/status/431-request-header-fields-too-large.html)
* [HTTP 451 - Unavailable For Legal Reasons](/status/451-unavailable-for-legal-reasons.html)

## Server errors (5xx)

These status codes are reserved for cases when the problem originates from the server.

* [HTTP 500 - Internal Server Error](/status/500-internal-server-error.html)
* [HTTP 501 - Not Implemented](/status/501-not-implemented.html)
* [HTTP 502 - Bad Gateway](/status/502-bad-gateway.html)
* [HTTP 503 - Service Unavailable](/status/503-service-unavailable.html)
* [HTTP 504 - Gateway Timeout](/status/504-gateway-timeout.html)
* [HTTP 505 - HTTP Version Not Supported](/status/505-http-version-not-supported.html)
