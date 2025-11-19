---
title: "Unit 4: What’s Inside a Router"
id: unit4-topic3
tags: [unit4, network-layer, router-architecture, data-plane, control-plane]
aliases: [Router Architecture]
---

# Unit 4, Topic 3: What’s Inside a Router

We have established that routers are the devices that perform the network layer's core functions of forwarding and routing. But what does a router actually look like on the inside? A high-level view reveals four main components.

---

## 1. A Generic Router Architecture

A router's architecture can be broken down into two main planes: the **data plane** (responsible for the fast, per-packet forwarding) and the **control plane** (responsible for the slower, network-wide routing logic). These planes are implemented by four physical components:

```ascii
                  +--------------------------------+
                  |         CONTROL PLANE          |
                  |                                |
                  |       +----------------+       |
                  |       | Routing Proc.  |       |
                  |       +----------------+       |
                  |              ^               |
+-----------------|--------------|-----------------|----------------+
|   DATA PLANE    |              v               |    DATA PLANE    |
|                 |    +--------------------+    |                  |
| +-----------+   |    |                    |    |   +-----------+  |
| | Input     |-------->| Switching Fabric |------>| Output    |  |
| | Port 1    |   |    |                    |    |   | Port 1    |  |
| +-----------+   |    +--------------------+    |   +-----------+  |
|      ...        |                              |       ...        |
| +-----------+   |                              |   +-----------+  |
| | Input     |-------->                    ------>| Output    |  |
| | Port N    |   |                              |   | Port N    |  |
| +-----------+   |                              |   +-----------+  |
|                 |                              |                  |
+-----------------+------------------------------+------------------+
```

### a. Input Ports
An input port has several functions:
1.  **Physical Layer:** Terminates the physical link (e.g., an Ethernet port).
2.  **Link Layer:** Implements the link-layer protocol to decapsulate the datagram from the frame.
3.  **Forwarding Lookup:** This is the most critical data plane function here. The port's hardware looks up the datagram's destination address in its local copy of the **forwarding table**. The result of this lookup is the output port to which the datagram should be sent. This must be performed at "line speed" (as fast as packets can arrive).

### b. Switching Fabric
This is the heart of the router, connecting the input ports to the output ports. Its job is to move packets from an input buffer to the appropriate output buffer. There are several designs:
- **Switching via Memory:** The simplest design. The router's main CPU acts as the switch, copying the packet from an input buffer to an output buffer. This is slow and limited by the speed of the system's memory bus.
- **Switching via a Bus:** An input port transfers the packet directly to the correct output port over a shared bus. This is faster, but only one packet can be on the bus at a time, creating a bottleneck.
- **Switching via an Interconnect Network (Crossbar):** The highest-performance solution. A grid of buses allows multiple packets to be forwarded in parallel, as long as they are destined for different output ports.

### c. Output Ports
The output port receives packets from the switching fabric, stores them in a buffer (queue), and then transmits them over the outgoing link by performing the necessary link and physical layer functions.
- **Queuing:** If packets arrive from the switching fabric faster than the output link can transmit them, they must be queued in the output port's buffer. This is where **queuing delay** and **packet loss** (due to buffer overflow) occur. This is a primary cause of network congestion.

### d. Routing Processor
This is the "brain" of the router and is the main component of the **control plane**.
- **Function:** It executes the routing protocols (e.g., OSPF, BGP), communicates with other routers to build a map of the network, and uses this information to construct the forwarding table.
- **Action:** It downloads the completed forwarding table to the input ports, enabling them to perform their high-speed, hardware-based forwarding lookups.

---

## 2. Router Bottlenecks

Where can performance issues arise within a router?

- **Input Queuing:** If the switching fabric is not fast enough to clear packets from all input ports at their arrival rate, queues can build up at the input ports. This can lead to a problem called **head-of-line (HOL) blocking**, where a packet at the front of an input queue, waiting to go to a busy output port, blocks all the packets behind it, even if their destination output ports are free.
- **Output Queuing:** As mentioned above, if the aggregate arrival rate of packets to an output port exceeds the link's transmission speed, the output buffer will fill up. This is the most common and studied form of router congestion. The router must have a **packet scheduling** discipline to decide which queued packet to send next (e.g., first-in-first-out).

---

## Exam Focus
- **2-Mark Questions:**
    - List the four main components of a router. (Input Ports, Switching Fabric, Output Ports, Routing Processor).
    - Which router component is primarily responsible for executing routing protocols? (The Routing Processor).
    - Where does packet loss due to congestion typically occur within a router? (At the output port buffers).
- **10-Mark Question:**
    - "Draw a block diagram of a generic router's architecture, showing its four main components. Describe the function of each component and indicate which components belong to the data plane and which belong to the control plane."
        - **Tip:** Draw the diagram as shown above. Clearly label the data plane (Input, Switch, Output) and control plane (Routing Processor). For each component, write a one-sentence description of its primary role (e.g., "Input port performs forwarding table lookup," "Routing processor runs routing algorithms to compute the forwarding table.").
