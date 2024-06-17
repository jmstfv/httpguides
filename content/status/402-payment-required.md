---
title: 402 Payment Required
created_at: 2023-08-29
updated_at: 2024-06-17
description: Learn what the HTTP 402 Payment Required status code means and how it's used around the web.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 402 status code is reserved for future use.

_Reserved_ means developers should not use this status code until the spec is fleshed out. In practice, `402 Payment Required` is used to paywall or rate limit services:

* <a href="https://shopify.dev/docs/api/usage/response-codes" target="_blank" rel="noopener">Shopify</a> uses 402 when the store is frozen due to the client not having paid their outstanding balance.
* <a href="https://cloud.google.com/resource-manager/docs/core_errors#PAYMENT_REQUIRED" target="_blank" rel="noopener">Google Cloud</a> uses 402 when the account has reached its daily budget limit.
* <a href="https://github.com/ytdl-org/youtube-dl/blob/master/README.md#i-get-http-error-402-when-trying-to-download-a-video-whats-this" target="_blank" rel="noopener">YouTube</a> uses 402 to rate limit downloads (CAPTCHA).
* <a href="https://docs.stripe.com/api/errors" target="_blank" rel="noopener">Stripe</a> uses 402 when the request fails despite valid parameters (for example, incorrect credit card information).
* <a href="https://confluence.atlassian.com/bitbucketserverkb/git-push-returns-error-code-402-779171742.html" target="_blank" rel="noopener">Bitbucket</a> returns a 402 error when the server license has expired or when there are too many users for the license.
