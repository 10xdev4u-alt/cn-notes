---
title: "Unit 5: Switched Local Area Networks"
id: unit5-topic4
tags: [unit5, link-layer, ethernet, mac-address, arp, switches]
aliases: [LANs, Switches, MAC Addresses, ARP]
---

# Unit 5, Topic 4: Switched Local Area Networks

We now zoom in from the general principles of link-layer protocols to the specifics of the most dominant wired Local Area Network (LAN) technology in the world: **Ethernet**. Modern Ethernet LANs are "switched LANs," which rely on a few key concepts: MAC addressing, the Address Resolution Protocol (ARP), and intelligent switches.

---

## 1. MAC Addresses

- **Purpose:** While an IP address gets a datagram to the correct destination LAN, a **MAC address** is needed to get a frame from one node to the *next physically connected node* on that same LAN. It is a link-layer address.
- **Format:** A MAC address is a 48-bit (6-byte) address that is permanently burned into the ROM of every Network Interface Card (NIC). It is intended to be globally unique.
- **Notation:** It is typically written as six pairs of hexadecimal digits separated by colons or hyphens (e.g., `00:1A:2B:3C:4D:5E`).
- **Analogy:** If an IP address is like a house's postal address (which can change if the residents move), a MAC address is like the house's unique GPS coordinate (fixed and physical).

---

## 2. ARP (Address Resolution Protocol)

ARP is the critical utility that links the Network Layer (IP addresses) to the Link Layer (MAC addresses).

- **The Problem:** A host `A` on a LAN wants to send a datagram to host `B` on the same LAN. Host `A` knows host `B`'s IP address (e.g., from DNS), but to build the link-layer frame, it needs host `B`'s MAC address. How does it find it?
- **The Solution:** ARP. Each host and router on a LAN maintains an **ARP table** in its memory, which maps IP addresses to their corresponding MAC addresses (e.g., `192.168.1.100` -> `00:1A:2B:3C:4D:5E`).

#### How ARP Works
1.  Host `A` checks its ARP table. If it finds an entry for `B`'s IP address, it uses that MAC address and is done.
2.  If there's no entry, Host `A` constructs a special **ARP query packet**. This packet contains `A`'s IP and MAC, and `B`'s IP. It essentially asks, "Which MAC address has this IP address?"
3.  Host `A` wraps this ARP query in an Ethernet frame with a special **broadcast destination MAC address** (`FF:FF:FF:FF:FF:FF`).
4.  This broadcast frame is sent to *every node* on the LAN.
5.  All nodes receive and process the ARP query. Only host `B` recognizes its own IP address in the query.
6.  Host `B` sends back a standard **unicast frame** directly to Host `A`'s MAC address. This frame contains the **ARP reply**, stating its IP and MAC address pair.
7.  Host `A` receives the reply and stores the mapping in its ARP table for future use. It can now send its original IP datagram.

> [!tip] ARP Query is **broadcast**. ARP Reply is **unicast**.

---

## 3. Link-Layer Switches

In the early days, Ethernet used broadcast "hubs" which were simple devices that repeated any incoming bits on all other ports, leading to frequent collisions. Modern LANs use intelligent **switches**.

- **What they are:** A switch is a link-layer device that forwards frames between its ports. Unlike a hub, it is "intelligent" and does not create one big collision domain.
- **Self-Learning:** A switch builds its forwarding table automatically and dynamically, without any manual configuration.
    1. The switch's table maps destination MAC addresses to the switch port that leads to that destination.
    2. To build the table, the switch inspects the **source MAC address** of every frame that arrives on each port. If a frame from MAC address `X` arrives on port 1, the switch learns that `X` is reachable via port 1 and creates an entry.
- **Forwarding Logic:** When a frame arrives on a port with a destination MAC address `Y`:
    - **If `Y` is in the switch table:** The switch looks up the corresponding output port and **forwards** the frame *only* to that specific port.
    - **If `Y` is NOT in the switch table:** The switch has no choice but to **flood** the frame—it sends a copy out of all ports except the one it arrived on.
    - **If `Y`'s entry points back to the arrival port:** This means the destination is on the same LAN segment as the source. The switch **filters** (discards) the frame, as no forwarding is needed.

- **Benefits of Switches:**
    - **Collision Elimination:** By isolating traffic and forwarding frames only where they need to go, switches create separate collision domains on each port. This dramatically improves LAN performance over hubs.
    - **Parallel Communication:** A switch can forward multiple frames between different pairs of ports simultaneously, as long as they don't contend for the same output port.

---

## Exam Focus
- **2-Mark Questions:**
    - What is the difference between an IP address and a MAC address?
    - What is the purpose of the Address Resolution Protocol (ARP)?
    - Is an ARP query sent as a broadcast or unicast frame? (Broadcast).
    - How does a link-layer switch build its forwarding table? (By inspecting the source MAC address of incoming frames).
- **10-Mark Question:**
    - "Suppose a host A on a LAN wants to send a datagram to host B on the same LAN. Explain the complete process, including the roles of DNS, ARP, and a link-layer switch."
        - **Tip:** This is a synthesis question. 1) A starts with a hostname, uses DNS to get B's IP. 2) A needs B's MAC, so it sends a broadcast ARP query. 3) B sends a unicast ARP reply. 4) A sends its datagram in a frame addressed to B's MAC. 5) The switch receives the frame, learns A's location, and forwards the frame to the correct port for B.
