---
title: "Unit 4: Routing in the Internet"
id: unit4-topic7
tags: [unit4, network-layer, routing, control-plane, autonomous-systems, igp, egp, ospf, bgp]
aliases: [Internet Routing, AS, BGP, OSPF]
---

# Unit 4, Topic 7: Routing in the Internet

The routing algorithms we just studied, Link-State and Distance-Vector, describe the logic for finding least-cost paths. But the sheer scale of the Internet (billions of hosts) makes it impossible for every router to know about every other router. To manage this scale, the Internet is organized into a hierarchy of **Autonomous Systems (AS)**.

---

## 1. Autonomous Systems (AS)

> [!note] Definition: An **Autonomous System (AS)** is a large network, or a collection of networks, that is under a single administrative domain. Think of an AS as a large ISP (e.g., Comcast, AT&T), a university campus network, or a large company network (e.g., Google, Microsoft).

Each AS is assigned a globally unique **Autonomous System Number (ASN)**. Grouping the Internet into ASes allows us to split the massive problem of global routing into two more manageable parts.

---

## 2. Intra-AS vs. Inter-AS Routing

Routing in the Internet is a two-level process:

1.  **Intra-AS Routing (Interior Gateway Protocol - IGP):**
    - **Scope:** This is the routing that happens *within* a single Autonomous System.
    - **Goal:** To find the best path between routers *inside* the same AS. Since the entire network is under one administrator, the focus is purely on performance (finding the true least-cost path).
    - **Choice:** The administrator of an AS is free to choose any IGP they want.
    - **Example Protocols:** **OSPF** (a Link-State protocol) and **RIP** (a Distance-Vector protocol) are common IGPs.

2.  **Inter-AS Routing (Exterior Gateway Protocol - EGP):**
    - **Scope:** This is the routing that happens *between* different Autonomous Systems.
    - **Goal:** To find the best path among the different ASes. This is more complex than just finding the shortest path; it is heavily driven by **policy**. For example, one ISP might not want to carry traffic for a rival ISP, even if it's the "shortest" route.
    - **The Standard:** There is only one de-facto standard EGP used on the Internet: **BGP (Border Gateway Protocol)**.

---

## 3. OSPF (Open Shortest Path First)

- **Type:** The most widely used **Intra-AS (IGP)** protocol in large corporate and university networks.
- **Algorithm:** It is a **Link-State** protocol. Every router running OSPF constructs a complete topological map of its AS and then runs Dijkstra's algorithm to compute the shortest path to all other routers in the AS.
- **Features:** OSPF is a mature protocol that includes features like authentication for routing messages, the ability to load-balance traffic over multiple equal-cost paths, and a hierarchical structure to partition a very large AS into smaller "areas."

---

## 4. BGP (Border Gateway Protocol)

- **Type:** The one and only **Inter-AS (EGP)** protocol of the global Internet. BGP is the glue that holds the entire Internet together.
- **Algorithm:** BGP is a **Path Vector Protocol**. It has similarities to Distance-Vector, but with a critical difference: instead of advertising just a distance (cost), a BGP router advertises the entire *path* of ASNs it knows about to reach a destination prefix.
    - **Example Advertisement:** A router in AS1 might say to its neighbor in AS2: "I can reach the network `130.207.0.0/16` via the path `AS1, AS3, AS4`."
- **Loop Prevention:** Path vectors provide a very simple and effective way to prevent routing loops. If an AS receives a path advertisement that already contains its own ASN, it knows this path represents a loop and immediately discards it.
- **Policy over Performance:** BGP's primary role is to enforce policy. An AS can use BGP to control:
    - Which routes it advertises to its neighbors (e.g., "Don't tell my rival ISP that they can use my network to reach Google").
    - Which routes it accepts from its neighbors (e.g., "I will not accept any path that goes through country X").

### Putting It All Together
When you send a packet from your university (AS1) to a server at Google (AS2):
1.  Your packet travels within AS1, with its path determined by the IGP (e.g., OSPF).
2.  OSPF gets the packet to the correct **gateway router** at the edge of AS1.
3.  This gateway router has learned from BGP that the path to AS2 is through a specific neighboring AS. It forwards the packet to that neighbor.
4.  This continues, with BGP handling the inter-AS hops and each AS's internal IGP handling the intra-AS hops, until the packet reaches AS2.
5.  Once inside AS2, the packet is forwarded to the final destination server using AS2's internal IGP.

---

## Exam Focus
- **2-Mark Questions:**
    - What is an Autonomous System (AS)?
    - What is the difference between an IGP and an EGP?
- **10-Mark Question:**
    - "Explain the difference between Intra-AS and Inter-AS routing. For each category, name a prominent routing protocol, describe its underlying algorithm type (LS, DV, or Path Vector), and state its primary goal."
        - **Tip:** For Intra-AS, name OSPF, identify it as Link-State, and state its goal is performance. For Inter-AS, name BGP, identify it as Path Vector, and state its goal is enforcing policy while providing reachability. Explaining how BGP prevents loops is a key detail.
