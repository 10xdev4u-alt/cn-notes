---
title: "Unit 3: Network-Assisted Congestion Control"
id: unit3-topic7
tags: [unit3, transport-layer, congestion-control, ecn]
aliases: [Network-Assisted Congestion Control, ECN]
---

# Unit 3, Topic 7: Network-Assisted Congestion Control

In our last topic, we studied TCP's end-to-end congestion control, where the sender infers congestion from packet loss. This is an effective but *reactive* approach—the sender only finds out about congestion *after* it has already happened (i.e., a packet has been dropped).

An alternative is **network-assisted congestion control**, where network routers provide explicit feedback to the sender about the state of congestion.

---

## 1. Forms of Network Feedback

There are two main ways a router can signal congestion to a sender:

1.  **Direct Feedback:** A congested router sends a "choke packet" or a source-quench message directly to the sender. This is not used in TCP/IP networks today as it adds complexity and potential security issues.

2.  **Indirect Feedback (Packet Marking):** A congested router marks a field in a data packet that is already traveling from sender to receiver. The receiver, upon getting the marked packet, echoes this congestion signal back to the sender in its acknowledgment packets. This is the more modern and widely adopted approach.

---

## 2. ECN (Explicit Congestion Notification)

**ECN** is the specific implementation of network-assisted congestion control for IP and TCP. It allows a router to signal impending congestion *without* dropping packets.

#### How ECN Works
ECN utilizes two bits in the IP header (in the old Type of Service field). These two bits can have four values:
- `00`: The transport is not ECN-capable.
- `10`: The transport is ECN-Capable (ECT).
- `01`: Also ECN-Capable (ECT). Having two codepoints provides an extra signal, but that's an advanced topic.
- `11`: Congestion Experienced (CE).

The end-to-end process is as follows:

```ascii
Sender                      Router                     Receiver
  |                           |                          |
  | -- IP Packet [ECN=10] --> |                          |  (1) Sender marks packet as ECN-Capable.
  |                           |                          |
  |                           | -- Congestion Occurs --  |
  |                           | (Router marks packet)    |
  |                           |                          |
  | -- IP Packet [ECN=11] --> | -- IP Packet [ECN=11] -->|  (2) Router changes ECN field to '11' (CE).
  |                           |                          |
  |                           |                          |  (3) Receiver gets packet with CE mark.
  |                           |                          |
  | <-- TCP ACK [ECE=1] ----- | <-- TCP ACK [ECE=1] ---- |  (4) Receiver sets ECE flag in its next ACK.
  |                           |                          |
  |                           |                          |
  | (5) Sender receives ACK   |                          |
  |     with ECE flag and     |                          |
  |     reduces its cwnd.     |                          |
```
1.  An ECN-aware sender marks its outgoing packets with the ECN-Capable Transport (ECT) codepoint (`10`).
2.  A router on the path is becoming congested. Instead of dropping the packet, it sees the ECT mark and changes the codepoint to Congestion Experienced (CE) (`11`). It then forwards the packet.
3.  The receiver gets the packet with the CE mark.
4.  The receiver then sets a special flag in its next returning TCP ACK header, the **ECE (ECN-Echo)** flag.
5.  The original sender receives this ACK with the ECE flag set. It now knows that congestion was encountered somewhere on the path. It reacts just as it would to a triple duplicate ACK: it halves its congestion window (`cwnd`) but does not re-enter slow start.

---

## 3. Advantages of ECN

- **Proactive Response:** ECN allows the sender to react to congestion *before* packet loss occurs. This is far better than the reactive approach of waiting for a timeout or triple duplicate ACK, which only happen after a packet is already lost.
- **Higher Throughput & Lower Delay:** By avoiding unnecessary packet drops and retransmissions, ECN can lead to higher goodput (useful throughput) and lower end-to-end latency, especially in networks that are prone to light or moderate congestion.

> [!summary] In essence, ECN allows the network to say, "I'm getting full!" instead of just dropping packets without warning. This early warning enables TCP to be a better, more efficient network citizen.

---

## Exam Focus

- **2-Mark Questions:**
    - What is the difference between network-assisted and end-to-end congestion control?
    - What does ECN stand for, and what is its primary purpose? (Explicit Congestion Notification; to signal congestion without dropping packets).
    - How does a sender learn that congestion was experienced on a path when using ECN? (The receiver sets the ECE flag on the return ACK).
- **10-Mark Question:**
    - "Explain the mechanism of Explicit Congestion Notification (ECN) as a form of network-assisted congestion control. Describe the full lifecycle of a packet from sender to receiver and back, detailing how the congestion signal is initiated by a router and communicated back to the sender."
        - **Tip:** Use a diagram showing the sender, router, and receiver. Show the ECN bits in the IP header changing from `10` to `11` at the router. Then show the `ECE` flag being set in the TCP header of the returning ACK. Crucially, explain that the sender's reaction is to reduce its `cwnd` as if a minor loss had occurred, thus avoiding the loss in the first place.
