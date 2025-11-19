---
title: "Unit 5: Multiple Access Links and Protocols"
id: unit5-topic3
tags: [unit5, link-layer, mac-protocols, csma-cd, aloha]
aliases: [MAC Protocols, Multiple Access Control]
---

# Unit 5, Topic 3: Multiple Access Links and Protocols

In our introduction to the link layer, we mentioned that one of its key services is coordinating access on a shared **broadcast link**. When multiple nodes share the same physical medium (like a Wi-Fi channel or an old-fashioned coaxial cable for Ethernet), there's a risk of **collisions**.

> [!note] Definition: A **collision** occurs when two or more nodes transmit frames at the same time, causing their signals to interfere. When a collision occurs, the transmitted frames are corrupted and lost.

The **Multiple Access Control (MAC)** protocol is the algorithm that nodes use to coordinate their transmissions and handle collisions. The goal is to share the channel efficiently and fairly.

There are three main classes of MAC protocols.

---

## 1. Channel Partitioning Protocols

These protocols divide the shared channel's bandwidth into smaller, dedicated "pieces" and allocate one piece to each node. This guarantees that no collisions can occur.

- **Time Division Multiple Access (TDMA):** The channel is divided into time slots. Each node is assigned a specific time slot in a repeating cycle and is only allowed to transmit during its assigned slot.
- **Frequency Division Multiple Access (FDMA):** The channel's frequency spectrum is divided into different frequency bands. Each node is assigned its own dedicated frequency band.

- **Pros:** Collision-free and fair, as each node gets a guaranteed portion of the bandwidth.
- **Cons:** Inefficient. If a node has nothing to send, its dedicated slot or frequency band goes unused and is wasted. This is particularly bad for bursty traffic.

---

## 2. Random Access Protocols

In this approach, there are no dedicated slots. A transmitting node always uses the full rate of the channel. The protocol specifies how to detect and recover from collisions when they inevitably occur.

### CSMA/CD (Carrier Sense Multiple Access with Collision Detection)
This is the classic protocol used in traditional Ethernet. It works like a polite conversation.

1.  **Carrier Sense:** "Listen before you talk." Before transmitting, the node listens to the channel to see if it is idle. If another node is transmitting, it waits. If the channel is idle, it begins to transmit its frame.

2.  **Collision Detection:** "Stop talking if someone interrupts." While transmitting, the node simultaneously listens to the channel to detect collisions. A collision is detected if the node senses a signal that is stronger than its own transmission (indicating another node is also transmitting).

3.  **Reaction:** If a collision is detected, the node immediately:
    a. Stops transmitting its data frame.
    b. Transmits a short "jam signal" to ensure all other nodes are aware of the collision.
    c. Enters a state of **binary exponential backoff**. It waits a random amount of time before trying the "listen before you talk" step again. The range from which this random time is chosen doubles after each successive collision for a given frame, reducing the chance of repeated collisions.

---

## 3. Taking-Turns Protocols

These protocols aim to combine the benefits of the previous two approaches: the collision-free nature of channel partitioning and the full-channel-rate efficiency of random access.

- **Polling:** A "master" node polls each of the "slave" nodes in a round-robin fashion, inviting them to transmit. The master controls access to the channel, eliminating collisions. This is common in environments where one device has a primary role (e.g., cellular base stations).

- **Token Passing:** A special, small packet called a **token** is passed from node to node in a fixed order (a logical ring). A node is only allowed to transmit if it is currently holding the token. After it is done, it passes the token to the next node in the ring. This is decentralized and collision-free. Token Ring networks were a classic example.

---

## Exam Focus

- **2-Mark Questions:**
    - What is a "collision" in the context of a broadcast link?
    - What are the three main categories of MAC protocols? (Channel Partitioning, Random Access, Taking-Turns).
    - What does CSMA/CD stand for? (Carrier Sense Multiple Access with Collision Detection).
- **10-Mark Question:**
    - "Explain the operation of the CSMA/CD protocol. Describe each of its main components and explain how it handles collisions."
        - **Tip:** Break down the answer by the acronym. Explain "Carrier Sense" (listen before talk), "Multiple Access" (many nodes on one wire), and "Collision Detection" (listen while talk). Then, detail the reaction to a collision: stop, jam, and perform binary exponential backoff.
- **Comparison Question:**
    - "Compare and contrast channel partitioning protocols and random access protocols. What are the main advantages and disadvantages of each?"
        - **Tip:** For Channel Partitioning (TDMA/FDMA), focus on the pro (no collisions) and the con (wasted bandwidth for idle nodes). For Random Access (CSMA), focus on the pro (efficient for bursty traffic) and the con (collisions can occur).
