---
title: "Unit 2: The Web and HTTP"
id: unit2-topic2
tags: [unit2, application-layer, http, https, web, cookies, caching]
aliases: [HTTP, World Wide Web, HTTPS]
---

# Unit 2, Topic 2: The Web and HTTP

Now that we understand the core principles of network applications, let's examine the most well-known application of all: the World Wide Web and its protocol, HTTP.

> [!note] Definition: The **World Wide Web** consists of documents and other web resources which are identified by URLs. **HTTP (HyperText Transfer Protocol)** is the application-layer protocol that enables communication between web browsers and web servers to exchange these resources.

HTTP is the heart of the web. It follows a **client-server model** and uses **TCP** as its transport protocol because reliability is crucial for web pages to load correctly. A critical concept is that HTTP is **stateless**—the server maintains no information about past client requests.

---

## 1. Non-Persistent vs. Persistent Connections

How HTTP uses TCP connections has evolved over time.

- **Non-Persistent HTTP (HTTP/1.0):** A new TCP connection is opened for *every single object* on a webpage (the HTML file, each image, etc.). This is very slow due to the high overhead of repeated TCP handshakes.
- **Persistent HTTP (HTTP/1.1):** The browser opens a single TCP connection and reuses it to request multiple objects. This dramatically reduces latency.

---

## 2. HTTP Message Format

HTTP communication consists of two types of messages: **requests** and **responses**.

### a. HTTP Request Message
This is an ASCII, human-readable message sent by the client.

```
GET /path/to/file/index.html HTTP/1.1
Host: www.example.com
User-Agent: Mozilla/5.0
...
```
- **Request Line:** Contains the Method, the URL, and the HTTP version.
- **Header Lines:** Provide additional information to the server.
- **Entity Body:** Contains data being sent to the server (e.g., from a form). It is empty for GET requests.

#### Common HTTP Methods
| Method | Purpose |
|---|---|
| **GET** | Requests a representation of the specified resource. This is the most common method. |
| **POST** | Submits data to be processed to the specified resource (e.g., submitting a form or uploading a file). |
| **HEAD** | Identical to GET, but the server does not send the message body in the response. Useful for checking if a resource exists and getting its metadata. |
| **PUT** | Uploads a representation of the specified resource. Can be used to create or overwrite a file on the server. |
| **DELETE**| Deletes the specified resource. |

### b. HTTP Response Message
This is the message sent back by the server.
```
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1234
...

<html>...</html>
```
- **Status Line:** Contains the version, a **status code**, and a status message. (e.g., `200 OK`, `404 Not Found`).
- **Header Lines:** Provide information about the response.
- **Entity Body:** The actual content of the requested object.

---

## 3. Cookies: Adding State to a Stateless Protocol

Since HTTP is stateless, **cookies** are used to allow servers to maintain session information.
1.  The server includes a `Set-Cookie:` header in its response with a unique ID.
2.  The browser stores this cookie.
3.  The browser includes this cookie in the `Cookie:` header of all future requests to that same server.
4.  The server uses the ID to retrieve session information (e.g., shopping cart items, login status).

---

## 4. Web Caching (Proxy Servers)

A **web cache** is a server that satisfies HTTP requests on behalf of an origin server. It stores copies of recently requested objects.
- **Benefits:** Reduces response time for clients and reduces traffic on an institution's access link.
- **Conditional GET:** Caches use the `If-Modified-Since` request header to ask the server if the cached object is still valid. If it is, the server sends back a small `304 Not Modified` response, saving bandwidth.

---

## 5. A Note on HTTPS: Secure HTTP

You will notice that most websites today use `https://` instead of `http://`.
- **What it is:** HTTPS is not a separate protocol. It is standard **HTTP layered on top of TLS (Transport Layer Security)**. TLS is a security protocol that runs on top of TCP.
- **Purpose:** TLS provides the two key security services that HTTP lacks:
    1.  **Confidentiality:** It encrypts all HTTP message content, protecting it from eavesdroppers (packet sniffers).
    2.  **Integrity & Authentication:** It ensures that the client is talking to the real, authentic server (preventing MitM attacks) and that the messages have not been altered in transit.

---

## Exam Focus
- **2-Mark Questions:**
    - Is HTTP a stateful or stateless protocol? (Stateless).
    - What is the purpose of cookies? (To add state to HTTP).
    - What is the difference between HTTP and HTTPS? (HTTPS is HTTP over an encrypted TLS session).
- **10-Mark Question:**
    - "Explain the format of HTTP request and response messages, including common methods and status codes. Then, describe how the stateless nature of HTTP is overcome using cookies."
        - **Tip:** Show the structure of both message types. Include a small list of methods (GET/POST). Then detail the 4-step cookie process: 1) Server sends Set-Cookie, 2) Browser stores it, 3) Browser sends it back in future requests, 4) Server uses it to identify the session.
