---
title: "Unit 3: Principles of Congestion Control"
id: unit3-topic6
tags: [unit3, transport-layer, tcp, congestion-control, aimd, slow-start]
aliases: [Congestion Control, TCP Congestion Control]
---

# Unit 3, Topic 6: Principles of Congestion Control

In our last topic, we discussed TCP's flow control, which prevents a sender from overwhelming a receiver. Now, we address a much broader problem: **congestion control**, which aims to prevent a sender (or many senders) from overwhelming the *network*.

---

## 1. The Problem of Congestion

**Congestion** occurs when the rate at which data arrives at a network router exceeds the router's outbound link capacity.

#### Causes and Consequences
- **Scenario:** Imagine a router with a 10 Mbps output link. If two senders each try to send data through it at 8 Mbps, the arrival rate (16 Mbps) is greater than the departure rate (10 Mbps).
- **Consequences:**
    1.  **Long Queuing Delays:** The router's internal buffers (queues) will fill up as packets wait for their turn on the outbound link.
    2.  **Packet Loss:** If the arrival rate stays high, the buffers will eventually overflow. When a packet arrives at a full buffer, the router has no choice but to **drop** it. This is packet loss.
    3.  **Wasted Retransmissions:** When a transport protocol like TCP detects this packet loss, it retransmits the packet. This adds even more traffic to an already congested network, potentially making the problem worse.

> [!important] **Flow Control vs. Congestion Control**
> This is a classic exam question.
> - **Flow Control** is a speed-matching service between a *single sender and a single receiver*. Its goal is to protect the **receiver's buffer**. The receiver tells the sender how much space it has (`rwnd`).
> - **Congestion Control** is a mechanism for a sender to regulate its sending rate to protect the **network's routers**. The network does not explicitly tell the sender how much space it has.

---

## 2. Approaches to Congestion Control

There are two general approaches:

1.  **Network-Assisted:** Routers provide explicit feedback to senders about the level of congestion. This can be a direct "choke packet" or by setting an **Explicit Congestion Notification (ECN)** bit in a packet's header.
2.  **End-to-End:** Routers provide no explicit feedback. The sending host infers the level of network congestion by observing network behavior, specifically by monitoring packet loss and delay. **This is the approach TCP uses.**

---

## 3. TCP Congestion Control: AIMD

TCP's congestion control strategy is an end-to-end, **Additive-Increase, Multiplicative-Decrease (AIMD)** algorithm. The sender maintains a state variable called the **Congestion Window (`cwnd`)**, which limits the amount of unacknowledged data it can have in flight.

The sender's actual sending window is `min(cwnd, rwnd)`.

The core idea is simple:
- **No observed loss?** Assume the network is not congested. Slowly increase the sending rate (increase `cwnd`). This is the **Additive Increase**.
- **Loss observed?** Assume the network is congested. Drastically cut the sending rate (decrease `cwnd`). This is the **Multiplicative Decrease**.

This strategy has three major phases: **Slow Start**, **Congestion Avoidance**, and **Fast Recovery**.

### a. Slow Start
- **Goal:** To quickly ramp up the sending rate at the beginning of a connection to find the available bandwidth.
- **Mechanism:** `cwnd` starts at 1 MSS (Maximum Segment Size). For every ACK received, `cwnd` is increased by 1 MSS.
- **Result:** The sending rate doubles approximately every RTT. This is an exponential increase, so it's not actually "slow," but it starts from a small value.
- **When does it end?** Slow Start continues until a loss event occurs OR until `cwnd` reaches a threshold value, `ssthresh` (slow start threshold).

### b. Congestion Avoidance
- **Goal:** Once the approximate available bandwidth is found, probe for more bandwidth cautiously.
- **Mechanism:** When `cwnd` is greater than `ssthresh`, TCP enters Congestion Avoidance. Here, `cwnd` increases by only 1 MSS per RTT (a linear increase).

### c. Congestion Detection and Reaction
TCP infers congestion from two types of loss events:

1.  **Loss indicated by a Timeout:**
    - This is seen as a major congestion event.
    - **Reaction:** `ssthresh` is set to `cwnd / 2`. `cwnd` is reset all the way back to **1 MSS**. TCP then re-enters the **Slow Start** phase.

2.  **Loss indicated by Triple Duplicate ACKs:**
    - This is seen as a minor congestion event.
    - **Reaction (Fast Recovery):** `ssthresh` is set to `cwnd / 2`. `cwnd` is also set to `cwnd / 2`. TCP then immediately enters the **Congestion Avoidance** phase, skipping the aggressive Slow Start. This is the "Multiplicative Decrease" part of AIMD.

This behavior results in a characteristic "sawtooth" pattern for the `cwnd`.

![TCP Congestion Window](https://www.researchgate.net/profile/Pooja-Verma-22/publication/322964579/figure/fig1/AS:590623259852800@1517826315574/TCP-Congestion-Window-Behavior.png)

---

## Exam Focus
- **2-Mark Questions:**
    - What is the difference between flow control and congestion control?
    - What does AIMD stand for? (Additive Increase, Multiplicative Decrease).
    - How does a TCP sender infer network congestion? (By detecting packet loss via timeouts or triple duplicate ACKs).
- **10-Mark Question:**
    - "Explain the three phases of the TCP congestion control algorithm (Slow Start, Congestion Avoidance, and Fast Recovery). Draw a diagram showing the evolution of the congestion window (`cwnd`) over time, illustrating how it changes in response to received ACKs and loss events."
        - **Tip:** The sawtooth diagram is essential. Clearly label the exponential growth of Slow Start, the linear growth of Congestion Avoidance, and show the sharp drops in `cwnd` for both a timeout (down to 1) and a triple duplicate ACK (halved).
