---
title: "Unit 4: Virtual Circuit and Datagram Networks"
id: unit4-topic2
tags: [unit4, network-layer, datagram-networks, virtual-circuits]
aliases: [VC Networks, Datagram Networks]
---

# Unit 4, Topic 2: Virtual Circuit and Datagram Networks

The network layer's data plane can be implemented in one of two fundamental ways: as a **datagram network** or as a **virtual-circuit (VC) network**. These two models represent a core architectural choice, with the Internet choosing the datagram model.

---

## 1. Datagram Networks

This is the model used by the Internet's network layer (the IP protocol).

- **Connectionless Service:** There is no connection setup phase. A host can send a packet to a destination at any time.
- **Independent Packet Forwarding:** Each packet contains the full destination address. Routers use this full address to make an independent forwarding decision for every single packet.
- **No Path Guarantee:** Because each packet is routed independently, two packets sent from the same source to the same destination may travel along different paths, especially if the network state or routing tables change. This can lead to packets arriving out of order.
- **Stateless Routers:** The routers do not maintain any state information about end-to-end connections. This keeps the router design simple and robust. If a router fails, it doesn't lose any critical connection information, as there is none to lose.

> [!analogy] A datagram network is like the **postal service**. Each letter has the full destination address written on it, and each post office along the way makes an independent decision on how to route it. Your first letter might go through Chicago, while your second might go through Atlanta.

---

## 2. Virtual-Circuit (VC) Networks

This model is inspired by traditional telephone networks. While not used by the Internet's IP layer, protocols like ATM and MPLS use principles from the VC model.

- **Connection-Oriented Service:** A connection setup phase is **required**. Before data can flow, a path from source to destination, called a **virtual circuit (VC)**, must be established.
- **VC Identifier (VCI):** Each packet does not carry the full destination address. Instead, it carries a small number called a **VC identifier (VCI)**.
- **Stateful Routers:** Each router on the path must maintain state for every VC that passes through it. Its forwarding table maps an incoming VCI on a specific link to an outgoing link and a *new* VCI for that next link.
- **Phases of a VC:**
    1.  **VC Setup:** The source host sends a setup request. Routers along the path allocate a VCI for the connection, create an entry in their forwarding tables, and forward the request.
    2.  **Data Transfer:** Packets containing the VCI are forwarded along the pre-established path.
    3.  **VC Teardown:** When the connection is closed, teardown messages are sent to remove the VC state from the routers.

> [!analogy] A VC network is like making a **phone call**. You dial the full number once to establish the connection. Once the call is set up, the network remembers the path. You don't need to re-dial the number for every word you speak. The "connection" is the virtual circuit.

---

## 3. Comparison of Datagram vs. VC Networks

| Feature | Datagram Network (e.g., Internet IP) | Virtual-Circuit Network (e.g., ATM, MPLS) |
|---|---|---|
| **Service** | Connectionless | Connection-Oriented |
| **Addressing**| Each packet has the full destination address. | Each packet has a small VC identifier (VCI). |
| **State** | Routers are **stateless** regarding connections. | Routers are **stateful**; they maintain per-VC state. |
| **Path** | Packets may take different paths. | All packets in a VC follow the same pre-established path. |
| **Setup** | None required. | Required (VC setup). |
| **Complexity**| Pushed to the "edge" (end systems). | Resides in the network "core" (routers). |
| **Robustness**| More robust to router failures. | A router failure can disrupt all VCs passing through it. |

---

## Exam Focus
- **2-Mark Questions:**
    - What is the key difference between a datagram network and a VC network? (Connectionless vs. Connection-oriented).
    - Do routers in a datagram network maintain connection state? (No).
- **10-Mark Question:**
    - "Compare and contrast datagram networks and virtual-circuit networks. For each, describe how packets are addressed and forwarded, and discuss the role of state in the routers. Mention which model the Internet uses."
        - **Tip:** A table like the one above is an excellent way to structure your answer. For datagram networks, emphasize the full destination address and stateless routers. For VC networks, emphasize the VCI, the connection setup phase, and stateful routers.
