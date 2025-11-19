---
title: "Unit 1: The Network Core"
id: unit1-topic3
tags: [unit1, network-core, packet-switching, circuit-switching, fdm, tdm]
aliases: [Network Core]
---

# Unit 1, Topic 3: The Network Core

We've explored the Internet's edge where end systems live. Now, let's venture into the heart of the network: **The Network Core**.

> [!note] Definition: The Network Core is the mesh of interconnected packet switches (routers) that connect the Internet's end systems to each other. Its primary job is to switch and route data from a source end system to a destination end system.

How does the network core move this data? There are two fundamental approaches: **Circuit Switching** and **Packet Switching**.

---

## 1. Circuit Switching

This is the older, more traditional approach, best exemplified by the telephone network.

In a circuit-switched network, the resources needed along a path (buffers, link transmission rate) are **reserved** for the duration of the communication session.

> [!analogy] Think of it like booking a private, single-lane road from your home to a friend's house. For the entire duration of your trip, that road is exclusively yours. No one else can use it, ensuring you have a smooth, uninterrupted journey.

**Key Characteristics:**
- **Dedicated Circuit:** An end-to-end connection is established and reserved.
- **Guaranteed Performance:** Since the circuit is reserved, you get a guaranteed, constant transmission rate without interference.

### a. Multiplexing in Circuit-Switched Networks
Network links are shared using either Frequency-Division Multiplexing (FDM) or Time-Division Multiplexing (TDM).

- **FDM:** The frequency spectrum of a link is divided among the connections. Each connection gets its own dedicated frequency band.
- **TDM:** The link is divided by time. Each connection gets the entire bandwidth for short, periodic slots of time.

#### FDM vs. TDM Example
Imagine a 1 Mbps link is shared between 4 users.
- **With FDM:** Each user would get their own dedicated 250 Kbps channel all the time.
- **With TDM:** Each user would get the full 1 Mbps bandwidth, but only for one-fourth of the time, in a repeating cycle.

**Problem with Circuit Switching:** It's inefficient for computer data, which is often "bursty." For example, when you are reading a webpage, your dedicated circuit sits idle, wasting resources that others could be using.

---

## 2. Packet Switching

This is the method the Internet uses.

In a packet-switched network, messages are broken down into smaller pieces called **packets**. Each packet travels through the network independently, without any reserved resources.

> [!analogy] This is like the postal service. You send individual letters (packets) in the mail. Each letter is routed independently and is mixed in with letters from many other people. The postal service makes efficient use of its resources (trucks, planes) by filling them with letters from many different people going in the same general direction.

**Key Characteristics:**
- **No Reservations:** Links are not reserved. They are shared on demand, a principle called **statistical multiplexing**.
- **Store-and-Forward:** Packet switches (routers) use a store-and-forward mechanism. The router must receive the *entire* packet before it can begin transmitting it on the next link. This introduces a delay at every hop.
- **Queuing:** Since links are shared, if too many packets arrive at a router destined for the same link, they are placed in a **queue** (buffer). This leads to queuing delays and potential packet loss if the buffer overflows.

---

## 3. Circuit vs. Packet Switching: A Comparison

| Feature             | Circuit Switching | Packet Switching |
|---------------------|-------------------|------------------|
| **Resource Allocation** | Guaranteed, reserved, dedicated "slice" (FDM/TDM). | No reservation. On-demand, statistical multiplexing. |
| **Performance**     | Guaranteed constant rate, no delay variation. | Variable delays (queuing) and potential for loss. |
| **Connection Setup**| **Required.** A connection must be established. | **Not required.** Can send data immediately. |
| **Efficiency**      | Inefficient for bursty data (idle resources are wasted). | Highly efficient and flexible for bursty data. |
| **Example**         | Traditional Telephone Network | The Internet |

---

## Exam Focus

- **2-Mark Questions:**
    - What is the main function of the network core? (To route data between end systems).
    - What is store-and-forward transmission?
    - Why is packet switching more efficient for data traffic? (It handles bursty traffic well through statistical multiplexing).

- **Potential 10-Mark Question:**
    - "Compare and contrast circuit switching and packet switching. Explain which is used by the Internet and why, using a comparison table in your answer."
        - **Tip:** Your answer must include the comparison table above. For each point, provide a brief explanation. Conclude by stating the Internet uses packet switching because its efficiency and flexibility are perfectly suited for the bursty, "on-demand" nature of typical Internet applications (like web browsing). The overhead of reserving a circuit for such traffic would be immense and wasteful.

---

Now that we understand *how* data moves (packet switching), we need to look at the consequences: **Delay, Loss, and Throughput**.

