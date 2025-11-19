---
title: "Unit 1: The Network Core"
id: unit1-topic3
tags: [unit1, network-core, packet-switching, circuit-switching]
aliases: [Network Core]
---

# Unit 1, Topic 3: The Network Core

We've explored the Internet's edge where end systems live. Now, let's venture into the heart of the network: **The Network Core**.

> [!note] Definition: The Network Core is the mesh of interconnected packet switches (routers) that connect the Internet's end systems to each other. Its primary job is to switch and route data from a source end system to a destination end system.

When you send an email, it travels from your computer (at the network edge), through an access network to an edge router, across the network core, and finally to the recipient's edge router, access network, and end system.

How does the network core move this data? There are two fundamental approaches: **Circuit Switching** and **Packet Switching**.

---

## 1. Circuit Switching

This is the older, more traditional approach, best exemplified by the telephone network.

In a circuit-switched network, the resources needed along a path (buffers, link transmission rate) are **reserved** for the duration of the communication session.

> [!analogy] Think of it like booking a private road from your home to a friend's house. For the entire duration of your trip, that road is exclusively yours. No one else can use it, ensuring you have a smooth, uninterrupted journey.

**Key Characteristics:**
- **Dedicated Circuit:** An end-to-end connection is established and reserved.
- **Three Phases:**
    1.  **Connection Setup:** The circuit is established. (This causes an initial delay).
    2.  **Data Transfer:** Data flows continuously.
    3.  **Teardown:** The circuit is disconnected.
- **Guaranteed Performance:** Since the circuit is reserved, you get a guaranteed, constant transmission rate without interference.

### How is the link shared?
Network links are shared using either Frequency-Division Multiplexing (FDM) or Time-Division Multiplexing (TDM).
- **FDM:** The frequency spectrum of a link is divided among the connections.
- **TDM:** The link is divided by time. Each connection gets the entire bandwidth for short, periodic slots of time.

```ascii
FDM (Frequency)
Link Bandwidth
  ^
  |---+-------+-----> Connection 1
  |---+-------+-----> Connection 2
  |---+-------+-----> Connection 3
  +-----------------> Time

TDM (Time)
Link Bandwidth
  ^
  |---+  +---+  +---> Connection 1
  |  +---+  +---+  --> Connection 2
  |   +---+  +--- ---> Connection 3
  +-----------------> Time
```

**Problem with Circuit Switching:** It's inefficient for computer data, which is often "bursty" (e.g., you load a webpage then read it, leaving the connection idle). The reserved circuit goes unused during these idle periods.

---

## 2. Packet Switching

This is the method the Internet uses.

In a packet-switched network, messages are broken down into smaller pieces called **packets**. Each packet travels through the network independently, without any reserved resources.

> [!analogy] This is like the postal service. You send individual letters (packets) in the mail. Each letter is routed independently. Your letters might take different paths and will be mixed in with letters from many other people.

**Key Characteristics:**
- **No Reservations:** Links are not reserved. They are shared on demand.
- **Store-and-Forward:** Packet switches (routers) use a store-and-forward mechanism. The router must receive the *entire* packet before it can begin transmitting it on the next link. This introduces a delay at every hop.
- **Queuing and Congestion:** Since links are shared, if too many packets arrive at a router destined for the same link, they are placed in a **queue** (like cars at a traffic light). If the queue gets too full, packets can be dropped (lost). This leads to variable delays and potential data loss.

**Why is Packet Switching dominant?** It offers far better efficiency for the bursty nature of computer data by allowing many users to share the network resources simultaneously.

---

## Exam Focus

- **2-Mark Questions:**
    - What is the main function of the network core? (To route data between end systems).
    - Define circuit switching.
    - Define packet switching.
    - What is store-and-forward transmission?
    - Why is packet switching more efficient for data traffic? (Handles bursty traffic well, better resource sharing).

- **Potential 10-Mark Question:**
    - "Compare and contrast circuit switching and packet switching. Explain which is used by the Internet and why."
        - **Tip:** Create a table for comparison.
        | Feature             | Circuit Switching | Packet Switching |
        |---------------------|-------------------|------------------|
        | Resource Allocation | Reserved          | On-demand (Shared) |
        | Performance         | Guaranteed        | Variable (delay, loss) |
        | Setup Phase         | Required          | Not needed       |
        | Suited for...       | Constant-rate data| Bursty data      |
        - Explain each point. Conclude by stating the Internet uses packet switching because it's more efficient and flexible for the diverse and bursty nature of typical Internet applications.

---

Now that we understand *how* data moves (packet switching), we need to look at the consequences: **Delay, Loss, and Throughput**.

