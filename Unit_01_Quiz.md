---
title: "Unit 1 Quiz"
id: unit1-quiz
tags: [unit1, quiz, revision]
aliases: [Unit 1 Test]
---

# Unit 1 Quiz: Introduction to Computer Network & Internet

This quiz covers all the topics from Unit 1. Use it to test your understanding. The answers for the first section are at the bottom.

---

## 1. Quiz Questions (Multiple Choice)

1.  Which of the following is NOT a source of packet delay?
    a) Processing delay
    b) Queuing delay
    c) Signal delay
    d) Transmission delay

2.  The time it takes to push all of a packet's bits onto a link is the:
    a) Propagation delay
    b) Transmission delay
    c) Queuing delay
    d) Processing delay

3.  The Internet is primarily a:
    a) Circuit-switched network
    b) Packet-switched network
    c) Telephone network
    d) FDM network

4.  Which layer of the TCP/IP stack is responsible for routing datagrams from source to destination?
    a) Link Layer
    b) Transport Layer
    c) Network Layer
    d) Application Layer

5.  The process of adding a header at each layer as data moves down the protocol stack is called:
    a) Encapsulation
    b) Decapsulation
    c) Multiplexing
    d) Store-and-forward

6.  A DDoS attack is most accurately described as:
    a) An attempt to steal a user's password
    b) An attack from many sources to make a server unavailable
    c) A piece of self-replicating malware
    d) The act of forging a source IP address

7.  The "fathers" of the TCP/IP protocol are:
    a) Tim Berners-Lee and Marc Andreessen
    b) Leonard Kleinrock and Paul Baran
    c) Vint Cerf and Robert Kahn
    d) Ray Tomlinson

8.  Which home access technology uses a shared broadcast medium?
    a) DSL
    b) FTTH
    c) Cable
    d) Dial-up

9.  A data unit at the Link Layer is called a:
    a) Segment
    b) Datagram
    c) Message
    d) Frame

10. The primary motivation for the top-down approach to studying networking is:
    a) It builds from physical principles
    b) It is more systematic
    c) It provides context by starting with user-facing applications
    d) It is the only correct way to learn

---

## 2. Reasoning Questions

1.  Why is packet switching generally more efficient than circuit switching for typical Internet traffic?
2.  Explain the "store-and-forward" mechanism in packet switching and how it contributes to delay.
3.  If two links on a path have transmission rates of 100 Mbps and 10 Mbps, what is the end-to-end throughput and why?
4.  Why is layering considered beneficial in the design of complex network protocols?
5.  How does encryption defend against packet sniffing?
6.  Explain the difference between a virus and a worm. Why are worms generally considered more dangerous?
7.  Why was the invention of the World Wide Web so critical to the Internet's popular growth?
8.  Describe the key responsibilities of the Transport Layer.
9.  Can a packet experience zero queuing delay at a router? If so, under what condition?
10. Differentiate clearly between transmission delay and propagation delay using an analogy.

---

## 3. Real-World Cases

1.  A popular e-commerce site goes down on a major shopping day. News reports call it a massive DDoS attack. Describe what is likely happening to the site's servers and network link.
2.  You are using the public Wi-Fi at a coffee shop to check your bank balance. What specific type of attack are you most vulnerable to, and what technology protects you?
3.  Your home internet speed is advertised as "up to 100 Mbps," but a download from a university server is only moving at 5 Mbps. What is the most likely cause for this discrepancy?
4.  An employee at a company receives an email with a document named "Yearly-Bonus-Info.docx.exe". They run it, and soon after, the entire company network is filled with junk traffic. What likely happened?
5.  You are video-conferencing with someone across the ocean. You sometimes see them freeze and then speed up. Which type of delay is most responsible for this "jitter"?
6.  Describe the path a simple HTTP request takes through the 5-layer protocol stack, starting from your browser. Name the data unit at each stage.
7.  A smart thermostat in a home is compromised and becomes part of a botnet. What two main types of malicious activity could this thermostat now be forced to participate in?
8.  Why does your phone, a client device, need a server (like Google's or Apple's) to receive push notifications?
9.  Explain the roles of a router and an Ethernet switch in your university's network. Where would you typically find each?
10. The ARPANET was funded by the Department of Defense. What was their motivation for creating a decentralized, packet-switched network? (Hint: think about network survivability).

---

## 4. Rapid Fire

1.  What does HTTP stand for?
2.  Name the data unit at the Transport Layer.
3.  Is TCP connection-oriented or connectionless?
4.  What is the "killer app" of the ARPANET?
5.  True or False: A router operates at the Link Layer.
6.  What does DNS stand for?
7.  The physical address of a network interface card is its ___ address.
8.  Who invented the WWW?
9.  Which organization developed the ARPANET?
10. Is queuing delay fixed or variable?

---

## 5. Possible 2-Mark Exam Questions

1.  Define end system and give two examples.
2.  What is a botnet?
3.  Differentiate between FDM and TDM.
4.  What is a protocol?
5.  List the five layers of the TCP/IP stack.
6.  Why is the "shared medium" nature of Cable internet a potential drawback?
7.  What is IP Spoofing?
8.  Define throughput. What is a bottleneck link?
9.  What was the role of the NSFNET?
10. What is the function of a packet switch?

---
---

## Answers to Section 1 (Quiz Questions)

1.  **Answer:** c) Signal delay
    - **Concept:** Sources of Nodal Delay.
    - **Reason:** The four sources of delay are Processing, Queuing, Transmission, and Propagation. "Signal delay" is not a standard term in this context.

2.  **Answer:** b) Transmission delay
    - **Concept:** Transmission Delay.
    - **Reason:** Transmission delay is defined as `L/R`, the time required to place the packet of length L onto the link of rate R.

3.  **Answer:** b) Packet-switched network
    - **Concept:** Network Core Architecture.
    - **Reason:** The Internet is built on the principles of packet switching for efficiency and flexibility with bursty data traffic.

4.  **Answer:** c) Network Layer
    - **Concept:** Protocol Layers.
    - **Reason:** The Network Layer (specifically the IP protocol) is responsible for logical addressing and end-to-end routing of datagrams.

5.  **Answer:** a) Encapsulation
    - **Concept:** Encapsulation.
    - **Reason:** Encapsulation is the process of wrapping data with a header at each successive layer as it moves down the stack.

6.  **Answer:** b) An attack from many sources to make a server unavailable
    - **Concept:** Network Attacks.
    - **Reason:** A Distributed Denial-of-Service (DDoS) attack uses a distributed platform (botnet) to overwhelm a target with traffic.

7.  **Answer:** c) Vint Cerf and Robert Kahn
    - **Concept:** Internet History.
    - **Reason:** Cerf and Kahn designed the TCP/IP protocols in their 1974 paper on "internetting".

8.  **Answer:** c) Cable
    - **Concept:** Access Networks.
    - **Reason:** Cable internet uses the shared coaxial cable infrastructure of a neighborhood, meaning bandwidth is shared among users. DSL and FTTH provide a dedicated line to the central office/provider.

9.  **Answer:** d) Frame
    - **Concept:** Protocol Data Units (PDUs).
    - **Reason:** The PDU at the Link Layer is called a frame. It is a segment at the Transport Layer and a datagram at the Network Layer.

10. **Answer:** c) It provides context by starting with user-facing applications
    - **Concept:** Learning Approaches.
    - **Reason:** The top-down approach is motivational because it starts with familiar applications, showing the need for the underlying network services.
