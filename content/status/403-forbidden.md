---
title: 403 Forbidden
created_at: 2023-08-29
updated_at: 2023-08-29
description: Learn what the HTTP 403 Forbidden status code means and how it differs from 401 Unauthorized.
---

The <abbr title="Hypertext Transfer Protocol">HTTP</abbr> 403 status code means a client doesn't have access to a requested resource or action.

For example, if you have been assigned a read-only "Visitor" role in the web app, trying to change a password would trigger the [`403 Forbidden`](403-forbidden.html) response from the server.

The [difference from `401 Unauthorized`](401-unauthorized.html#vs-403) is that re-authenticating won't make any difference in this case. Perhaps the better name for these status codes would have been the `401 Unauthenticated` and `403 Unauthorized`.

## File permissions

Quite often, web servers like Nginx and Apache will return `403 Forbidden` when trying to access files and directories (folders) with insufficient permissions. On Unix-based systems, the default permissions for files are 644 (`drwxr-xr-x`) and 755 for directories (`-rw-r--r--`).

You can try recursively setting permissions to the default values (replace `full/path/to/dir` with a full path that contains files you want to serve):

    find /full/path/to/dir -type d -exec chmod 755 {} \;
    find /full/path/to/dir -type f -exec chmod 644 {} \;

To check permissions for a particular file or directory in Linux:

    stat -c '%a %n' meme.jpg
