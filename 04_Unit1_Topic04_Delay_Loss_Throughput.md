--- 
title: "Unit 1: Delay, Loss, and Throughput"
id: unit1-topic4
tags: [unit1, performance, delay, latency, throughput, packet-loss, queuing]
aliases: [Network Performance]
---

# Unit 1, Topic 4: Delay, Loss, and Throughput

We've established that the Internet uses packet switching. Unlike a dedicated circuit, its performance can vary. The three key measures of performance in a packet-switched network are **delay**, **loss**, and **throughput**.

---

## 1. Delay (or Latency)

When a packet travels from one host to another, it suffers several types of delays at each node (router) along the path. The **total nodal delay** is the sum of four distinct sources of delay.

`Total Nodal Delay = Processing Delay + Queuing Delay + Transmission Delay + Propagation Delay`

```ascii
      |--------------------|      (Packet is processed,      |-------------------|
      | Transmission Delay |       waits in queue)            |Propagation Delay  |
      +--------------------+                                 +-------------------+
<--L/R-->                      <--d_proc + d_queue-->         <--------d/s-------->
|       | Packet Arrives     |                    | Packet Placed   |           | Packet Received
+-------+--------------------+--------------------+-----------------+-----------+
        ^                    ^                    ^                 ^
        |                    |                    |                 |
  Last bit of packet   First bit of packet   Last bit of packet   First bit of packet
arrives at router    placed on out-link     placed on out-link    arrives at next node
```

Let's break down these components.

### a. Processing Delay (`d_proc`)
- **What it is:** The time a router takes to process the packet's header, check for bit errors, and determine the output link.
- **Duration:** Typically very short, on the order of microseconds (µs).

### b. Queuing Delay (`d_queue`)
- **What it is:** The time a packet waits in a queue (buffer) before it can be transmitted onto the next link.
- **Duration:** Highly variable, ranging from zero to milliseconds or even seconds. This is the most complex delay component to analyze. It depends on the **traffic intensity**.
    - Let `a` = the average rate of packet arrival (packets/sec).
    - Let `L` = the average packet length (bits/packet).
    - Let `R` = the link transmission rate (bits/sec).
    - The traffic intensity is `La/R`.
    - If `La/R` -> 0, queuing delay is minimal.
    - If `La/R` -> 1, queuing delays become very large, approaching infinity.
    - If `La/R` > 1, the queue will grow without bound, and packet loss will occur.

### c. Transmission Delay (`d_trans`)
- **What it is:** The time required to push all of the packet's bits onto the link. It's a function of the packet's length and the link's transmission rate.
- **Formula:** `d_trans = L / R`
    - `L`: Packet length in bits
    - `R`: Link transmission rate in bits per second (bps)

### d. Propagation Delay (`d_prop`)
- **What it is:** The time it takes for a bit to travel from the beginning to the end of the physical link. It's a function of the distance and the propagation speed of the medium.
- **Formula:** `d_prop = d / s`
    - `d`: Length of the physical link in meters
    - `s`: Propagation speed (typically ~2.5 x 10^8 m/s).

> [!tip] **Transmission vs. Propagation Delay Analogy**
> Imagine a caravan of 10 cars (the packet) on a 100 km highway (the link). The tollbooth can process one car every minute.
> - **Transmission delay** is the time for the tollbooth to get the *entire caravan* onto the highway. `10 cars * 1 min/car = 10 minutes`. This depends on the caravan size (L) and the tollbooth rate (R).
> - **Propagation delay** is the time for the *first car* to travel the 100 km length of the highway. If the speed limit is 100 km/hr, this is 1 hour. This depends on the highway length (d) and the speed (s).

---

## 2. Packet Loss

- **What it is:** When a packet arrives at a router and the corresponding output queue is already full, the router has no choice but to **drop** the packet.
- **Why it happens:** Congestion, which occurs when `La/R > 1` for a sustained period.
- **Consequence:** For reliable protocols like TCP, a lost packet will be detected and retransmitted, but this takes time and consumes additional network resources.

---

## 3. Throughput

- **What it is:** The rate (in bits per second) at which bits are successfully transferred between a sender and receiver.
- **Bottleneck Link:** For any end-to-end path, the throughput is limited by the transmission rate of the **slowest link** on that path. This is the **bottleneck link**.

### Throughput Example
Consider a file being transferred between two servers, traversing three links and two routers.

`Server A --- (R1=100) --- Router1 --- (R2=20) --- Router2 --- (R3=50) --- Server B`
                                     `^`
                                     `|`
                                  `Other Traffic`

- Even though Server A has a 100 Mbps connection, its throughput to Server B is constrained by the link with the lowest capacity, `R2`.
- **End-to-end Throughput = min(R1, R2, R3) = min(100, 20, 50) = 20 Mbps.**
- If the "Other Traffic" is also using 10 Mbps of the `R2` link, the throughput available for our connection would be further reduced to `20 - 10 = 10 Mbps`.

---

## Exam Focus
- **2-Mark Questions:**
  - List the four sources of nodal delay.
  - What is a bottleneck link?
  - What is traffic intensity, and what happens when it is greater than 1?
- **10-Mark Calculation Problem:**
  - You will be given a scenario with packet sizes, link rates, and distances, and asked to calculate the total end-to-end delay. Be very careful with units (bits vs. bytes, seconds vs. ms, km vs. m). The problem in the `00_Problems_and_Solutions.md` file is a perfect example of this.
  - The "caravan" analogy is an excellent way to explain the difference between transmission and propagation delay in an exam.

---

We have now covered the fundamental performance metrics. Next, we will see how all these pieces are organized conceptually in **Protocol Layers**.

