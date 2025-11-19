---
title: "Unit 3: Principles of Reliable Data Transfer"
id: unit3-topic4
tags: [unit3, transport-layer, rdt, tcp, reliability, arq]
aliases: [Reliable Data Transfer, RDT]
---

# Unit 3, Topic 4: Principles of Reliable Data Transfer

We've seen that UDP offers an unreliable service, and the underlying network layer (IP) is also unreliable. So, how does a protocol like TCP provide 100% reliable data transfer over an unreliable channel?

This is perhaps the most fundamental problem in computer networking. In this topic, we will explore the core principles by incrementally building a reliable data transfer (RDT) protocol. We will develop a series of protocols, `rdt1.0`, `rdt2.0`, and `rdt3.0`, each adding mechanisms to deal with a more realistic (and flawed) underlying channel.

---

## 1. RDT 1.0: Transfer over a Perfectly Reliable Channel

Let's start with an unrealistic best-case scenario: the underlying channel never corrupts or loses packets.

- **Sender:** Accepts data from the application layer, puts it in a packet, and sends it into the channel.
- **Receiver:** Receives the packet from the channel, extracts the data, and passes it up to its application layer.

This is trivial, but it's our starting point.

---

## 2. RDT 2.0: A Channel with Bit Errors

Now for a more realistic channel that can corrupt packets, but doesn't lose them.

To handle errors, we need two things: **error detection** and **feedback**.
- **Error Detection:** We can use a checksum field, just like in UDP, to detect if a packet has been corrupted.
- **Feedback:** The receiver needs to provide feedback to the sender.
    - **Positive Acknowledgement (ACK):** A message from the receiver indicating a packet was received correctly.
    - **Negative Acknowledgement (NAK):** A message indicating a packet was received but was corrupted.

This gives us an **ARQ (Automatic Repeat reQuest)** protocol.
- **Sender:** Sends a packet and waits. If it receives an ACK, it sends the next packet. If it receives a NAK, it **retransmits** the last packet.
- **Receiver:** If a packet is okay, send an ACK. If it's corrupt, send a NAK.

#### The Flaw in RDT 2.0
What happens if the ACK or NAK feedback packet gets corrupted? The sender has no idea what the receiver meant.

---

## 3. RDT 2.1 & 2.2: Handling Corrupted Feedback

To solve the issue of corrupted feedback, we introduce **sequence numbers**. We can add a 1-bit sequence number (0 or 1) to each data packet.

- **How it works:**
    1. The sender sends a packet with sequence number 0.
    2. The receiver receives the packet. If it's not corrupt and has sequence number 0, it sends an ACK and now waits for a packet with sequence number 1.
    3. The sender gets the ACK and now prepares to send a packet with sequence number 1.

- **Duplicate Detection:** Now, if the sender receives a garbled ACK/NAK, it simply retransmits the last packet (e.g., the one with sequence 0). The receiver will get a duplicate packet with sequence 0. It recognizes this is a duplicate because it's expecting sequence 1. The receiver simply **discards the duplicate packet** and sends another ACK for sequence 0.

By adding sequence numbers, the receiver can now tell the difference between a new packet and a retransmission of an old one. This makes NAKs redundant (`rdt2.2`), as the receiver can just send an ACK for the last correctly received packet, and the sender will know what to do if it gets a duplicate ACK.

---

## 4. RDT 3.0: A Channel with Errors and Loss

Finally, let's consider a channel that can corrupt packets *and* lose them entirely.

- **The New Problem:** If a data packet or its corresponding ACK is lost in the network, the sender will wait forever for a reply that never comes.
- **The Solution:** The sender needs a **countdown timer**.

This gives us the final, working reliable protocol.
- **Sender Operation:**
    1. Sends a packet and **starts a timer**.
    2. If an ACK for that packet arrives before the timer expires, the sender stops the timer and moves on.
    3. If the **timer expires**, the sender assumes the packet (or its ACK) was lost. It **retransmits** the packet and restarts the timer.

This combination of **checksums**, **sequence numbers**, **acknowledgements**, and **timers** forms the essential foundation of any reliable data transfer protocol.

---

## Pipelining: The Next Step

All the protocols we've designed so far are **stop-and-wait** protocols. The sender sends one packet, then stops and waits for the ACK before sending the next. This is safe but very inefficient, as the channel is idle most of the time.

To improve performance, practical protocols use **pipelining**, where the sender can send multiple packets ("in-flight") without waiting for acknowledgements for each one. This allows the channel to be filled with data, dramatically increasing throughput.

![Pipelining](https://media.geeksforgeeks.org/wp-content/uploads/pipelining.png)

Pipelining requires more sophisticated protocols to keep track of all the in-flight packets, such as **Go-Back-N** and **Selective Repeat**. These pipelined RDT protocols form the basis of TCP's reliability.

---

## Exam Focus
- **2-Mark Questions:**
    - What is an ARQ protocol? (Automatic Repeat reQuest).
    - What is the role of a sequence number in RDT? (To detect duplicate packets).
    - What problem does a countdown timer solve in RDT 3.0? (It detects lost packets).
- **10-Mark Question:**
    - "Explain the evolution of a reliable data transfer protocol, starting from `rdt2.0` (a channel with only bit errors) to `rdt3.0` (a channel with errors and losses). For each version, describe the problem it solves and the new mechanism it introduces."
        - **Tip:** Tell the story. Start with `rdt2.0` and its use of ACKs/NAKs. Explain its flaw (corrupted ACKs). Introduce `rdt2.1/2.2` and how sequence numbers solve this flaw by allowing duplicate detection. Then, explain the new flaw of packet loss and how `rdt3.0` introduces a timer to solve it.
