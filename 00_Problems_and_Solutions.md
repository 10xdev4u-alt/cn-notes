---
title: Problems and Solutions
id: problems
tags: #problems #cs22501
aliases: [Practice Problems]
---

# Problems and Solutions

This file contains a collection of practice problems and their detailed solutions.

*This file will be updated as we encounter new problems.*

---
## Unit 1: Delay Calculation Problem

**Problem:** A host wants to send a 20,000-byte file to another host. The path consists of 2 links and one router.
- Link 1: Rate = 10 Mbps, Distance = 5,000 km
- Link 2: Rate = 2 Mbps, Distance = 2,000 km
- Assume a propagation speed of 2.5 x 10^8 m/s.
- Assume processing and queuing delays are zero.
What is the total end-to-end delay to send the file?

**Solution:**

**1. Identify Variables:**
- File Size (L): 20,000 bytes * 8 bits/byte = 160,000 bits
- Link 1 Rate (R1): 10 Mbps = 10 x 10^6 bps
- Link 1 Distance (d1): 5,000 km = 5 x 10^6 m
- Link 2 Rate (R2): 2 Mbps = 2 x 10^6 bps
- Link 2 Distance (d2): 2,000 km = 2 x 10^6 m
- Propagation Speed (s): 2.5 x 10^8 m/s

**2. Understand the Path:**
The total delay is the sum of the delays on each link. Since the file is sent as one large packet, the router in the middle performs store-and-forward. The total delay is the time it takes to transmit and propagate over the first link, PLUS the time it takes to transmit and propagate over the second link.

**Total Delay = (d_trans1 + d_prop1) + (d_trans2 + d_prop2)**

**3. Calculate Individual Delays:**

- **Transmission Delay on Link 1 (d_trans1):**
  `d_trans1 = L / R1 = 160,000 bits / (10 x 10^6 bps) = 0.016 s`

- **Propagation Delay on Link 1 (d_prop1):**
  `d_prop1 = d1 / s = (5 x 10^6 m) / (2.5 x 10^8 m/s) = 0.02 s`

- **Transmission Delay on Link 2 (d_trans2):**
  `d_trans2 = L / R2 = 160,000 bits / (2 x 10^6 bps) = 0.08 s`

- **Propagation Delay on Link 2 (d_prop2):**
  `d_prop2 = d2 / s = (2 x 10^6 m) / (2.5 x 10^8 m/s) = 0.008 s`

**4. Sum the Delays:**
`Total Delay = 0.016s + 0.02s + 0.08s + 0.008s = 0.124 s`

**Answer:** The total end-to-end delay is **0.124 seconds** or **124 milliseconds**.
