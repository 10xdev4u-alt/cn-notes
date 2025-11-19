---
title: "Unit 4: Broadcast and Multicast Routing"
id: unit4-topic8
tags: [unit4, network-layer, routing, broadcast, multicast, igmp]
aliases: [Broadcast Routing, Multicast Routing]
---

# Unit 4, Topic 8: Broadcast and Multicast Routing

So far, all the routing we have discussed has been **unicast**—delivering a packet from one source to one specific destination. In this final topic for Unit 4, we'll explore two other forms of delivery: **broadcast** and **multicast**.

- **Unicast:** One-to-one communication.
- **Broadcast:** One-to-all communication.
- **Multicast:** One-to-many (but not all) communication.

---

## 1. Broadcast Routing

The goal of broadcast routing is to deliver a packet from a source node to *all other nodes* in the network.

### a. Naive Approaches

- **N-way Unicast:** The source could create `N-1` copies of the packet and send one to every other node in the network. This is grossly inefficient as it burdens the source and clogs the network with many identical, redundant packets.

- **Uncontrolled Flooding:** The source sends the packet to all of its neighbors. When a node receives a broadcast packet, it duplicates it and forwards it to all of its neighbors, *except* the one it received the packet from.
    - **Problem:** In a network with loops (which most networks have for redundancy), this will cause a "broadcast storm," where packets are duplicated endlessly and cycle through the loops, eventually bringing the network to a halt.

### b. Controlled Flooding Solutions

To implement broadcast correctly, we must avoid the broadcast storm.

- **Sequence-Number-Controlled Flooding:** The source node puts its address and a unique broadcast sequence number into the packet. Each node in the network maintains a list of (source, sequence number) pairs for broadcast packets it has already seen. If a node receives a broadcast packet with a source/sequence number pair that is already on its list, it discards the packet instead of forwarding it. This breaks the loops and prevents endless duplication.

- **Spanning Tree Broadcast:** A more efficient approach. The nodes in the network first construct a **spanning tree**, which is a subgraph that connects all the nodes but contains no loops. To perform a broadcast, the source node sends the packet, and the routers simply forward it along all the branches of the spanning tree. This guarantees that the packet will reach every node with maximum efficiency and no duplication.

---

## 2. Multicast Routing

Multicast is a more refined form of group communication. Instead of sending a packet to *all* nodes, multicast delivers a packet to a specific *group* of interested receivers.

- **Applications:** Multicast is ideal for applications like IPTV, live-streamed events (e.g., a NASA launch), stock market data distribution, and multiplayer online gaming, where many users need to receive the same data stream simultaneously.
- **The Goal:** To build a distribution tree that connects the source node to only the hosts that have indicated they want to receive the multicast traffic. This avoids sending unnecessary traffic to parts of the network where no one is listening.

### a. Multicast Addressing and IGMP

- **Multicast IP Addresses:** A special range of IP addresses (Class D in IPv4: `224.0.0.0` to `239.255.255.255`) is reserved for multicast groups. A data stream for a particular TV channel, for example, would be sent to a specific multicast IP address.
- **IGMP (Internet Group Management Protocol):** How does the network know which hosts are interested in which groups? A host uses IGMP to signal to its local router that it wants to "join" or "leave" a specific multicast group address.

### b. Multicast Routing Algorithms
The goal of a multicast routing algorithm is to use the information gathered via IGMP to build a **multicast tree**. This tree prunes off branches of the network that have no interested receivers.
- Routers communicate with each other to determine if any hosts on their downstream links have joined a particular group.
- If a router has interested hosts, it works with its upstream routers to join the multicast distribution tree for that group, ensuring that the data stream is forwarded to it.
- Common multicast routing algorithms include **DVMRP** (a distance-vector approach) and **PIM (Protocol-Independent Multicast)**.

---

## Exam Focus

- **2-Mark Questions:**
    - Differentiate between broadcast and multicast. (Broadcast is one-to-all; Multicast is one-to-many interested receivers).
    - What is a "broadcast storm" and how can it be prevented? (Endless duplication of packets in a network with loops; prevented by sequence-number control or spanning trees).
    - What is the role of IGMP? (It allows a host to inform its local router that it wants to join or leave a multicast group).
- **10-Mark Question:**
    - "Differentiate between unicast, broadcast, and multicast routing. For broadcast routing, explain the problem of uncontrolled flooding and describe a robust method to perform a network-wide broadcast. For multicast routing, explain the role of IGMP."
        - **Tip:** Start with the one-to-one, one-to-all, one-to-many definitions. Use the "broadcast storm" concept to explain the problem with simple flooding. Describe spanning-tree broadcast as an efficient solution. Then, explain that IGMP is the "join/leave" signal from hosts to routers that enables the creation of efficient multicast trees.
