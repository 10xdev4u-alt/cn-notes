---
title: "Unit 5 Quiz"
id: unit5-quiz
tags: [unit5, quiz, revision]
aliases: [Unit 5 Test]
---

# Unit 5 Quiz: The Datalink & Physical Layers

This quiz covers all the topics from Unit 5. Use it to test your understanding. The answers for the first section are at the bottom.

---

## 1. Quiz Questions (Multiple Choice)

1.  The primary responsibility of the Link Layer is to move a datagram:
    a) Between two processes on the same host.
    b) From a source host to a destination host across the Internet.
    c) Between two adjacent nodes over a single link.
    d) Through the physical medium as electrical signals.

2.  Which error detection method can also correct a single-bit error?
    a) Single-bit parity
    b) Checksum
    c) Two-dimensional parity
    d) CRC

3.  CSMA/CD stands for:
    a) Carrier Sense Multiple Access with Collision Detection
    b) Carrier Sense Multiple Access with Collision Avoidance
    c) Channel Sense Medium Access with Collision Domain
    d) Channel Sense Medium Access with Collision Division

4.  A MAC address is:
    a) A 32-bit logical address assigned by a DHCP server.
    b) A 48-bit address burned into the NIC.
    c) Used to route datagrams across the global Internet.
    d) Another name for a port number.

5.  The protocol used to resolve an IP address into a MAC address on a local LAN is:
    a) DNS
    b) DHCP
    c) ARP
    d) ICMP

6.  How does a modern link-layer switch learn the location of hosts?
    a) By reading pre-configured routing tables.
    b) By using the Address Resolution Protocol.
    c) By inspecting the source MAC address of incoming frames.
    d) By querying a central controller.

7.  The "hidden terminal problem" is a key challenge in:
    a) Wired Ethernet networks
    b) Fiber-optic links
    c) Virtual LANs
    d) Wireless networks

8.  The 802.1Q protocol is used for:
    a) Error correction
    b) Tagging frames with VLAN information on a trunk link
    c) The CSMA/CA algorithm
    d) Wireless security

9.  Which of the following is a characteristic of unguided media?
    a) Immune to electromagnetic interference
    b) Signals are contained within a solid medium
    c) Includes fiber-optic cables
    d) Signals propagate freely through space

10. Frequency Hopping Spread Spectrum (FHSS) makes a signal robust by:
    a) Rapidly changing the transmission frequency.
    b) Representing each bit with a longer code.
    c) Using a parity bit for each byte.
    d) Encapsulating the signal in an IP packet.

---

## 2. Reasoning Questions

1.  Why is reliable delivery sometimes implemented at the link layer, even when TCP provides it at the transport layer?
2.  Explain why a single-bit parity check cannot detect a 2-bit error.
3.  Why is CSMA/CD ineffective in a wireless environment?
4.  Describe the process a switch follows when it receives a frame with a destination MAC address that is *not* in its table.
5.  What problem do VLANs solve in a large, switched LAN?
6.  Explain the purpose of the RTS/CTS exchange in 802.11 networks.
7.  Why is fiber-optic cable the preferred medium for long-distance, high-speed networks?
8.  Explain the difference between Time-Division Multiplexing (TDM) and Frequency-Division Multiplexing (FDM).
9.  If your computer knows the IP address of `www.google.com`, why does it still need to use ARP before sending a packet to its local router?
10. What is the difference between a MAC address and an IP address in terms of what they identify and how they are assigned?

---

## 3. Real-World Cases

1.  A network technician installs a new Ethernet switch. Within minutes, it is correctly forwarding traffic between hosts with no manual configuration. What mechanism is the switch using?
2.  An office has two departments, Sales and Engineering, on the same floor. The manager wants to ensure that employees in one department cannot easily sniff the network traffic of the other. What link-layer technology would you recommend?
3.  You are setting up a Wi-Fi network in a building with many thick concrete walls. You notice that your signal strength is very low in certain areas. Which property of wireless links does this demonstrate?
4.  A host A sends a broadcast ARP request for host B. The switch receives this frame. How does the switch handle this broadcast frame?
5.  Bluetooth devices often operate in the same 2.4 GHz frequency band as Wi-Fi. What technique does Bluetooth use to avoid being completely drowned out by a powerful Wi-Fi signal?
6.  An old office network uses a hub instead of a switch. Ten computers are connected to it. If PC 1 is sending a large file to PC 2, what is the impact on PC 3 and PC 4? What if the hub were replaced with a switch?
7.  You connect your laptop to a university's wired Ethernet port for the first time. Describe the sequence of protocols that likely run to allow you to get an IP address and then look up the MAC address of the default router. (Hint: DHCP, ARP).
8.  The data portion of a frame is `1101101`. Using even, single-bit parity, what bit is appended to the data?
9.  A router needs to send a 1600-byte IP datagram over a link with an MTU of 1500 bytes. Can the router do this if the datagram is an IPv6 datagram? What if it's IPv4?
10. Describe how a wireless access point functions as both a link-layer bridge and a MAC protocol coordinator.

---

## 4. Rapid Fire

1.  What does VLAN stand for?
2.  What is the broadcast MAC address?
3.  True or False: A link-layer switch forwards packets based on IP addresses.
4.  What does NIC stand for?
5.  CSMA/CA includes collision ______.
6.  Which error detection method is based on polynomial division?
7.  What does FHSS stand for?
8.  What is the physical medium for Wi-Fi?
9.  What protocol adds tags to Ethernet frames on a trunk link?
10. The `ping` command uses which protocol, which is neither TCP nor UDP?

---

## 5. Possible 2-Mark Exam Questions

1.  What are the two main functions of a network adapter (NIC)?
2.  What is the purpose of an ARP table?
3.  How does a link-layer switch differ from a hub?
4.  What is the "hidden terminal problem"?
5.  What is the function of the 802.1Q protocol?
6.  List two examples of guided media and one example of unguided media.
7.  What is the difference between FDM and TDM?
8.  What is the core idea behind spread spectrum techniques?
9.  Why is a MAC address also called a physical address?
10. What is a "collision" on a broadcast channel?

---
---

## Answers to Section 1 (Quiz Questions)

1.  **Answer:** c) Between two adjacent nodes over a single link.
    - **Concept:** Role of the Link Layer.
    - **Reason:** The link layer is responsible for single-hop transmission from one node to the next. Host-to-host is the network layer's job.

2.  **Answer:** c) Two-dimensional parity
    - **Concept:** Error Correction.
    - **Reason:** By identifying the intersection of the row and column with incorrect parity, 2D parity can locate and correct a single-bit error.

3.  **Answer:** a) Carrier Sense Multiple Access with Collision Detection
    - **Concept:** MAC Protocols.
    - **Reason:** CSMA/CD is the protocol used by classic Ethernet.

4.  **Answer:** b) A 48-bit address burned into the NIC.
    - **Concept:** MAC Addressing.
    - **Reason:** MAC addresses are 48 bits long and are assigned by the manufacturer of the Network Interface Card.

5.  **Answer:** c) ARP
    - **Concept:** Address Resolution Protocol.
    - **Reason:** ARP's sole purpose is to translate a known IP address into its corresponding hardware (MAC) address on the local network.

6.  **Answer:** c) By inspecting the source MAC address of incoming frames.
    - **Concept:** Switch Operation.
    - **Reason:** Switches are self-learning; they build their tables by observing the source addresses of the frames that arrive on their ports.

7.  **Answer:** d) Wireless networks
    - **Concept:** Wireless Challenges.
    - **Reason:** The hidden terminal problem occurs when two nodes are in range of a central AP but not in range of each other.

8.  **Answer:** b) Tagging frames with VLAN information on a trunk link
    - **Concept:** VLANs.
    - **Reason:** 802.1Q defines the standard for adding a VLAN tag to an Ethernet frame so it can be transported across a trunk link.

9.  **Answer:** d) Signals propagate freely through space
    - **Concept:** Transmission Media.
    - **Reason:** Unguided media, like radio waves, are not contained within a physical cable.

10. **Answer:** a) Rapidly changing the transmission frequency.
    - **Concept:** Spread Spectrum.
    - **Reason:** FHSS works by hopping between different frequencies to avoid interference at any single frequency.
