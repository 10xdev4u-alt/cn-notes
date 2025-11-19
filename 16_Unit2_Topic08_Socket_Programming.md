---
title: "Unit 2: Socket Programming: Creating Network Applications"
id: unit2-topic8
tags: [unit2, application-layer, socket-programming, tcp, udp, python]
aliases: [Socket Programming]
---

# Unit 2, Topic 8: Socket Programming

We have studied the principles of application-layer protocols, but how are they implemented? The answer lies in **socket programming**.

> [!note] Definition: A **socket** is a software interface—an Application Programming Interface (API)—that provides a "doorway" for an application process to send and receive messages to/from the network.

When creating a socket, the developer must choose a transport protocol, which determines the type of socket created.

---

## 1. Socket Programming with TCP

TCP is **connection-oriented**. A connection must be established before data can be sent.

### TCP Server Lifecycle
1.  **`socket()`**: Create a "listening socket".
2.  **`bind()`**: Assign a port number to the socket.
3.  **`listen()`**: Tell the socket to listen for incoming connection requests.
4.  **`accept()`**: Wait for a client to connect. When one does, create a **new, dedicated connection socket** for that client.
5.  **`recv()` / `send()`**: Communicate with the client using this new socket.
6.  **`close()`**: Close the connection socket.

### TCP Client Lifecycle
1.  **`socket()`**: Create a client socket.
2.  **`connect()`**: Initiate a TCP connection to the server.
3.  **`send()` / `recv()`**: Exchange data.
4.  **`close()`**: Close the connection.

---

## 2. Socket Programming with UDP

UDP is **connectionless**. There is no handshake and no dedicated connection.

### UDP Server Lifecycle
1.  **`socket()`**: Create a UDP socket.
2.  **`bind()`**: Assign a port number to it.
3.  **`recvfrom()`**: Wait for a datagram to arrive. This call also provides the client's address.
4.  **`sendto()`**: Send a reply back to the client's address.

### UDP Client Lifecycle
1.  **`socket()`**: Create a UDP socket.
2.  **`sendto()`**: Create a datagram, attaching the server's IP and port, and send it.
3.  **`recvfrom()`**: Optionally wait for a reply.

---

## 3. High-Level Python Examples

### a. TCP Server Example
This snippet illustrates the TCP server lifecycle, creating a new socket for each client.
```python
import socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(('', 12000))
server_socket.listen(1)
print("The TCP server is ready to receive")
while True:
    connection_socket, addr = server_socket.accept() # New socket created
    message = connection_socket.recv(1024).decode()
    connection_socket.send(message.upper().encode())
    connection_socket.close()
```

### b. UDP Server & Client Example
These snippets illustrate the connectionless nature of UDP. Note how the server uses a single socket and how addresses are specified in each `sendto` call.

**UDPServer.py**
```python
import socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server_socket.bind(('', 12000))
print("The UDP server is ready to receive")
while True:
    message, client_address = server_socket.recvfrom(2048)
    modified_message = message.decode().upper()
    server_socket.sendto(modified_message.encode(), client_address)
```

**UDPClient.py**
```python
import socket
server_name = 'hostname'
server_port = 12000
client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
message = input('Input lowercase sentence:')
client_socket.sendto(message.encode(), (server_name, server_port)) # Attach destination addr
modified_message, server_address = client_socket.recvfrom(2048)
print(modified_message.decode())
client_socket.close()
```

---

## 4. Exam Focus
- **2-Mark Questions:**
    - What is the difference between a listening socket and a connection socket on a TCP server?
    - Which function call in the TCP socket API triggers the three-way handshake from the client side? (`connect()`).
    - In UDP socket programming, how does the server know where to send a reply? (The client's address and port are part of the datagram received via `recvfrom()`).
- **10-Mark Question:**
    - "Compare the socket programming steps (API calls) required for a TCP application versus a UDP application. Describe the process from both the client and server perspectives."
        - **Tip:** Create two columns, one for TCP and one for UDP. List the sequence of socket calls for the server and client. Highlight the key differences, such as the `listen()`/`accept()` calls in TCP and the lack of a `connect()` call in UDP, explaining *why* these differences exist.
