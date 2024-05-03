---
title: 422 Unprocessable Entity
created_at: 2023-08-29
updated_at: 2024-05-03
description: Learn what the HTTP 422 Unprocessable Entity status code means, how it differs from 400 Bad Request, and how to deal with it in Ruby on Rails.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 422 status code means the server understands the response body but couldn't process the request because there's something wrong with the content.

While the request body (payload) can be technically correct, it can fail in different ways:

* data that threatens the integrity of the entire dataset
* incorrectly formatted data
* non-existing fields
* incorrect `Content-Type`

## 422 vs 400

If the client sends you a malformed or invalid JSON, you should return the [`400 Bad Request`](400-bad-request.html). If the JSON itself is valid, but some fields aren't, you should respond with `422 Unprocessable Entity`.

Likewise, if the data client sends is valid but doesn't pass server-specific validations, you should probably respond with 422.

For example, if you're building <a href="https://shopify.dev/docs/api/usage/response-codes" target="_blank" rel="noopener">an API for an e-commerce platform</a>, 422 would be appropriate when the client:

* creates a product without a name
* incorrectly formats the data
* checks out products that are out-of-stock

## Ruby on Rails

Rails responds with `422 Unprocessable Entity` when the client fails to pass a <abbr title="Cross-site Request Forgery">CSRF</abbr> check. There are two ways around this problem:

* Send CSRF tokens on all non-GET requests

Starting from version 5.2, <a href="https://github.com/rails/rails/pull/29742" target="_blank" rel="noopener">Rails automatically enables CSRF checks</a> in all views/controllers. If you're sending AJAX requests, you must explicitly include the `X-CSRF-Token` header:

    'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content

* Disable CSRF checks (**not recommended**)

You can disable the CSRF check for a particular controller by including the `skip_before_action` action.

    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token
    end

Note that this opens your app to a CSRF attack. You should only do this if you trust the input (for example, webhooks from a third-party API).
