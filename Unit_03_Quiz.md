---
title: "Unit 3 Quiz"
id: unit3-quiz
tags: [unit3, quiz, revision]
aliases: [Unit 3 Test]
---

# Unit 3 Quiz: Transport Layer

This quiz covers all the topics from Unit 3. Use it to test your understanding. The answers for the first section are at the bottom.

---

## 1. Quiz Questions (Multiple Choice)

1.  The primary purpose of the Transport Layer is to provide logical communication between:
    a) Routers
    b) Hosts
    c) Processes
    d) Switches

2.  A UDP socket is uniquely identified by a:
    a) 1-tuple (destination port)
    b) 2-tuple (destination IP, destination port)
    c) 3-tuple (protocol, source port, destination port)
    d) 4-tuple (source IP, source port, destination IP, destination port)

3.  Which of the following is NOT a mechanism used by `rdt3.0`?
    a) Checksum
    b) Pipelining
    c) Timers
    d) Sequence Numbers

4.  TCP's "fast retransmit" mechanism is triggered by:
    a) A timeout
    b) A NAK packet
    c) A single duplicate ACK
    d) Three duplicate ACKs

5.  The TCP "Receive Window" (`rwnd`) field is used for:
    a) Error detection
    b) Congestion control
    c) Reliable data transfer
    d) Flow control

6.  In the TCP Three-Way Handshake, which packet is sent by the server in response to the client's initial request?
    a) SYN
    b) ACK
    c) SYN-ACK
    d) FIN

7.  TCP's Slow Start algorithm increases the congestion window (`cwnd`):
    a) Linearly (by 1 MSS per RTT)
    b) Exponentially (doubling every RTT)
    c) Multiplicatively (doubling every ACK)
    d) Additively (by 1 MSS per ACK)

8.  If a TCP sender has its `cwnd` = 20 MSS and it experiences a timeout, its `cwnd` will be reset to:
    a) 1 MSS
    b) 10 MSS
    c) 15 MSS
    d) 20 MSS

9.  The UDP header contains how many fields?
    a) 2
    b) 4
    c) 6
    d) 8

10. The primary advantage of Explicit Congestion Notification (ECN) is that it:
    a) Guarantees packet delivery
    b) Allows congestion to be signaled without dropping packets
    c) Eliminates the need for flow control
    d) Works even if routers don't support it

---

## 2. Reasoning Questions

1.  Why is it said that the Transport Layer provides "logical" communication?
2.  Explain why a TCP server needs both a listening socket and multiple connection sockets to handle many clients.
3.  What is the "fatal flaw" of the `rdt2.0` protocol, and what mechanism solves it?
4.  Why is TCP's cumulative acknowledgment scheme efficient?
5.  Differentiate clearly between flow control and congestion control.
6.  Why is the exponential increase in Slow Start eventually replaced by the linear increase of Congestion Avoidance?
7.  Explain the 'D' in AIMD (Additive Increase, Multiplicative Decrease). When and how does it happen?
8.  Why would a real-time video streaming application prefer to use UDP, even though some packets might be lost?
9.  What is the purpose of the sequence number in a TCP segment?
10. How does the receiver in an ECN-enabled system inform the sender that it received a congestion-marked packet?

---

## 3. Real-World Cases

1.  You are downloading a large file. Your TCP connection starts fast, then seems to slow down, and then continues at a steady rate. Describe what phases of TCP congestion control you are likely observing.
2.  You are designing a simple network application for querying the time from a time server. You need the response to be as fast as possible, and can tolerate an occasional failed query. Which transport protocol would you choose and why?
3.  A server is running a popular web service on port 443. Use the concept of connection-oriented demultiplexing to explain how this single server process can have simultaneous, separate conversations with thousands of different clients.
4.  A sender sends a TCP segment with `Seq=1000` and a data length of 500 bytes. If this segment is received correctly, what will be the Acknowledgment number in the receiver's reply?
5.  A TCP connection has a `cwnd` of 16 MSS. It receives three duplicate ACKs. What will the new values of `ssthresh` and `cwnd` be? What phase will the algorithm be in next?
6.  You are on a network where a router's buffer is frequently overflowing and dropping packets. How would ECN, if it were enabled on the router and end hosts, help alleviate this situation?
7.  Explain the role of timers in a stop-and-wait reliable data transfer protocol. What would happen without them if a packet was lost?
8.  A UDP-based application is sending data. The developer notices that some data is arriving corrupted. What field in the UDP header is used to detect this, and what does the receiver do with a corrupted segment?
9.  A client attempts to connect to a server for a TCP connection. It sends a SYN packet, but receives no reply. What will the client do?
10. In the analogy of a postal service, if the Network Layer delivers mail to a house, what is the Transport Layer's job? What do the port numbers represent?

---

## 4. Rapid Fire

1.  What does TCP stand for?
2.  Is TCP connection-oriented or connectionless?
3.  How many bytes is a standard TCP header?
4.  What does the `SYN` flag signify?
5.  What mechanism protects the receiver's buffer from overflowing?
6.  What mechanism protects the network's routers from being overwhelmed?
7.  True or False: UDP provides reliable data transfer.
8.  Which RDT mechanism handles lost packets?
9.  In AIMD, which is faster: the increase or the decrease?
10. What does ECE stand for in a TCP ACK?

---

## 5. Possible 2-Mark Exam Questions

1.  What is transport-layer demultiplexing?
2.  List two services provided by TCP but not by UDP.
3.  What is a cumulative acknowledgment?
4.  Define TCP's 'fast retransmit'.
5.  What is the purpose of the `ssthresh` variable in TCP congestion control?
6.  Draw the UDP segment header.
7.  What is the purpose of the three-way handshake?
8.  What is the role of a sequence number in RDT?
9.  How is a TCP connection socket identified by the server's OS? (The 4-tuple).
10. What is the key difference between network-assisted and end-to-end congestion control?

---
---

## Answers to Section 1 (Quiz Questions)

1.  **Answer:** c) Processes
    - **Concept:** Role of the Transport Layer.
    - **Reason:** The transport layer extends the host-to-host delivery of the network layer to process-to-process delivery.

2.  **Answer:** b) 2-tuple (destination IP, destination port)
    - **Concept:** Connectionless Demultiplexing.
    - **Reason:** A UDP socket is identified by the port it's bound to. All datagrams arriving for that port are sent to the same socket.

3.  **Answer:** b) Pipelining
    - **Concept:** Reliable Data Transfer Principles.
    - **Reason:** `rdt3.0` is a stop-and-wait protocol. Pipelining is an optimization added on top of these principles to improve performance.

4.  **Answer:** d) Three duplicate ACKs
    - **Concept:** TCP Reliability.
    - **Reason:** Receiving three ACKs for the same data indicates that the sender has received three subsequent segments, implying the one after the ACK'd data was lost.

5.  **Answer:** d) Flow control
    - **Concept:** TCP Flow Control.
    - **Reason:** The receive window (`rwnd`) is how the receiver tells the sender how much buffer space it has available.

6.  **Answer:** c) SYN-ACK
    - **Concept:** TCP Connection Management.
    - **Reason:** The server responds to the client's initial SYN with a combined SYN and ACK packet.

7.  **Answer:** b) Exponentially (doubling every RTT)
    - **Concept:** TCP Congestion Control.
    - **Reason:** In Slow Start, `cwnd` is incremented by 1 MSS for every ACK, which results in a doubling of the window size each round-trip time.

8.  **Answer:** a) 1 MSS
    - **Concept:** TCP Congestion Control Reaction.
    - **Reason:** A timeout is a major congestion event, causing `cwnd` to be reset to its initial value of 1 MSS. `ssthresh` would be set to 10 MSS (`cwnd`/2).

9.  **Answer:** b) 4
    - **Concept:** UDP Segment Structure.
    - **Reason:** The UDP header has 4 fields: Source Port, Destination Port, Length, and Checksum.

10. **Answer:** b) Allows congestion to be signaled without dropping packets
    - **Concept:** ECN.
    - **Reason:** ECN's main goal is to provide an early warning of congestion, allowing the sender to slow down *before* packet loss occurs.
