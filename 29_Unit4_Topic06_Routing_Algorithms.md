---
title: "Unit 4: Routing Algorithms"
id: unit4-topic6
tags: [unit4, network-layer, routing, control-plane, link-state, distance-vector]
aliases: [Routing Algorithms, LS, DV]
---

# Unit 4, Topic 6: Routing Algorithms

We've established that routing is the control-plane process of determining the best paths for packets to take through a network. This is achieved using **routing algorithms**. The goal of a routing algorithm is to find the "least-cost" path from a source to a destination, where the cost of a path is the sum of the costs of the links along that path.

Routing algorithms can be classified in several ways, but the most important distinction is between **Link-State (LS)** and **Distance-Vector (DV)** algorithms.

---

## 1. The Link-State (LS) Routing Algorithm

- **Core Idea:** Every router has a complete and identical map of the entire network topology and all link costs. It acts with global knowledge.

- **How it Works:**
    1.  **Share Information:** Every router discovers the identity of its direct neighbors and the cost of the links to them. It then broadcasts this information in a **link-state packet** to *all other routers* in the network.
    2.  **Build the Map:** By collecting the link-state packets from all other routers, every router in the network is able to construct an identical, complete map of the network topology.
    3.  **Compute Paths:** Each router then independently runs a shortest-path algorithm on its local copy of this map to calculate the least-cost path from itself to every other router. The standard algorithm used for this is **Dijkstra's algorithm**.
    4.  **Populate Forwarding Table:** The results of Dijkstra's algorithm are used to create the entries in the router's forwarding table (e.g., "To reach destination X, send the packet out of interface Y").

- **Analogy:** LS routing is like giving every driver a complete, up-to-the-minute GPS map of the entire road network. Every driver can then independently calculate their own best route from where they are to their destination.

- **Example Protocol:** **OSPF (Open Shortest Path First)** is a widely used LS protocol.

---

## 2. The Distance-Vector (DV) Routing Algorithm

- **Core Idea:** This is a decentralized, iterative approach. No router has a complete map. A router only knows the cost to its direct neighbors and learns about the rest of the network through a process of "gossip" with those neighbors.

- **How it Works:**
    1.  **Maintain a Vector:** Each router maintains its own **distance vector**, which contains its current estimate of the least cost to every other destination in the network.
    2.  **Share with Neighbors:** Periodically, each router sends its distance vector to its direct neighbors.
    3.  **Update Local Vector:** When a router receives a distance vector from a neighbor, it updates its own vector using the **Bellman-Ford equation**. For each destination `X`, the router calculates: `MyCost(to X) = min_over_neighbors_v [Cost(to neighbor v) + v's_advertised_Cost(to X)]`
    - In plain English: "My best path to get to X is by going through the neighbor who offers the cheapest total trip."
    4.  This process repeats. Over time, the routers exchange information and their distance vectors converge to the true least-cost paths.

- **Analogy:** DV routing is like navigating by following road signs. You don't have a map. At each intersection (router), you look at the signs (information from neighbors) which tell you the distance to various cities. You choose the road that seems to be the best next step towards your destination.

- **Example Protocol:** **RIP (Routing Information Protocol)** is a classic DV protocol.

- **Problem: The "Count-to-Infinity" Problem.** DV algorithms can be slow to converge after a link failure. If a link goes down, the "bad news" propagates slowly through the network, which can lead to temporary routing loops. Mechanisms like "poisoned reverse" are used to mitigate this.

---

## 3. Comparison: Link-State vs. Distance-Vector

| Feature | Link-State (LS) | Distance-Vector (DV) |
|---|---|---|
| **Network Knowledge** | Global: Each router knows the entire topology. | Local: Each router only knows about its neighbors. |
| **Information Shared** | Broadcasts its link state to **all** other routers. | Shares its distance vector only with its **neighbors**. |
| **Complexity** | Higher computational complexity (runs Dijkstra's). | Simpler Bellman-Ford calculations. |
| **Convergence** | Faster and more robust. A single incorrect calculation only affects one router's table. | Slower to converge. Can suffer from routing loops and the count-to-infinity problem. |
| **Message Size** | Messages are small but are sent to all routers. | Messages can be large (entire DV) but are only sent to neighbors. |

---

## Exam Focus

- **2-Mark Questions:**
    - What are the two main classes of intra-domain routing algorithms? (Link-State and Distance-Vector).
    - What is the difference in network knowledge between an LS and a DV router? (Global vs. Local).
- **10-Mark Question:**
    - "Compare and contrast the Link-State and Distance-Vector routing algorithms. For each, explain its core idea, how information is shared between routers, and name an example protocol."
        - **Tip:** A comparison table is an excellent way to structure this answer. Emphasize the core difference: LS gives every router a full map to compute its own routes, while DV involves routers sharing their routing tables with their immediate neighbors in an iterative process.
