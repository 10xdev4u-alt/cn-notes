---
title: "Unit 2: Principles of Network Applications"
id: unit2-topic1
tags: [unit2, application-layer, client-server, p2p, sockets, tcp, udp]
aliases: [Application Principles]
---

# Unit 2, Topic 1: Principles of Network Applications

Excellent work completing Unit 1. We now begin our top-down journey in earnest by diving into the **Application Layer**. This is the layer we, as users, interact with most directly—it's where web browsers, email clients, and streaming services live.

This first topic covers the fundamental principles that govern how network applications are designed and built.

---

## 1. Network Application Architectures

Every network application is built upon a specific **architecture** that dictates how the application is structured across the various end systems.

### a. Client-Server Architecture
This is the most traditional and widely used model.
- **Server:** An always-on host that waits for and services requests from other hosts. It typically has a fixed, well-known IP address. Data centers are filled with servers.
- **Client:** A host that requests services from a server. Your PC or smartphone is a client when you browse a website. Clients may have dynamic IP addresses and are not always on.
- **Communication:** Clients communicate with the server, but **not directly with each other**.
- **Examples:** The World Wide Web, Email, FTP.

```ascii
+----------+     +----------+
| Client 1 |     | Client 2 |
+----------+     +----------+
      \             /
       \           /
        +-----------+
        |  Server   | (Always-on)
        +-----------+
```

### b. Peer-to-Peer (P2P) Architecture
In this model, there is minimal or no reliance on a dedicated, always-on server.
- **Peers:** The application runs on pairs of intermittently connected hosts, called peers.
- **Communication:** Peers communicate **directly with each other** to request and provide services.
- **Self-Scalability:** A key advantage. In a P2P file-sharing system, each peer that joins to download a file also becomes a distributor (uploader) of that file, spreading the load.
- **Examples:** BitTorrent, many modern voice/video chat applications (like early Skype), cryptocurrencies.

---

## 2. Processes Communicating

On a technical level, it is not programs but **processes** (a program running within a host) that communicate. A process on one host communicates with a process on another host.

- **Sockets:** A process sends and receives messages to/from the network through a software interface called a **socket**. A socket is the API (Application Programming Interface) between the application and the network.

> [!analogy] The House Analogy
> - A **host** is like a house.
> - A **process** is like a person living in the house.
> - The **socket** is the doorway. For a person to send a letter, they must pass it through the doorway.

- **Addressing Processes:** To send a message to a specific process, we need a complete address, which has two parts:
    1.  The **IP Address** of the host (the street address of the house).
    2.  A **Port Number** to identify the specific process/socket (the name of the person, or a specific door in the house).
    - Example: To connect to a web server, your browser connects to IP address `142.250.196.78` on port number `443`.

---

## 3. Transport Services Available to Applications

The Application Layer doesn't handle the complexities of data delivery. It delegates this task to the Transport Layer below it. An application designer must choose a transport protocol that provides the services their application needs. There are four key service dimensions:

1.  **Reliable Data Transfer:** Does the service guarantee that all data arrives in order and without errors?
2.  **Throughput:** Does the service guarantee a minimum data rate?
3.  **Timing:** Does the service guarantee a maximum delay?
4.  **Security:** Does the service provide encryption and data integrity?

### Internet Transport Protocols: TCP and UDP

The Internet offers two main transport protocols, and they provide very different services:

| Service | TCP (Transmission Control Protocol) | UDP (User Datagram Protocol) |
|---|---|---|
| **Reliable Transfer** | **Yes.** Guarantees delivery and order. | **No.** Packets may be lost or out of order. |
| **Connection Setup** | **Yes.** A "handshake" is required. | **No.** Just send the data. |
| **Congestion Control**| **Yes.** Throttles sending rate. | **No.** Blasts data as fast as possible. |
| **Used By** | HTTP, FTP, SMTP | DNS, Streaming Media, VoIP |

---

## 4. Choosing the Right Transport Protocol: A Practical Guide

The choice between TCP and UDP is one of the first decisions an application developer makes. The answer depends entirely on the application's requirements.

#### When to Use TCP:
Use TCP when reliability is paramount. If every bit of data must arrive, and in the correct order, TCP is the choice.
- **File Transfer (FTP):** A single corrupted bit can make a file unusable. TCP's reliability guarantee is essential.
- **Web Browsing (HTTP/HTTPS):** A web page is made of HTML, CSS, and images. All of this data must arrive correctly for the page to render properly.
- **Email (SMTP):** You expect your emails to arrive complete and un-garbled.

#### When to Use UDP:
Use UDP when speed is more important than perfect reliability.
- **Domain Name System (DNS):** DNS queries are simple, small requests and responses. If a query is lost, the client can simply send it again. The overhead of a TCP handshake for every query would be far too slow.
- **Real-time Voice/Video Chat (VoIP):** In a live conversation, if a small packet of audio data is lost, it's better to just skip it and play the next one (a tiny glitch) than to wait for a retransmission, which would introduce a long, noticeable pause.
- **Online Gaming:** Similar to VoIP, game state updates need to arrive as fast as possible. A slightly old update is useless, so it's better to drop a lost packet and move on to the next one than to wait for a retransmission.

---

## Exam Focus
- **2-Mark Questions:**
    - Differentiate between client-server and P2P architectures.
    - What is a socket?
    - What two pieces of information are required to identify a specific process on a remote host? (IP address and port number).
    - List two services that TCP provides but UDP does not. (Reliable data transfer, congestion control).
- **10-Mark Question:**
    - "Describe the key principles of network applications, including application architectures and the transport services they might require. Compare and contrast the services offered by TCP and UDP, giving examples of applications that use each."
        - **Tip:** Structure your answer in three parts. First, explain client-server vs. P2P. Second, explain the four dimensions of transport service. Third, use a table to compare TCP and UDP and list common applications for each, explaining *why* they use that protocol (e.g., "The web uses TCP because the complete and correct loading of a webpage is critical").
