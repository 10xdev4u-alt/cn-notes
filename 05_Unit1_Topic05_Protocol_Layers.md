---
title: "Unit 1: Protocol Layers and Their Service Models"
id: unit1-topic5
tags: [unit1, protocol-stack, layering, encapsulation, tcp-ip, osi-model]
aliases: [Protocol Layers, Service Models]
---

# Unit 1, Topic 5: Protocol Layers and Their Service Models

Dealing with the immense complexity of networking requires organization. The functions of a network are broken down into a series of **layers**. Each layer provides a specific set of services to the layer directly above it by using the services of the layer directly below it.

> [!analogy] **The Air Travel Analogy**
> Think about taking a flight. The process is a series of steps (layers):
> 1.  **Purchase Ticket (Application):** You interact with the airline's service.
> 2.  **Baggage Check (Transport):** Your luggage (data) is tagged and sent off.
> 3.  **Boarding Gate (Network):** You are routed to the correct departure gate.
> 4.  **Runway Control (Link):** The plane is guided from the gate to the runway.
> 5.  **Flight (Physical):** The plane physically flies from one airport to another.
>
> Each step is a self-contained process. This separation of concerns makes the complex process manageable.

---

## 1. The Internet Protocol Stack (TCP/IP)

The Internet's architecture is organized into a 5-layer stack. Each layer has a name for its unit of data, its Protocol Data Unit (PDU).

| Layer | PDU Name | Function & Protocols |
|---|---|---|
| **5. Application** | Message | Supporting network applications (HTTP, DNS, SMTP) |
| **4. Transport** | Segment | Host-to-host data transfer (TCP, UDP) |
| **3. Network** | Datagram | Routing data from source to destination (IP) |
| **2. Link** | Frame | Data transfer between adjacent nodes (Ethernet, Wi-Fi)|
| **1. Physical** | Bit | Moving individual bits on the wire |

---

## 2. The OSI (Open Systems Interconnection) Model

The OSI model is a more formal, 7-layer theoretical model. While not implemented in practice like the TCP/IP stack, it is a useful reference.

| OSI Model | Internet Stack |
|---|---|
| 7. Application |<---\ |
| 6. Presentation |    | Application |
| 5. Session |<---/ |
| 4. Transport | Transport |
| 3. Network | Network |
| 2. Data Link | Link |
| 1. Physical | Physical |

- **Presentation Layer:** Responsible for data translation, encryption, and compression (e.g., JPEG, ASCII). In the Internet model, this is handled by the application itself.
- **Session Layer:** Responsible for managing sessions, including synchronization and checkpointing. In the Internet model, this is also handled by the application.

---

## 3. Encapsulation and Decapsulation

As data is passed down the protocol stack at the source host, each layer adds its own header information. This process is called **encapsulation**. The reverse process at the destination host is **decapsulation**.

```ascii
+----------+                                                     +----------+
|   Host A |                                                     |  Host B  |
+----------+                                                     +----------+
| Message  |                                                     | Message  |
+----------+                                                     +----------+
      |  (Encapsulation)                                       ^ (Decapsulation)
      v                                                        |
+----------+---------+                                   +----------+---------+
| H_t | Message      | ---> (Segment)                  ^ | H_t | Message      |
+----------+---------+      (through network)          | +----------+---------+
      |                                                  |           |
      v                                                  |           v
+----------+---------+---------+                     ^   |   +----------+
| H_n | H_t | Message | ---> (Datagram)             |   |   | Router   |
+----------+---------+---------+                   |   |   +----------+
      |                                             |   |        ^ |
      v                                             |   |        | v
+----------+---------+---------+---------+         |   |   +----------+
| H_l | H_n | H_t | Message | ---> (Frame) ---------+---> | H_l'| H_n|...|
+----------+---------+---------+---------+             +----------+
 (H_t, H_n, H_l are Transport, Network, and Link layer headers)
```
- At each step down, the data unit from the layer above becomes the "payload" for the current layer.
- Routers in the middle only operate up to the Network Layer. They decapsulate the frame to see the datagram's destination IP, but they do not look inside at the transport-layer segment.

---

## Exam Focus
- **2-Mark Questions:**
    - List the 5 layers of the Internet protocol stack and the 7 layers of the OSI model.
    - What is encapsulation?
    - What is the data unit (PDU) called at the Network Layer? (Datagram).
- **10-Mark Question:**
    - "Explain the concept of protocol layering and encapsulation with a neat diagram. Compare and contrast the 5-layer Internet stack with the 7-layer OSI model."
        - **Tip:** Draw the side-by-side comparison of the stacks. Explain the function of the two extra OSI layers (Presentation, Session) and state that in the Internet model, their functions are left to the application developer. Then, use the encapsulation diagram to show how a message is wrapped in headers at each layer.