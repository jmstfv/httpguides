---
title: 409 Conflict
created_at: 2023-08-29
updated_at: 2023-09-01
description: Learn what the HTTP 409 Conflict status code means, how it differs from 412 Precondition Failed and 422 Unprocessable Entity, and when it happens.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 409 status code means a request conflicts with the current status of the server.

This status code is useful when you want to ensure the integrity of your data.

## 409 vs 412

Both 409 and [412](412-precondition-failed.html) status codes imply that the request can't be processed due to a conflict. The only difference is that [412](412-precondition-failed.html) is appropriate when you have preconditions (`If-*` headers) that can't be fulfilled.

## 409 vs 422

Both of these status codes are valid if you want to verify the integrity of the data before saving it to a database.

Consider a typical example where a user wants to create an account. If you want to create a user with an existing email address or tie it to a delinquent account, the server can respond with a `409 Conflict` status code. Likewise, if you want to prevent account deletions that have active users tied to it, 409 is a way to go. If a `User` model doesn't contain the `username` field, but you still include it in the request body, then a [`422 Unprocessable Entity`](422-unprocessable-entity.html) would be more appropriate.

`409 Conflict` is also used when a current request might interfere with one of the previous requests. For example, to ensure that unsafe requests are idempotent, <a href="https://stripe.com/docs/api/idempotent_requests" target="_blank" rel="noopener">Stripe returns 409</a> on requests that contain the same idempotency key as one of the previous requests.

Rule of thumb:

* if the conflict is related to the existing (current) resource, prefer `409 Conflict`
* if the request body (payload) is valid but semantically incorrect, stick to [`422 Unprocessable Entity`](422-unprocessable-entity.html)
* if the request body (payload) is invalid, use [`400 Bad Request`](400-bad-request.html)

In practice, both 409 and 422 are used interchangeably. It's fine to use either as long as you're consistent.
