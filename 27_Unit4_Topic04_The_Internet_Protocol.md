---
title: "Unit 4: The Internet Protocol (IP)"
id: unit4-topic4
tags: [unit4, network-layer, ip, ipv4, ipv6, addressing, fragmentation]
aliases: [IP, IPv4, IPv6]
---

# Unit 4, Topic 4: The Internet Protocol (IP)

The Internet Protocol (IP) is the heart of the network layer. It defines the structure of the datagrams that are sent between hosts and provides the addressing scheme that allows every host on the global Internet to have a unique identifier.

---

## 1. The IPv4 Datagram Format

The IPv4 datagram is the fundamental packet of the Internet. Its header contains all the information necessary for routers to forward it towards its destination.

```ascii
 0                   15 16                  31
+--------------------+--------------------+
| Version | Hdr Len  |  Type of Service   | Datagram Length
+--------------------+--------------------+------------------+
|      Identifier      | Flags | Fragment Offset           |
+--------------------+--------------------+------------------+
|  Time-to-Live (TTL)|    Protocol        |  Header Checksum |
+--------------------+--------------------+------------------+
|                    Source IP Address                      |
+-----------------------------------------------------------+
|                  Destination IP Address                   |
+-----------------------------------------------------------+
|                    Options (if any) ...                   |
+-----------------------------------------------------------+
|                          Data                             |
+-----------------------------------------------------------+
```
### Key IPv4 Header Fields
- **Version (4 bits):** Set to 4 for IPv4.
- **Header Length (4 bits):** The length of the IP header in 32-bit words. Usually 5 (for a 20-byte header).
- **Datagram Length (16 bits):** The total length of the IP datagram (header + data) in bytes.
- **Identifier, Flags, Fragment Offset (32 bits total):** These three fields are used for **IP fragmentation**, which we'll discuss below.
- **Time-to-Live (TTL) (8 bits):** Decremented by one at every router. If it reaches 0, the packet is discarded. This prevents packets from looping forever in the network.
- **Protocol (8 bits):** Specifies the transport-layer protocol to hand the data to at the destination. `6` = TCP, `17` = UDP.
- **Header Checksum (16 bits):** A checksum calculated over the IP header only. It is recomputed at every router because the TTL field changes.
- **Source and Destination IP Addresses (32 bits each):** The globally unique 32-bit addresses of the sending and receiving hosts.

---

## 2. IPv4 Addressing and Subnets

An IP address is a 32-bit number that uniquely identifies a host's network interface. It is composed of two parts: a **network part** and a **host part**.

- **Subnet:** A group of hosts whose interfaces share the same network part of their IP address. Devices within the same subnet can reach each other directly without going through a router.
- **Subnet Mask:** A 32-bit number that defines the boundary between the network and host parts. It can be written in CIDR (Classless Inter-Domain Routing) notation (e.g., `/24`) or dotted-decimal notation (e.g., `255.255.255.0`). A `/24` mask means the first 24 bits are the network part, and the remaining 8 bits are the host part.

> **Example:** For the address `192.168.1.100` with a `/24` subnet mask:
> - **Network Part:** `192.168.1`
> - **Host Part:** `100`
> This host can directly communicate with any other host in the `192.168.1.0 /24` subnet. To communicate with any other address, it must send the packet to its **default router**.

- **DHCP (Dynamic Host Configuration Protocol):** Most user devices get their IP address, subnet mask, default router address, and local DNS server address automatically from a DHCP server when they join a network.
- **NAT (Network Address Translation):** A technology that allows multiple devices in a private network (e.g., using addresses like `192.168.1.x`) to share a single, globally unique public IP address. This was a crucial short-term solution to the problem of IPv4 address exhaustion.

---

## 3. IP Fragmentation and Reassembly

- **The Problem:** Different link-layer technologies have different **Maximum Transmission Unit (MTU)** sizes (e.g., Ethernet's MTU is 1500 bytes). What happens when a router receives a large datagram (e.g., 4000 bytes) that it needs to forward over a link with a smaller MTU?
- **The Solution:** The router **fragments** the large datagram into two or more smaller datagrams, called fragments.
- **The Mechanism:**
    - Each fragment is a separate IP datagram with its own header.
    - The `Identifier` field from the original datagram is copied into all fragments so the receiver knows they belong together.
    - The `Flags` field has a "more fragments" bit. This bit is set to 1 for all fragments except the last one.
    - The `Fragment Offset` field specifies where this fragment's data belongs in the original datagram's payload.
- **Reassembly:** Reassembly is done **only at the final destination host**. Routers do not reassemble fragments. The destination host uses the Identifier field to group the fragments and the Offset field to put them back in the correct order.

---

## 4. IPv6: The Next Generation

While IPv4 was a monumental success, its 32-bit address space was eventually exhausted. IPv6 was developed to solve this and to streamline the network layer.

### a. The IPv6 Datagram Format
The IPv6 header was redesigned for efficiency. It is a fixed 40 bytes long, which simplifies and speeds up router processing.

```ascii
 0                   15 16                  31
+--------------------+--------------------+
| Version | Traffic Class |  Flow Label      |
+--------------------+--------------------+------------------+
|      Payload Length      |  Next Header   |   Hop Limit    |
+--------------------+--------------------+------------------+
|                                                           |
+                                                           +
|                                                           |
+                         Source Address (128 bits)         +
|                                                           |
+                                                           +
|                                                           |
+-----------------------------------------------------------+
|                                                           |
+                                                           +
|                                                           |
+                      Destination Address (128 bits)       +
|                                                           |
+                                                           +
|                                                           |
+-----------------------------------------------------------+
```
#### Key IPv6 Header Fields
- **Version (4 bits):** Set to 6.
- **Traffic Class (8 bits):** Similar to the TOS field in IPv4, can be used to give priority to certain packets.
- **Flow Label (20 bits):** Can be used to "label" a sequence of packets belonging to a particular flow, which can help with Quality of Service (QoS).
- **Payload Length (16 bits):** The length of the data payload *only* (not including the base header).
- **Next Header (8 bits):** Identifies the protocol the data should be passed to (e.g., TCP, UDP) or the type of an optional "extension header".
- **Hop Limit (8 bits):** The equivalent of IPv4's TTL. It is decremented by one at each router, and the packet is dropped if it reaches 0.
- **Source and Destination Addresses (128 bits each):** The massive 128-bit addresses that are the primary feature of IPv6.

### b. Key Differences and Features
- **128-bit Address Space:** This is the most important feature, providing a virtually limitless number of IP addresses (2^128). IPv6 addresses are written in colon-hexadecimal format.

- **Simplified 40-byte Header:** The fixed-length header means routers can process it more quickly. Several IPv4 fields were removed:
    - **No Header Checksum:** The checksum was removed because transport-layer (TCP/UDP) and link-layer protocols already perform robust error checking, making the IP header checksum largely redundant and saving router processing time.
    - **No Options:** Options are handled via the "Next Header" field, which can point to optional **extension headers** that sit between the main header and the payload.

- **No In-Network Fragmentation:** IPv6 routers are **not allowed to fragment packets**. If a packet is too large for an outgoing link, the router drops it and sends an ICMPv6 "Packet Too Big" message back to the sender. This pushes the complex fragmentation logic entirely to the end hosts.

---

## Exam Focus
- **2-Mark Questions:**
    - What is the purpose of the TTL field in the IPv4 header?
    - What are the two parts of an IP address? (Network part and host part).
    - Where does reassembly of fragmented IP datagrams occur? (At the destination host).
- **10-Mark Question:**
    - "Draw the IPv4 datagram header and explain the function of the TTL, Protocol, and Fragmentation-related fields (Identifier, Flags, Offset). Then, explain the primary motivation for IPv6 and list three key differences between IPv4 and IPv6."
        - **Tip:** The header diagram is key. For the IPv6 differences, focus on: 1) 128-bit vs 32-bit addresses, 2) simplified fixed-length header in IPv6, and 3) no in-network fragmentation in IPv6.
