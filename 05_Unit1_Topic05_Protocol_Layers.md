---
title: "Unit 1: Protocol Layers and Their Service Models"
id: unit1-topic5
tags: [unit1, protocol-stack, layering, encapsulation, tcp-ip]
aliases: [Protocol Layers, Service Models]
---

# Unit 1, Topic 5: Protocol Layers and Their Service Models

We've seen the physical components of the Internet and the performance issues. But how is such a complex system organized? The answer lies in a layered architecture.

## 1. The Concept of Layering

Dealing with the immense complexity of networking requires organization. The functions of a network are broken down into a series of **layers**. Each layer provides a specific set of services to the layer directly above it, and it uses the services of the layer directly below it.

> [!analogy] **The Air Travel Analogy**
> Think about taking a flight. The entire process is a series of steps, each handled by a different "layer":
> 1.  **Purchase Ticket (Application):** You interact with the airline's service.
> 2.  **Baggage Check (Transport):** Your luggage (data) is tagged and sent off.
> 3.  **Boarding Gate (Network):** You are routed to the correct departure gate.
> 4.  **Runway Control (Link):** The plane is guided from the gate to the runway.
> 5.  **Flight (Physical):** The plane physically flies from one airport to another.
>
> Each step is a self-contained process. The ticketing agent doesn't need to know about runway procedures. This separation of concerns makes the complex process of air travel manageable. Networking uses the same principle.

## 2. The Internet Protocol Stack (TCP/IP)

The Internet's architecture is organized into a 5-layer stack, often called the TCP/IP stack.

```ascii
+---------------------+
| 5. Application      |  <-- Supporting network applications (HTTP, DNS)
+---------------------+
| 4. Transport        |  <-- Host-to-host data transfer (TCP, UDP)
+---------------------+
| 3. Network          |  <-- Routing data from source to destination (IP)
+---------------------+
| 2. Link             |  <-- Data transfer between adjacent network elements
+---------------------+
| 1. Physical         |  <-- Moving individual bits on the wire
+---------------------+
```

### Layer Functions
- **Application Layer:** Where network applications like web browsers and email clients operate. Defines protocols like HTTP (for the web) and SMTP (for email).
- **Transport Layer:** Responsible for transporting application-layer messages between the client and server end systems. The two main protocols are TCP (reliable, connection-oriented) and UDP (unreliable, connectionless).
- **Network Layer:** Responsible for moving network-layer packets, known as **datagrams**, from one host to another. It uses the Internet Protocol (IP) and routing protocols to determine the best path.
- **Link Layer:** Moves data packets, called **frames**, over a single link in the path (e.g., from your PC to the router). Examples: Ethernet, Wi-Fi.
- **Physical Layer:** The most fundamental layer. It moves the individual bits that make up a link-layer frame from one node to the next.

## 3. Service Models

Each layer provides a **service** to the layer above it. For example:
- The **Link Layer** provides the service of moving a frame across a single link.
- The **Network Layer** uses this service to provide its own service: routing a datagram from the source host to the destination host.
- The **Transport Layer** uses the network layer's service to provide its own service: reliable data transfer between applications.

## 4. Encapsulation

As data is passed down the protocol stack, each layer adds its own header information. This process is called **encapsulation**.

Imagine you write a message.
1.  The **Application Layer** creates the message.
2.  It's passed to the **Transport Layer**, which adds a header (e.g., TCP header with port numbers). The unit is now a **segment**.
3.  The segment is passed to the **Network Layer**, which adds its header (e.g., IP header with source/destination IP addresses). The unit is now a **datagram**.
4.  The datagram is passed to the **Link Layer**, which adds its header (e.g., Ethernet header with MAC addresses). The unit is now a **frame**.
5.  The **Physical Layer** transmits the frame bit by bit.

At the receiving end, the reverse process (decapsulation) occurs. Each layer strips off its corresponding header and passes the data up to the next layer until the original message reaches the receiving application.

```ascii
+--------------------------------------------------------------+
|                            Message                           |  <-- Application
+--------------------------------------------------------------+
      |
      v
+---------+----------------------------------------------------+
|  H_t    |                      Message                       |  <-- Segment (Transport)
+---------+----------------------------------------------------+
            |
            v
+---------+---------+------------------------------------------+
|  H_n    |  H_t    |                  Message                 |  <-- Datagram (Network)
+---------+---------+------------------------------------------+
                      |
                      v
+---------+---------+---------+--------------------------------+
|  H_l    |  H_n    |  H_t    |            Message             |  <-- Frame (Link)
+---------+---------+---------+--------------------------------+
```
(Where H_t, H_n, H_l are Transport, Network, and Link layer headers)

---

## Exam Focus
- **2-Mark Questions:**
    - What is the primary purpose of layering in protocols? (To manage complexity).
    - List the 5 layers of the Internet protocol stack.
    - What is encapsulation?
    - What is the data unit called at the Transport Layer? (Segment). At the Network Layer? (Datagram). At the Link Layer? (Frame).
- **10-Mark Question:**
    - "Explain the concept of protocol layering and encapsulation with a neat diagram. Describe the function of each layer in the 5-layer Internet stack."
        - **Tip:** Start with the air travel analogy to explain *why* we need layers. Draw the stack and the encapsulation diagram. Then, for each of the 5 layers, write its name, its primary function, and its data unit name.

---

Next, we will briefly discuss the difference between the Top-Down and Bottom-Up approaches to studying networking.
