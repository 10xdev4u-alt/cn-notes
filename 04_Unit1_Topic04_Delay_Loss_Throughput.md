---
title: "Unit 1: Delay, Loss, and Throughput"
id: unit1-topic4
tags: [unit1, performance, delay, latency, throughput, packet-loss]
aliases: [Network Performance]
---

# Unit 1, Topic 4: Delay, Loss, and Throughput

We've established that the Internet uses packet switching, which has consequences. Unlike a dedicated circuit, performance can vary. The three key measures of performance in a packet-switched network are **delay**, **loss**, and **throughput**.

---

## 1. Delay (or Latency)

When a packet travels from one host to another, it suffers several types of delays at each node (router) along the path. The **total nodal delay** is the sum of four distinct sources of delay.

`Total Nodal Delay = Processing Delay + Queuing Delay + Transmission Delay + Propagation Delay`

Let's break them down.

### a. Processing Delay
- **What it is:** The time a router takes to process the packet's header. This includes checking for bit errors and determining the output link.
- **Duration:** Typically very short, on the order of microseconds (µs).

### b. Queuing Delay
- **What it is:** The time a packet waits in a queue (buffer) before it can be transmitted onto the next link.
- **Duration:** Highly variable. It depends on the number of other packets already in the queue. If the link is busy, the queueing delay will be long. If the link is free, it can be zero. This is the most complex delay component to analyze.

### c. Transmission Delay
- **What it is:** The time required to push all of the packet's bits onto the link. It's a function of the packet's length and the link's transmission rate.
- **Formula:** `d_trans = L / R`
    - `L`: Packet length in bits
    - `R`: Link transmission rate in bits per second (bps)
- **Example:** To send a 1,500-byte packet on a 10 Mbps link:
    - `L = 1,500 bytes * 8 bits/byte = 12,000 bits`
    - `R = 10 Mbps = 10,000,000 bps`
    - `d_trans = 12,000 / 10,000,000 = 0.0012 seconds = 1.2 ms`

### d. Propagation Delay
- **What it is:** The time it takes for a bit to travel from the beginning to the end of the physical link. It's a function of the distance and the propagation speed of the medium.
- **Formula:** `d_prop = d / s`
    - `d`: Length of the physical link in meters
    - `s`: Propagation speed (typically close to the speed of light, ~2.5 x 10^8 m/s for fiber/copper).
- **Example:** For a 25,000 km fiber optic link:
    - `d = 25,000 km = 25,000,000 m`
    - `s = 2.5 x 10^8 m/s`
    - `d_prop = 25,000,000 / (2.5 x 10^8) = 0.1 seconds = 100 ms`

> [!tip] **Transmission vs. Propagation Delay Analogy**
> Imagine a caravan of 100 cars (the packet) traveling on a 100 km highway (the link).
> - **Transmission delay** is the time it takes for the entire caravan to get *onto* the highway. If one car can get on every second, it takes 100 seconds. This depends on the size of the caravan (L) and the rate of entry (R).
> - **Propagation delay** is the time it takes for the *first car* to travel the entire 100 km length of the highway. This depends on the length of the highway (d) and the speed limit (s).

---

## 2. Packet Loss

- **What it is:** When a packet arrives at a router, it is directed to an output queue. If this queue is already full with other packets, the router has no place to store the newly arriving packet. It will **drop** the packet. This is called **packet loss**.
- **Why it happens:** Congestion. The rate at which packets arrive exceeds the outgoing link's capacity for a period of time.
- **Consequence:** For reliable protocols like TCP, a lost packet will be detected and retransmitted by the sender, which can further increase delay.

---

## 3. Throughput

- **What it is:** The rate (in bits per second) at which bits are successfully transferred between a sender and receiver.
- **Bottleneck Link:** Throughput is not determined by how fast your local connection is. It's limited by the **slowest link** on the end-to-end path. This slowest link is called the **bottleneck link**.

### Throughput Example

Consider a file being transferred from a Server to a Client across two links:

`Server --- (R1=100 Mbps) --- Router --- (R2=10 Mbps) --- Client`

- The server can send data at 100 Mbps.
- The second link can only forward data at 10 Mbps.
- The end-to-end throughput is therefore limited by the slowest link.
- **Throughput = min(R1, R2) = min(100 Mbps, 10 Mbps) = 10 Mbps.**

---

## Formulas & Problems

### Formulas
1.  **Transmission Delay:** `d_trans = L / R`
2.  **Propagation Delay:** `d_prop = d / s`
3.  **End-to-End Throughput:** `Throughput = min(R1, R2, ..., RN)` for a path with N links.

### Practice Problem
A host wants to send a 20,000-byte file to another host. The path consists of 2 links and one router.
- Link 1: Rate = 10 Mbps, Distance = 5,000 km
- Link 2: Rate = 2 Mbps, Distance = 2,000 km
- Assume a propagation speed of 2.5 x 10^8 m/s.
- Assume processing and queuing delays are zero.
What is the total end-to-end delay to send the file?

**Solution Approach:**
1.  The file is sent as one large packet.
2.  Total Delay = (Delay on Link 1) + (Delay on Link 2)
3.  Delay on a link = Transmission Delay + Propagation Delay.
4.  Calculate `d_trans1`, `d_prop1`, `d_trans2`, `d_prop2`.
5.  Total Delay = `d_trans1` + `d_prop1` + `d_trans2` + `d_prop2`.
(Solution will be in `00_Problems_and_Solutions.md`)

---

## Exam Focus
- **2-Mark Questions:**
  - List the four sources of nodal delay.
  - What is a bottleneck link?
  - Under what condition does packet loss occur?
  - Differentiate between transmission and propagation delay.
- **10-Mark Calculation Problem:**
  - You will be given a scenario with packet sizes, link rates, and distances, and asked to calculate the total end-to-end delay. Be very careful with units (bits vs. bytes, seconds vs. ms, km vs. m).

---

We have now covered the fundamental performance metrics. Next, we will see how all these pieces are organized conceptually in **Protocol Layers**.


