---
title: "Unit 3: Connection-Oriented Transport: TCP"
id: unit3-topic5
tags: [unit3, transport-layer, tcp, reliability, flow-control, handshake]
aliases: [TCP]
---

# Unit 3, Topic 5: Connection-Oriented Transport: TCP

We now arrive at the Internet's workhorse transport protocol: **TCP (Transmission Control Protocol)**. TCP provides a reliable, connection-oriented service to application processes. It implements the principles of reliable data transfer (RDT) we just studied, but in a pipelined fashion, and adds two other critical services: **flow control** and **congestion control**.

---

## 1. The TCP Segment Structure

A TCP segment consists of a header and a data payload. The header is at least 20 bytes long and contains crucial control information.

```ascii
 0                   15 16                  31
+--------------------+--------------------+
|    Source Port     |  Destination Port  |
+-----------------------------------------+
|            Sequence Number              |
+-----------------------------------------+
|          Acknowledgment Number          |
+----+----+----------+--------------------+
| Hdr| Rsvd|U|A|P|R|S|F |   Receive Window   |
| Len|     |R|C|S|S|Y|I |                    |
|    |     |G|K|H|T|N|N |                    |
+----+----+----------+--------------------+
|   TCP Checksum     |  Urgent Data Ptr   |
+--------------------+--------------------+
|        Options (if any) ...             |
+-----------------------------------------+
|            Application Data             |
+-----------------------------------------+
```

### Key Header Fields
- **Source Port** & **Destination Port:** Used for multiplexing and demultiplexing.
- **Sequence Number:** This is a **byte-stream number**. It is the sequence number of the *first byte* of data in the current segment. TCP views the data as an unstructured, ordered stream of bytes.
- **Acknowledgment Number:** The sequence number of the *next byte* the sender is expecting from the other side. TCP uses **cumulative acknowledgements**, meaning an ACK for byte `y` implies all bytes up to `y-1` have been received correctly.
- **Header Length:** Specifies the length of the TCP header in 32-bit words (needed because the `Options` field is variable).
- **Flags (6 bits):**
    - `ACK`: Indicates that the Acknowledgment Number field is valid.
    - `SYN`: Used in the initial three-way handshake to establish a connection.
    - `FIN`: Used to terminate a connection.
    - `RST`, `PSH`, `URG`: Other flags for reset, push, and urgent data.
- **Receive Window:** Used for **flow control**. It tells the sender how much buffer space the receiver has available.
- **Checksum:** Used for error detection, calculated over the header and data.

---

## 2. TCP Reliable Data Transfer

TCP provides reliability by implementing a pipelined RDT protocol based on the principles from our last topic.
- **Timeout Mechanism:** TCP uses a single retransmission timer for the oldest unacknowledged segment. If the timer expires, that segment is retransmitted.
- **Fast Retransmit (An Important Optimization):** Waiting for a timeout can be slow. If a sender receives **three duplicate ACKs** for the same sequence number, it takes this as a strong indication that the packet *after* that acknowledged packet was lost. The sender then performs a **fast retransmit**, re-sending the lost packet immediately without waiting for its timer to expire.

---

## 3. TCP Flow Control

- **Purpose:** To prevent the sender from sending data faster than the receiver can process it, thereby overflowing the receiver's buffer. **This is about protecting the receiver, not the network.**
- **How it works:** The receiver advertises its available buffer space in the **Receive Window** field of every segment it sends back. The sender must ensure that the amount of unacknowledged ("in-flight") data is always less than the last advertised receive window.

---

## 4. TCP Connection Management

Before data can be exchanged, a connection must be established using the famous **Three-Way Handshake**.

```ascii
      Client                                   Server
        |                                        |
        |  1. SYN (seq=x) ----------------------> |
        |                                        |
        |  <---------------------- 2. SYN-ACK (seq=y, ack=x+1)
        |                                        |
        |  3. ACK (seq=x+1, ack=y+1) -----------> |
        |                                        |
      Connection                               Data
     Established                             Transfer
```
1.  **Client -> Server (SYN):** The client sends a special segment with the `SYN` flag set and a random initial sequence number `x`.
2.  **Server -> Client (SYN-ACK):** The server receives the SYN, allocates buffers for the new connection, and sends back a segment with both the `SYN` and `ACK` flags set. It chooses its own random initial sequence number `y` and acknowledges the client's SYN by setting the acknowledgment number to `x+1`.
3.  **Client -> Server (ACK):** The client receives the SYN-ACK, allocates its own buffers, and sends a final segment back to the server, acknowledging the server's SYN by setting the acknowledgment number to `y+1`.

At this point, the connection is established, and application data can begin to flow.

**Connection Teardown:** Closing a connection is also a formal process, typically involving a four-way exchange using the `FIN` flag, where each side independently signals that it is done sending data.

---

## Exam Focus
- **2-Mark Questions:**
    - What is the difference between a TCP sequence number and an acknowledgment number?
    - What is the purpose of the Receive Window field in the TCP header? (Flow control).
    - List the three steps of the TCP three-way handshake.
- **10-Mark Question:**
    - "Draw the TCP segment structure and explain the purpose of the sequence number, acknowledgment number, and the SYN/ACK flags. Then, describe the three-way handshake process for establishing a TCP connection."
        - **Tip:** A clear diagram of the header is essential. For the handshake, a diagram showing the three steps with their `seq` and `ack` numbers is critical. Explain what each step achieves (e.g., the SYN-ACK from the server both acknowledges the client's request and proposes its own sequence number).
- **Distinction Question:**
    - "Differentiate between Flow Control and Congestion Control." (Flow control protects the receiver from being overwhelmed. Congestion control protects the network from being overwhelmed. We will study congestion control next.)
