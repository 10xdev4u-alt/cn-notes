---
title: "Unit 3: Connectionless Transport: UDP"
id: unit3-topic3
tags: [unit3, transport-layer, udp, checksum]
aliases: [UDP]
---

# Unit 3, Topic 3: Connectionless Transport: UDP

Now that we understand the core service of multiplexing/demultiplexing, let's examine the first of the Internet's two transport protocols: **UDP (User Datagram Protocol)**.

UDP is the "no-frills," lightweight transport protocol. It takes messages from the application layer, attaches source and destination port numbers for multiplexing/demultiplexing, adds two other small fields, and passes the resulting segment to the network layer.

> [!note] UDP provides a **connectionless**, **unreliable** service with **no congestion control**. It does almost nothing beyond the basic service of process-to-process data delivery and some minor error checking.

---

## 1. Why Use UDP?

Given that TCP provides reliable data transfer and congestion control, why would an application developer ever choose UDP?

- **No Connection Establishment Delay:** UDP is connectionless. There is no three-way handshake as with TCP. This saves an entire round-trip time (RTT) of delay, which is a primary reason why DNS (which needs to be very fast) runs on UDP.

- **No Connection State:** TCP must maintain connection state (sequence numbers, congestion control windows, etc.) for each active connection. UDP does not maintain any state, allowing a single server to support a much larger number of active clients.

- **Smaller Header Overhead:** The UDP header is a fixed 8 bytes. A TCP header is 20 bytes (or more, with options). For small application messages, this can be a significant difference.

- **No Congestion Control:** This is a double-edged sword. TCP's congestion control can throttle an application's sending rate when the network is congested. UDP has no such restrictions. This gives the application developer full control over when and how much data is sent, which is critical for real-time applications (like live video streaming or online gaming) where sending data immediately is more important than ensuring all of it arrives.

---

## 2. UDP Segment Structure

A UDP segment consists of the application data and a short 8-byte header.

```ascii
 0                   15 16                  31
+--------------------+--------------------+
|    Source Port     |  Destination Port  |
+--------------------+--------------------+
|       Length       |      Checksum      |
+--------------------+--------------------+
|                                         |
|            Application Data             |
|                                         |
+-----------------------------------------+
```

The header has four fields, each 2 bytes (16 bits) long:

- **Source Port:** The port number of the sending application process. This is used by the receiver if it needs to send a reply.
- **Destination Port:** The port number of the receiving application process. This is essential for the demultiplexing service.
- **Length:** The length of the entire UDP segment (header + data) in bytes.
- **Checksum:** This field is used for error detection.

---

## 3. UDP Checksum

The checksum provides a way to detect errors—that is, to determine if bits within the received segment have been altered during transit.

#### How it Works (High Level)
1.  **Sender-Side:** The sender treats the contents of the segment (header and data) as a sequence of 16-bit integers. It sums all of these integers. The 1s complement of this final sum is then placed in the checksum field.
2.  **Receiver-Side:** The receiver performs the same calculation on the received segment's data and header. It then checks if the computed value matches the value in the received checksum field.
    - If they **do not match**, the receiver knows an error has occurred. It will silently discard the corrupted segment.
    - If they **do match**, it is highly likely (but not 100% guaranteed) that no errors occurred.

> [!important] The UDP checksum provides error **detection**, but not error **correction**. UDP does not attempt to recover a lost or corrupted segment. The application is either tolerant to this loss, or it must implement its own reliability mechanisms.

---

## Exam Focus
- **2-Mark Questions:**
    - List two reasons why an application might use UDP instead of TCP. (No connection delay, no state, no congestion control, smaller header).
    - What are the four fields in a UDP header? (Source Port, Destination Port, Length, Checksum).
    - What is the purpose of the UDP checksum? (To detect bit errors in the segment).
- **10-Mark Question:**
    - "Describe the UDP segment structure with a neat diagram. Explain why an application like DNS or online gaming would prefer UDP over TCP, detailing at least two specific advantages of UDP for such applications."
        - **Tip:** Draw the 4-field header. For the justification, focus on UDP's advantages: the lack of connection setup delay is critical for the fast, transactional nature of DNS. The lack of congestion control and retransmissions is critical for real-time games, where a slightly old packet is useless and it's better to just drop it and move on to the newer ones.
