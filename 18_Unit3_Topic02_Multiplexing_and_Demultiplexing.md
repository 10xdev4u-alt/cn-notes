---
title: "Unit 3: Multiplexing and Demultiplexing"
id: unit3-topic2
tags: [unit3, transport-layer, multiplexing, demultiplexing, sockets, ports]
aliases: [Mux/Demux]
---

# Unit 3, Topic 2: Multiplexing and Demultiplexing

In the previous topic, we introduced multiplexing and demultiplexing as a core service of the transport layer. Now, we will explore the mechanics of this service in detail. It's the mechanism that allows a single host to run many network applications simultaneously (e.g., a web browser, a background update, and a voice chat).

---

## 1. Definitions Revisited

- **Multiplexing (at source):** The job of gathering data from multiple application sockets, adding a transport-layer header (which includes source and destination **port numbers**), and passing the resulting segments to the network layer. It's like many people in an office building (processes) putting their letters into a single outgoing mail cart.

- **Demultiplexing (at destination):** The job of delivering the data in a received transport-layer segment to the correct application socket. The transport layer does this by inspecting the segment's header fields, primarily the port numbers. This is like the mailroom clerk in the destination office building sorting the mail and delivering it to the correct recipients.

```ascii
     +-------------+    +-------------+
     | Process A   |    | Process B   |
     +-------------+    +-------------+
        | (Socket)       | (Socket)
        v                v
+----------------------------------------+
| Transport Layer (Multiplexing)         | Adds Dst/Src Port Headers
+----------------------------------------+
        | (Segments)
        v
+----------------------------------------+
| Network Layer                          | To Destination Host
+----------------------------------------+
```

---

## 2. How Demultiplexing Works

The key to demultiplexing is the **port number**. When a process on a host wants to receive messages, it creates a socket and binds it to a specific port number (a 16-bit number from 0 to 65535).

When a TCP or UDP segment arrives at the host from the network layer:
1.  The host's transport layer inspects the **destination port number** in the segment's header.
2.  It uses this port number to identify the correct socket.
3.  The segment's data is then passed to that socket's receive buffer, making it available to the application process.

The specifics of how the correct socket is identified differ slightly but importantly between connectionless (UDP) and connection-oriented (TCP) protocols.

---

## 3. Connectionless Demultiplexing (UDP)

A UDP socket is uniquely identified by a two-tuple:
`(Destination IP Address, Destination Port Number)`

- When a UDP segment arrives, the OS looks only at the destination port number to deliver the segment to the correct socket.
- The source IP and port are noted but are not used to identify the socket itself.
- **Consequence:** If two UDP segments from different sources (different source IP and/or port) arrive at the host destined for the same destination port, **both segments will be directed to the exact same socket**.

---

## 4. Connection-Oriented Demultiplexing (TCP)

This is more sophisticated. A TCP socket is uniquely identified by a four-tuple:
`(Source IP, Source Port, Destination IP, Destination Port)`

- When a TCP segment arrives, the OS uses **all four values** from the segment header to find the correct socket.
- **Consequence:** Two TCP segments arriving at the same destination port but from different sources will be directed to **different sockets**.

This is what allows a single web server process (e.g., listening on port 443) to communicate with thousands of different clients simultaneously.

### The TCP Server Socket Story
1.  A TCP server process starts by creating a "welcoming" or **listening socket**, which it binds to a well-known port (e.g., 443 for HTTPS).
2.  When a connection request from a client arrives at this listening socket, the server OS creates a **new, dedicated connection socket**.
3.  This new connection socket is identified by the full four-tuple of that specific client-server connection.
4.  All subsequent communication with that specific client happens on this new connection socket. The original listening socket remains free to accept new connections from other clients.

```ascii
                                         +------------------+
                                         | Client A Socket  |
                                         | SrcIP:A, SrcPrt:X  |
                                         +------------------+
                                                |
                                                v
+-------------------+      +------------------------------------------+
| Listening Socket  |----->| New Connection Socket for A              |
| DstPrt: 443       |      | (SrcIP:A, SrcPrt:X, DstIP:S, DstPrt:443)   |
+-------------------+      +------------------------------------------+
 (Accepts new clients)      (Handles communication with Client A)


                                         +------------------+
                                         | Client B Socket  |
                                         | SrcIP:B, SrcPrt:Y  |
                                         +------------------+
                                                |
                                                v
                               +------------------------------------------+
                               | New Connection Socket for B              |
                               | (SrcIP:B, SrcPrt:Y, DstIP:S, DstPrt:443)   |
                               +------------------------------------------+
                                (Handles communication with Client B)
```

---

## Exam Focus

- **2-Mark Questions:**
    - What is the difference between multiplexing and demultiplexing?
    - How does a host direct an incoming transport segment to the appropriate socket? (Using the port number).
- **Short-Note Question (5 Marks):**
    - "Differentiate between connectionless and connection-oriented demultiplexing."
        - **Tip:** Explain that UDP uses a 2-tuple (dst IP, dst port) to identify the socket, while TCP uses a 4-tuple (src IP, src port, dst IP, dst port). State the consequence: multiple distinct TCP connections can connect to the same server port simultaneously, each getting its own socket.
- **10-Mark Question:**
    - "Explain the role of sockets and port numbers in transport-layer multiplexing and demultiplexing. Describe how a multi-threaded TCP server can handle requests from many clients simultaneously on a single port."
        - **Tip:** Start by defining mux/demux. Then, explain the TCP server socket mechanism in detail: the role of the listening socket on a well-known port and how the `accept()` call spawns a new connection socket (identified by the 4-tuple) for each client.
