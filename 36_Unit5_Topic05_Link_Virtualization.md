---
title: "Unit 5: Link Virtualization: A Network as a Link Layer"
id: unit5-topic5
tags: [unit5, link-layer, virtualization, vlan, mpls]
aliases: [VLANs, Link Virtualization]
---

# Unit 5, Topic 5: Link Virtualization: A Network as a Link Layer

So far, we have treated a "link" as a single connection between two nodes. However, a powerful concept in networking is **link virtualization**, where a large, complex network of many switches and routers can be made to appear as a single, simple link to the outside world.

The most common and important example of this in Local Area Networks is the **Virtual LAN (VLAN)**.

---

## 1. The Problem with a Single, Large LAN

Imagine a large company with multiple departments (e.g., Engineering, Sales, HR) all connected to the same physical set of switches. This single, large LAN has several problems:

- **Lack of Isolation:** Broadcast traffic, such as ARP queries, from a computer in one department is flooded to *every single host* in the entire company. This creates unnecessary traffic.
- **Poor Security:** Any user could potentially run a packet sniffer and eavesdrop on traffic from other departments.
- **Inflexible Management:** If an employee moves from the Sales department to the Engineering department, a network administrator might need to physically re-cable their office port to a different switch.

---

## 2. Virtual LANs (VLANs)

VLANs solve these problems by allowing a single physical LAN infrastructure to be partitioned into multiple logical, or **virtual**, LANs.

> [!note] Definition: A **VLAN** is a configuration on a switch (or set of switches) that creates multiple, isolated broadcast domains. Each VLAN behaves as if it were its own separate physical LAN.

#### How VLANs Work

1.  **Port-Based VLANs:** The most common configuration. A network administrator assigns each port on a switch to a specific VLAN. For example, ports 1-8 could be assigned to VLAN 10 (Engineering), and ports 9-16 could be assigned to VLAN 20 (Sales).

2.  **Traffic Isolation:** The switch internally enforces strict isolation between these VLANs.
    - A broadcast frame arriving on a VLAN 10 port will **only** be forwarded to other ports that are also part of VLAN 10.
    - It will **never** be forwarded to a port belonging to VLAN 20.

3.  **VLAN Trunks (802.1Q):** How do you connect multiple switches and maintain the VLAN separation?
    - A special link called a **trunk** is configured between the switches.
    - When a frame is sent over a trunk link, a special **VLAN tag** is added to its header. This tag, specified by the **IEEE 802.1Q standard**, contains the VLAN ID (e.g., 10 or 20).
    - When the receiving switch gets the tagged frame, it reads the VLAN ID and knows which VLAN the frame belongs to, so it can continue to enforce the isolation rules.

#### Benefits of VLANs
- **Traffic Management:** Broadcast traffic is contained within its VLAN, improving overall network performance.
- **Enhanced Security:** Departments are isolated from one another at the link layer.
- **Flexibility:** Moving a user to a different department is now a simple software configuration change on their switch port, with no physical re-cabling required.

> [!important] To route traffic *between* two different VLANs (e.g., for a user in Sales to access a server in Engineering), a **router** is still required. The router would have a connection to both VLAN 10 and VLAN 20 and would make a layer-3 forwarding decision.

---

## 3. MPLS (Multiprotocol Label Switching)

MPLS is a more advanced link virtualization technology used by ISPs in their large-scale core networks.

- **Core Idea:** Instead of forwarding packets based on their destination IP address, MPLS routers forward packets based on a short, fixed-length **label**.
- **How it Works:** When a packet enters an MPLS network, an ingress router assigns it a label and forwards it. At each subsequent hop, the MPLS router uses this label to do a very fast lookup, "swaps" the incoming label for an outgoing label, and forwards the packet to the next hop.
- **The "Virtual Link":** This process creates a **Label-Switched Path (LSP)** through the network, which acts like a virtual circuit. To the outside world, the entire complex MPLS network can be made to look like a single, fast link between two points. This allows ISPs to perform sophisticated traffic engineering and provide Quality of Service (QoS) guarantees.

---

## Exam Focus
- **2-Mark Questions:**
    - What is a VLAN?
    - List two benefits of using VLANs. (Traffic isolation/management, security, flexibility).
    - What is the purpose of an 802.1Q tag? (To identify which VLAN a frame belongs to when it crosses a trunk link between switches).
- **10-Mark Question:**
    - "Explain the problems associated with a single large broadcast domain in a LAN. Describe how VLANs solve these problems, including the concepts of port-based assignment and trunking."
        - **Tip:** Start by describing the issues of broadcast storms and lack of security/flexibility. Then explain that VLANs create separate logical LANs on the same physical hardware. Describe how ports are assigned to a VLAN and how 802.1Q tags are used on trunk links to carry traffic for multiple VLANs between switches.
