---
title: "Unit 2: Peer-to-Peer Applications"
id: unit2-topic6
tags: [unit2, application-layer, p2p, bittorrent, dht]
aliases: [P2P, BitTorrent]
---

# Unit 2, Topic 6: Peer-to-Peer Applications

We previously introduced the Peer-to-Peer (P2P) architecture as an alternative to the client-server model. Now, we will explore P2P applications in more detail, focusing on their primary use case: large-scale file distribution.

---

## 1. The Scalability Challenge of Client-Server File Distribution

In a **client-server model**, a central server must serve a file to every single user. The server's upload bandwidth is a bottleneck, and performance degrades as more users join. The time to distribute the file to `N` users increases linearly with `N`.

---

## 2. The P2P Scalability Solution

In a **P2P model**, the architecture is decentralized. Every peer that downloads a chunk of the file can immediately start uploading that chunk to other peers.
- **Self-Scalability:** As more peers join, the *total upload capacity of the entire system* also increases. The system's performance does not degrade with popularity; in many cases, it improves!

> [!note] The key insight of P2P file distribution is that each peer is not just a consumer of bandwidth but also a potential provider.

---

## 3. BitTorrent: A P2P Protocol in Action

BitTorrent is the most popular protocol for P2P file distribution.

### a. Key Terminology
- **Torrent:** The collection of all peers participating in the distribution of a particular file.
- **Tracker:** A server that keeps track of the peers currently in the torrent. **The tracker does not have a copy of the file.**
- **Chunks:** The file is divided into many equal-sized pieces (e.g., 256 KB). Peers download and upload these individual chunks.

### b. The "Tit-for-Tat" Incentive Mechanism
To encourage cooperation, BitTorrent uses a "tit-for-tat" policy. A peer gives priority to uploading to other peers who are currently providing data to it at the highest rate. This rewards cooperation and punishes "free-riders".

### c. Trackerless Torrents: Distributed Hash Tables (DHTs)
A weakness of the original BitTorrent design is its reliance on a central tracker, which is a single point of failure. Modern torrents are often "trackerless," using a **Distributed Hash Table (DHT)** instead.
- **What it is:** In a DHT, the job of the tracker is distributed among the peers themselves. Each peer becomes responsible for storing a small piece of the routing information (i.e., the IP addresses of other peers).
- **How it works:** When a new peer joins, it can contact *any* existing peer in the torrent. Using the DHT, it can then query the distributed system to find the addresses of other peers who have the chunks it needs, all without relying on a central server. This makes the system far more robust.

---

## 4. Beyond File Sharing: Other P2P Applications
- **Cryptocurrencies (e.g., Bitcoin, Ethereum):** The entire ledger of transactions (the blockchain) is maintained by a P2P network of nodes. There is no central bank or server.
- **VoIP and Video Conferencing:** Early versions of Skype were heavily P2P, routing calls directly between users to reduce infrastructure costs.
- **P2P Streaming:** Instead of downloading a file, peers stream chunks of live video to each other, reducing the load on the source server for live events.

---

## 5. Client-Server vs. P2P Summary

| Feature | Client-Server | Peer-to-Peer (P2P) |
|---|---|---|
| **Scalability** | Poor. Performance degrades with more clients. | Excellent. Self-scaling. |
| **Architecture** | Centralized. | Decentralized. |
| **Cost** | High for the server owner (bandwidth costs). | Low for the content provider. |
| **Reliability** | Depends on a single server (single point of failure). | More robust; failure of one peer has little impact.|
| **Management** | Simple, centralized control. | Complex, relies on peer cooperation. |

---

## Exam Focus
- **2-Mark Questions:**
    - What is the primary scalability advantage of P2P over client-server for file distribution? (Self-scalability; system capacity grows with more peers).
    - What is a DHT, and what problem does it solve in BitTorrent? (A distributed hash table; it removes the need for a central tracker, which is a single point of failure).
    - What is the "tit-for-tat" policy in BitTorrent? (Prioritizing uploads to peers who are also uploading to you).
- **10-Mark Question:**
    - "Compare the scalability of P2P and client-server architectures for large-scale file distribution. Using BitTorrent as an example, explain how a P2P system works and how it incentivizes cooperation."
        - **Tip:** Start by explaining the linear scaling problem of the client-server model. Then explain how P2P's self-scalability solves this. Describe the role of trackers and chunks in BitTorrent, and finish by explaining the tit-for-tat mechanism. An advanced answer would also mention the evolution to trackerless systems using DHTs.
