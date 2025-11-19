---
title: "Extras: Pipelined RDT, NAT, and DHCP"
id: extras-1
tags: [rdt, sliding-window, go-back-n, selective-repeat, nat, dhcp]
aliases: [Pipelined RDT, GBN, SR]
---

# Extras: Deeper Dives into Important Concepts

This note expands on several important concepts that were introduced in earlier topics, providing the detail needed for a complete understanding.

---

## 1. Pipelined Reliable Data Transfer

In our study of RDT, we built `rdt3.0`, a "stop-and-wait" protocol. The sender sends one packet, stops, and waits for the ACK. This is safe but dramatically underutilizes the channel capacity.

The solution is **pipelining**. The sender is allowed to have multiple, "in-flight," unacknowledged packets in the pipeline at once. This is managed using a **sliding window** of sequence numbers.

There are two main protocols that implement pipelining: **Go-Back-N (GBN)** and **Selective Repeat (SR)**.

### a. Go-Back-N (GBN)
GBN is the simpler of the two pipelined protocols.
- **Sender:** Can have up to `N` unacknowledged packets in the pipeline. It maintains a *single timer* for the oldest unacknowledged packet.
- **Receiver:** The receiver logic is very simple. It only accepts packets that arrive in perfect order. It maintains an `expected_seq_num`.
    - If a packet with `expected_seq_num` arrives and is not corrupt, the receiver sends a **cumulative acknowledgment (ACK)** for that sequence number and passes the data up.
    - If a packet arrives with any other sequence number (i.e., out of order), the receiver **discards it** and re-sends the ACK for the last correctly received in-order packet.
- **Handling Loss:** If packet `k` is lost, the receiver will discard all subsequent packets (`k+1`, `k+2`, etc.) because they are out of order. The sender's timer for packet `k` will eventually expire. The sender then **goes back** and retransmits packet `k` and *all subsequent packets* that were in the pipeline (`k+1`, `k+2`, etc.).

### b. Selective Repeat (SR)
SR is more efficient but more complex than GBN.
- **Sender:** Can have up to `N` unacknowledged packets in the pipeline. It maintains a *separate logical timer for each packet*.
- **Receiver:** The receiver logic is more complex. It acknowledges every single correctly received packet, regardless of order. It **buffers out-of-order packets** until the missing ones arrive.
- **Handling Loss:** If packet `k` is lost, the receiver will notice a gap. It will receive and buffer packets `k+1`, `k+2`, etc., sending individual ACKs for each one. The sender's timer for *only packet `k`* will expire. The sender then **selectively retransmits** only the single lost packet, `k`. When the receiver gets the retransmitted packet `k`, it can now deliver the buffered sequence of packets (`k`, `k+1`, `k+2`, etc.) to the application layer in order.

> [!summary] **GBN vs. SR**
> - GBN is simple for the receiver but can be wasteful, as it retransmits many correct packets after a single loss.
> - SR is much more efficient, as it only retransmits what was actually lost, but it requires more complexity and buffer space at the receiver.
> - TCP's reliability mechanism is a hybrid, best described as a GBN-style protocol with optimizations (like fast retransmit) that make it behave like SR in many common loss scenarios.

---

## 2. NAT (Network Address Translation)

- **Purpose (Recap):** To allow multiple devices in a private network (using private IP address ranges like `192.168.0.0/16`) to share a single, globally unique public IP address.
- **How it Works:** The NAT-enabled router maintains a **NAT translation table**.
    1.  A host on the private network (e.g., `192.168.1.10`) sends a packet to a public web server. The packet has `(source_ip=192.168.1.10, source_port=3345)`.
    2.  The NAT router intercepts this packet. It replaces the source IP with its own public IP address (`public_ip`) and replaces the source port with a new, unique port number (`new_port`, e.g., 51000).
    3.  The router records this mapping in its translation table: `(192.168.1.10, 3345) <-> (public_ip, 51000)`.
    4.  The modified packet is sent to the web server.
    5.  When the web server replies, it sends the reply to the destination `(public_ip, 51000)`.
    6.  The NAT router receives this reply, looks up `(public_ip, 51000)` in its table, finds the corresponding private mapping `(192.168.1.10, 3345)`, rewrites the destination IP and port, and forwards the packet to the correct host on the private network.

---

## 3. DHCP (Dynamic Host Configuration Protocol)

- **Purpose (Recap):** To automate the configuration of hosts joining a network. A host can get its IP address, subnet mask, default router address, and local DNS server address.
- **How it Works (DORA):** The four-step process is nicknamed DORA.
    1.  **Discover:** A newly connected host doesn't have an IP address, so it can't send a normal unicast packet. It broadcasts a **DHCP Discover** message to the LAN (destination IP `255.255.255.255`). This message asks, "Are there any DHCP servers out there?"
    2.  **Offer:** Any DHCP server on the LAN that receives the discover message replies with a **DHCP Offer** message. This message contains a proposed IP address and other configuration details. This offer is also typically broadcast.
    3.  **Request:** The client receives one or more offers. It chooses one and broadcasts a **DHCP Request** message that indicates which server's offer it is accepting. This broadcast informs the other DHCP servers that their offers were declined.
    4.  **Acknowledge (ACK):** The chosen DHCP server sends a final **DHCP Acknowledge** message to confirm the IP address lease. The client can now use the IP address.
