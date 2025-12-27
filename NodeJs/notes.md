# URL - Uniform Resource Locator

## Example
```
https://www.youtube.com/watch?v=Nt-AsZh5woE&list=PLinedj3B30sDby4Al-i13hQJGQoRQDfPo&index=8
```

## URL Components

- **Protocol:** This is how data is communicated over the internet. Examples include `https` for secure connections, `http` for standard connections, and `ws` for real-time connections.
  
- **Domain:** This is the address of the website, like `www.youtube.com`.
  
- **Path:** This shows where to find something on the website, such as `/watch` or `/folder/subfolder/page`.
  
- **Query Parameters:** These are extra pieces of information added after a `?` in the URL, like `v=Nt-AsZh5woE&list=...&index=8`.

## HTTP Methods

- **GET:** Retrieve data from the server (used when you click a link).
- **POST:** Send or create data on the server.
- **PUT:** Replace existing data on the server.
- **PATCH:** Update part of the data on the server.
- **DELETE:** Remove data from the server.

## Basic Routing

**Definition:** Routing determines how an application responds to client requests to specific endpoints (URI/path) using HTTP methods (GET, POST, etc.).

**Structure:**
```javascript
app.METHOD(PATH, HANDLER)
```

**Parameters:**
- `app` - Express application instance
- `METHOD` - HTTP method (lowercase)
- `PATH` - Server endpoint path
- `HANDLER` - Function that runs when the route matches

**Note:** Each route can have one or more handler functions.

## Package Versioning

**Format:** `^5.2.1`

- **First digit (5):** Major version (breaking changes)
- **Second digit (2):** Minor version (new features)
- **Third digit (1):** Patch version (bug fixes)

**Caret (^) Symbol:** The `^` symbol allows npm to automatically update to newer versions, but only within the same major version. For example, `^5.2.1` will update to any version from `5.0.0` to `5.999.999`, but will never update to version `6.0.0` or higher. This protects your code from breaking changes that come with major version updates.

## RESTful API

**Definition:** An API (Application Programming Interface) that uses standard HTTP methods and URLs to perform operations on resources in a predictable way.

**Key Principles:**
- **Client-Server Architecture:** Client and server communicate over HTTP and are independent of each other.
- **Standard Format:** Data is exchanged using JSON or HTML format.
- **HTTP Methods:** Always use the correct HTTP method for each operation (GET, POST, PUT, PATCH, DELETE).
- **Stateless:** Each request contains all information needed; the server doesn't store client context.

**Rendering Options:**
- **SSR (Server-Side Rendering):** Server generates HTML before sending to client.
- **CSR (Client-Side Rendering):** Browser generates HTML using JavaScript.


