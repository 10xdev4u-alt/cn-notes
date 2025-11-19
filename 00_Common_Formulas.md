---
title: Common Formulas
id: formulas
tags: #formulas #cs22501
aliases: [Formula Sheet]
---

# Common Formulas in Computer Networks

This file is a collection of all important formulas discussed throughout the course.

*This file will be updated as we cover new formulas.*

---
## Unit 1: Delay, Loss, and Throughput

1.  **Transmission Delay:** The time to push a packet of length `L` (bits) onto a link with transmission rate `R` (bps).
    $$ d_{trans} = \frac{L}{R} $$

2.  **Propagation Delay:** The time for a bit to travel across a link of distance `d` (meters) at propagation speed `s` (m/s).
    $$ d_{prop} = \frac{d}{s} $$

3.  **Total Nodal Delay:** The total delay experienced at a single router or node.
    $$ d_{nodal} = d_{proc} + d_{queue} + d_{trans} + d_{prop} $$

4.  **End-to-End Throughput:** The overall throughput for a path with N links is the minimum of all link rates (the bottleneck).
    $$ \text{Throughput} = \min(R_1, R_2, \dots, R_N) $$
