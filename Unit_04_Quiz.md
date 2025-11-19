---
title: "Unit 4 Quiz"
id: unit4-quiz
tags: [unit4, quiz, revision]
aliases: [Unit 4 Test]
---

# Unit 4 Quiz: The Network Layer

This quiz covers all the topics from Unit 4. Use it to test your understanding. The answers for the first section are at the bottom.

---

## 1. Quiz Questions (Multiple Choice)

1.  The network-wide process of determining end-to-end paths is called:
    a) Forwarding
    b) Switching
    c) Routing
    d) Encapsulation

2.  Which component of a router is part of the control plane?
    a) Input Port
    b) Switching Fabric
    c) Output Port
    d) Routing Processor

3.  The Internet's network layer provides which type of service?
    a) Guaranteed delivery
    b) Best-effort
    c) Constant bit rate
    d) Loss-free

4.  A key difference between a datagram network and a virtual-circuit network is that:
    a) Datagram routers are stateful.
    b) VC routers are stateless.
    c) A VC network requires a connection setup phase.
    d) Datagram networks guarantee packet ordering.

5.  What is the primary motivation for the creation of IPv6?
    a) To improve security
    b) To simplify the header
    c) To exhaust the 32-bit address space
    d) To provide a much larger address space

6.  In the IPv4 header, which field prevents a packet from looping forever?
    a) Header Checksum
    b) Protocol
    c) Flags
    d) Time-to-Live (TTL)

7.  Which routing algorithm requires all routers to have a complete map of the network?
    a) Distance-Vector
    b) BGP
    c) Link-State
    d) Hierarchical

8.  The de-facto standard Inter-AS (EGP) routing protocol is:
    a) RIP
    b) OSPF
    c) BGP
    d) IS-IS

9.  IGMP is a protocol used by a host to:
    a) Get an IP address from a DHCP server.
    b) Inform its local router that it wants to join a multicast group.
    c) Resolve a hostname into an IP address.
    d) Send an error message back to a source.

10. The most efficient way to implement broadcast routing in a network with loops is:
    a) N-way unicast
    b) Uncontrolled flooding
    c) Spanning Tree broadcast
    d) Using BGP

---

## 2. Reasoning Questions

1.  Differentiate clearly between forwarding and routing.
2.  What is head-of-line (HOL) blocking in a router? At which port does it occur?
3.  Why are IPv6 routers not allowed to perform fragmentation?
4.  Explain the "chicken-and-egg" problem related to IPv6 adoption.
5.  What is the "count-to-infinity" problem in Distance-Vector routing?
6.  BGP is a "Path Vector" protocol. How does this feature help prevent routing loops?
7.  Why is policy more important than performance in Inter-AS routing?
8.  Why is a simple flooding algorithm for broadcast potentially dangerous?
9.  Give a real-world application for unicast, broadcast, and multicast communication.
10. Describe what happens at a router when a packet with a TTL of 1 arrives.

---

## 3. Real-World Cases

1.  A network administrator for a large university needs to choose an interior gateway protocol (IGP). Would they be more likely to choose RIP or OSPF? Justify your answer based on the characteristics of the algorithms.
2.  You are using `traceroute` to a remote server. The first few hops show low latency (5-10ms), but one hop in the middle suddenly shows a latency of 200ms, and all subsequent hops also have a latency of at least 200ms. What have you likely discovered?
3.  Comcast (AS 7922) and Verizon (AS 701) are two large ISPs. What protocol do they use to exchange routing information with each other? What is the primary consideration in the routes they advertise and accept?
4.  You are watching a live pay-per-view sports event online, which is being delivered via multicast. Explain the role of IGMP when you first start the stream.
5.  An administrator of a small office network buys a new router. They configure the LAN side with the address `192.168.1.1 /24`. What is the subnet mask for this network? What is the role of the address `192.168.1.1`?
6.  A host sends a 2000-byte IP datagram into a network. It eventually must traverse a link with an MTU of 800 bytes. How many fragments will be created? What will the "more fragments" flag be set to for each fragment?
7.  Describe how IPv6 tunneling would be used if your IPv6-enabled home computer wants to access an IPv6-only server, but your ISP only provides you with an IPv4 address.
8.  A router receives two advertisements for the same network prefix via BGP. Path 1 is `AS1, AS2, AS3`. Path 2 is `AS4, AS5`. From a purely performance perspective, Path 2 looks shorter. Give one policy-based reason why the router might choose Path 1 instead.
9.  A router's output buffer for a specific link is full. A new packet arrives destined for that link. What happens to the packet? Which network layer service model does this demonstrate?
10. You are designing a new network application and you need to get a block of 100 IP addresses. Who do you get them from? (Hint: Think about subnets and ISPs).

---

## 4. Rapid Fire

1.  What does OSPF stand for?
2.  Is BGP an IGP or an EGP?
3.  How many bits are in an IPv6 address?
4.  Which part of the router constitutes the control plane?
5.  What does NAT stand for?
6.  True or False: In a VC network, each packet contains the full destination address.
7.  What protocol does a host use to join a multicast group?
8.  Which routing algorithm family is prone to routing loops?
9.  A broadcast storm is caused by uncontrolled _____.
10. What does CIDR stand for?

---

## 5. Possible 2-Mark Exam Questions

1.  What is a subnet? What is a subnet mask?
2.  What is the function of the IPv4 'Protocol' field?
3.  Describe the "dual stack" IPv6 transition strategy.
4.  What is the difference between a link-state and distance-vector algorithm's knowledge of the network?
5.  What is an Autonomous System (AS)?
6.  Why does BGP use a path-vector approach?
7.  What are the three main types of communication in a network? (Unicast, Broadcast, Multicast).
8.  Where does queuing delay and packet loss typically occur inside a router?
9.  What is the function of a forwarding table?
10. What is a "spanning tree" in the context of broadcast routing?

---
---

## Answers to Section 1 (Quiz Questions)

1.  **Answer:** c) Routing
    - **Concept:** Forwarding vs. Routing.
    - **Reason:** Routing is the network-wide process of determining paths. Forwarding is the local action of moving a packet from input to output.

2.  **Answer:** d) Routing Processor
    - **Concept:** Router Architecture.
    - **Reason:** The routing processor is the "brain" that runs routing protocols and constitutes the control plane. The other components are part of the data plane.

3.  **Answer:** b) Best-effort
    - **Concept:** Network Service Model.
    - **Reason:** The Internet's IP layer makes no guarantees on delivery, ordering, or timing.

4.  **Answer:** c) A VC network requires a connection setup phase.
    - **Concept:** Datagram vs. VC Networks.
    - **Reason:** VC networks are connection-oriented and must establish a path before data transfer. Datagram networks are connectionless.

5.  **Answer:** d) To provide a much larger address space
    - **Concept:** IPv6 Motivation.
    - **Reason:** The exhaustion of the 32-bit IPv4 address space was the single most important driver for the creation of IPv6.

6.  **Answer:** d) Time-to-Live (TTL)
    - **Concept:** IPv4 Header.
    - **Reason:** The TTL is decremented by each router. If it reaches zero, the packet is dropped, preventing it from looping forever.

7.  **Answer:** c) Link-State
    - **Concept:** Routing Algorithms.
    - **Reason:** In a link-state algorithm (like OSPF), every router has a full map of the network topology.

8.  **Answer:** c) BGP
    - **Concept:** Internet Routing Protocols.
    - **Reason:** BGP (Border Gateway Protocol) is the sole Exterior Gateway Protocol used for routing between Autonomous Systems on the Internet.

9.  **Answer:** b) Inform its local router that it wants to join a multicast group.
    - **Concept:** Multicast.
    - **Reason:** IGMP (Internet Group Management Protocol) is the protocol hosts use to manage multicast group membership.

10. **Answer:** c) Spanning Tree broadcast
    - **Concept:** Broadcast Routing.
    - **Reason:** A spanning tree provides a loop-free path to all nodes in the network, ensuring efficient and storm-free broadcasting.
