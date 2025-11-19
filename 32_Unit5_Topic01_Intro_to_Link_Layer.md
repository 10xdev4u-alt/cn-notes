---
title: "Unit 5: Introduction to the Link Layer"
id: unit5-topic1
tags: [unit5, link-layer, framing, mac-address]
aliases: [Link Layer Introduction]
---

# Unit 5, Topic 1: Introduction to the Link Layer

Welcome to our final unit. Having traversed the network from the Application layer all the way down, we now arrive at the **Link Layer** (Layer 2) and the **Physical Layer** (Layer 1). The Link Layer is responsible for moving a network-layer datagram between adjacent nodes over a single communication link.

> [!analogy] The Cross-Country Trip Analogy
> - **Transport Layer:** Like a tour company (process) planning a trip for a person from a source house to a destination house.
> - **Network Layer:** Like the GPS or map service (host-to-host) that plans the entire route, determining the sequence of highways and interchanges to take.
> - **Link Layer:** Like the driver of the car (node-to-node) responsible for the specific task of driving one single segment of the journey, from one interchange to the next.

The Link Layer's job is local; its scope is a single link. The datagrams it carries may be destined for a node thousands of miles away, but the link layer's concern is only with getting that datagram successfully to the *next* node in the path.

---

## 1. Services Provided by the Link Layer

The Link Layer provides several key services to the Network Layer above it.

1.  **Framing:**
    - The Link Layer encapsulates the network-layer datagram in a link-layer **frame**.
    - A frame consists of a header, the data payload (the datagram), and sometimes a trailer. This "framing" separates one network-layer datagram from the next in the stream of bits.

2.  **Link Access (Medium Access Control - MAC):**
    - For links that are a **broadcast medium** (where multiple nodes share the same channel, like Wi-Fi or old-fashioned Ethernet), a protocol is needed to coordinate access.
    - The **MAC protocol** specifies the rules by which nodes share the channel to avoid collisions (multiple nodes transmitting at once).

3.  **Reliable Delivery:**
    - While TCP provides end-to-end reliability, some link-layer protocols also offer a per-link reliable delivery service.
    - This is particularly useful for high-error-rate links like wireless links, where it is much more efficient to detect and correct an error locally on that single link, rather than waiting for the end-to-end transport protocol to time out and retransmit.

4.  **Error Detection and Correction:**
    - The link layer's header and/or trailer almost always includes bits for error detection (e.g., a checksum).
    - These are checked at the receiving node. If an error is detected, the frame is typically discarded. Some powerful link-layer protocols can also perform error *correction*.

---

## 2. Where is the Link Layer Implemented?

The link layer is implemented in the **network adapter**, more commonly known as a **Network Interface Card (NIC)**. This is a piece of hardware that connects your computer or router to the physical medium.

The link layer is therefore a combination of hardware, software, and firmware:
- **Hardware:** The NIC itself.
- **Software:** The device driver in the operating system that communicates with the NIC.
- **Firmware:** Software running on the NIC's own processor.

Every host and router has a link-layer protocol for each of its network interfaces.

---

## Exam Focus

- **2-Mark Questions:**
    - What is the fundamental responsibility of the link layer? (To move a datagram across a single, adjacent link).
    - What is a link-layer "frame"? (A datagram encapsulated with a link-layer header and trailer).
    - What does MAC stand for, and what is its purpose? (Medium Access Control; to coordinate access on a shared link).
- **10-Mark Question:**
    - "Describe the placement of the link layer in the protocol stack and list its primary services. For each service, provide a brief explanation of its purpose."
        - **Tip:** Use the travel analogy to explain the link layer's scope. Then, list and describe the four key services: Framing (encapsulation), Link Access (MAC for shared media), Reliable Delivery (for high-error links), and Error Detection/Correction (ensuring frame integrity).
