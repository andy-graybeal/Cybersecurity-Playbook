# HTTP Response Codes (CCST Notes)

Here's a simplified table of common HTTP response codes useful for CCST
exam prep:

  ------------------------------------------------------------------------
  **Code**    **Category**     **Meaning**      **Example Use Case**
  ----------- ---------------- ---------------- --------------------------
  **100**     Informational    Continue         The client should continue
                                                with its request.

  **200**     Success          OK               Request succeeded, and the
                                                server returned the
                                                expected data.

  **201**     Success          Created          A new resource was created
                                                (e.g., after POST).

  **301**     Redirection      Moved            Resource has a new URL;
                               Permanently      clients should update
                                                links.

  **302**     Redirection      Found (Temporary Resource temporarily
                               Redirect)        available at a different
                                                URL.

  **304**     Redirection      Not Modified     Cached version is still
                                                valid; no need to resend
                                                data.

  **400**     Client Error     Bad Request      The request was malformed
                                                or invalid.

  **401**     Client Error     Unauthorized     Authentication required
                                                (e.g., login needed).

  **403**     Client Error     Forbidden        Client is authenticated
                                                but not allowed to access
                                                resource.

  **404**     Client Error     Not Found        The server can't find the
                                                requested resource.

  **408**     Client Error     Request Timeout  Server timed out waiting
                                                for client request.

  **429**     Client Error     Too Many         The client is sending too
                               Requests         many requests in a short
                                                time.

  **500**     Server Error     Internal Server  Generic error when server
                               Error            can't process request.

  **502**     Server Error     Bad Gateway      Server received an invalid
                                                response from an upstream
                                                server.

  **503**     Server Error     Service          Server is overloaded or
                               Unavailable      down for maintenance.

  **504**     Server Error     Gateway Timeout  Server didn't get a
                                                response from another
                                                server in time.
  ------------------------------------------------------------------------

------------------------------------------------------------------------

## CCST Quick Notes

-   ✅ **200 (OK)** -- success\
-   🔄 **301/302 (Redirects)** -- resource moved\
-   ❌ **400 (Bad Request)**, **401 (Unauthorized)**, **403
    (Forbidden)**, **404 (Not Found)**\
-   ⚠️ **500 (Server Error)**, **503 (Service Unavailable)**

------------------------------------------------------------------------

## Memory Trick

Think of it in categories:

-   **200s = Success**\
-   **300s = Redirects**\
-   **400s = Client messed up**\
-   **500s = Server messed up**
