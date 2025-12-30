## REST API - JSON

### HTTP Methods
*In this project*
| Method | Endpoint          | Description                              | Status |
|--------|-------------------|------------------------------------------|--------|
| GET    | `/`               | Home page                                | 200    |
| GET    | `/`               | headers part done                        | 200    |
| GET    | `/about`          | About page                               | 200    |
| GET    | `/users`          | Renders HTML page                        |   -    |
| GET    | `/api/users`      | Returns list of all users in JSON format |   -    |
| GET    | `/api/users/:id`  | Get user with specific ID                |   -    |
| POST   | `/api/users`      | Create a new user                        |   -    |
| PUT    | `/api/users/:id`  | Update user with specific ID             |   -    |
| PATCH  | `/api/users/:id`  | Update user with specific ID             |   -    |
| DELETE | `/api/users/:id`  | Delete user with specific ID             |   -    |

### Dynamic Path Parameters

To get data for a specific user, use a colon before the parameter:

```
GET /api/users/:id
```

- `:id` = variable name (changes based on input)
- **Example:** `GET /api/users/1` retrieves user with ID 1

### Response Format

- **Route:** `/api/users` → Returns **JSON** data
- **Route:** `/users` → Returns **HTML** page

---

## Middleware

Middleware functions execute during the **request-response cycle** and have access to:

- `req` - Request object
- `res` - Response object  
- `next()` - Function to call the next middleware

### Middleware Capabilities

Middleware can:
- Execute custom code
- Modify request and response objects
- End the request-response cycle
- Call the next middleware in the chain

### Implementation

Use the `app.use()` method to add middleware:

```javascript
app.use(middlewareFunction);
```

## Headers

HTTP headers contain metadata about API requests and responses. They provide information about the request and response body.

To set a custom header, use:

```javascript
res.setHeader('key', 'value');
```

**Note:** Set headers before sending the response.

## Status Codes

Status codes tell you the result of your API request:

- **1xx (100-199):** Request received, still working
- **2xx (200-299):** Success! Request worked
- **3xx (300-399):** Resource moved elsewhere
- **4xx (400-499):** Client made a mistake
- **5xx (500-599):** Server had a problem

**Common codes:**

- `200` - OK (success)
- `201` - Created (new resource made)
- `204` - No Content (success, no data back)
- `400` - Bad Request (wrong data sent)
- `401` - Unauthorized (need login)
- `403` - Forbidden (no permission)
- `404` - Not Found (resource doesn't exist)
- `500` - Internal Server Error (server problem)


# MongoDB

MongoDB is a popular **NoSQL database**. This means it doesn't use the traditional table-based structure of relational databases (like MySQL). Instead, it stores data in flexible, JSON-like documents.

## Key Features

*   **Document-Based**: Data is stored in collections of documents, which are similar to JSON objects. This makes it very flexible and easy to work with for many applications.

*   **Aggregation Pipeline**: It has a powerful feature for processing data through a series of stages. This is great for performing complex data analysis and transformations.

*   **BSON Format**: Internally, MongoDB uses BSON (Binary JSON), which is a binary-encoded version of JSON. This format is efficient for data storage and speed.

*   **Great for Node.js**: It is a very common and effective choice for the database when building applications with Node.js.

## Common Shell Commands

Here are some basic commands you can use in the MongoDB shell:

*   `show dbs`
    *   Lists all the databases on your server.

*   `use <database_name>`
    *   Switches to a specific database. If it doesn't exist, MongoDB will create it when you first insert data.

*   `show collections`
    *   Shows all the collections (similar to tables) in the currently selected database.

*   `db.<collection_name>.find()`
    *   Finds and displays all the documents within a specific collection. 


how mongoose works 

first we define schema 
schema - define structure
schema - model
using model we do crud operation