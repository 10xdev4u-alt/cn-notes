---
title: "Unit 1: Networks Under Attack"
id: unit1-topic7
tags: [unit1, security, malware, dos, ddos, sniffing, spoofing]
aliases: [Network Security Threats]
---

# Unit 1, Topic 7: Networks Under Attack

The Internet connects billions of devices and transmits vast amounts of sensitive data. Unfortunately, this makes it a prime target for malicious activity. This topic provides a brief overview of the common ways networks are attacked.

> [!warning] A Sobering Fact
> The Internet was originally designed with a goal of open, trusted communication among a small group of researchers. Security was not a primary design consideration, and the consequences of this are still being dealt with today.

---

## 1. Malware

Malware (malicious software) is any software intentionally designed to cause damage to a computer, server, client, or computer network.

- **Viruses:** Malicious code that attaches itself to executable files. A virus requires a user to run the infected file to spread.
- **Worms:** A more active form of malware. A worm can self-replicate and spread from computer to computer without any user interaction, often by exploiting a security vulnerability in the target system.
- **Botnet:** A network of thousands of malware-infected computers (called "bots"), which can be controlled remotely by an attacker (the "botmaster") to launch large-scale attacks.

---

## 2. Denial-of-Service (DoS) Attacks

The goal of a DoS attack is not to steal information, but to render a network, host, or other resource **unavailable** to its legitimate users.

There are three main categories:

### a. Bandwidth Flooding
The attacker sends a massive volume of packets to the target's network link, congesting it with useless traffic. Legitimate packets are unable to get through.

### b. Connection Flooding
The attacker establishes a large number of TCP connections with the target server. Since servers have a finite limit on the number of connections they can maintain, this can exhaust the server's resources, preventing legitimate users from connecting.

### c. Distributed Denial-of-Service (DDoS)
This is the most powerful and common form of DoS. The attacker uses a botnet (see above) to launch a bandwidth flood from many different sources simultaneously.

```ascii
+----------+
| Attacker |
+----------+
     |
     v
+----------+
| Botnet C&C| (Command & Control)
+----------+
     |
     +--------------------------+
     |           |              |
     v           v              v
+----------+ +----------+   +----------+
| Bot Host | | Bot Host |...| Bot Host |
+----------+ +----------+   +----------+
     |           |              |
     +-----------+--------------+
                 |
                 v
           +----------+
           |  Target  |
           |  Server  |
           +----------+
```
Because the attack traffic comes from thousands of different IP addresses, it is very difficult to distinguish from legitimate traffic and block effectively.

---

## 3. Packet Sniffing

A **packet sniffer** is a program that can record a copy of every packet that passes by it.

- **How it works:** An attacker places a sniffer on a network (e.g., a compromised machine or a malicious Wi-Fi access point). They can then "eavesdrop" on all traffic.
- **Defense:** The best defense against sniffing is **encryption**. If data is encrypted (like with HTTPS for websites), an attacker can sniff the packets, but the content will be unreadable garbage to them.

---

## 4. IP Spoofing

This is the act of creating an IP packet with a **forged source IP address**.

- **How it works:** An attacker sends a packet but puts a different, fake IP address in the "from" field.
- **Why it's used:**
    - To hide the attacker's true identity.
    - To perform certain attacks where the attacker doesn't need to see the response from the target (e.g., some types of DoS attacks).

---

## Exam Focus

- **2-Mark Questions:**
    - Define a DDoS attack.
    - What is the difference between a virus and a worm?
    - What is packet sniffing? What is the primary defense against it?
    - Define IP spoofing.
- **10-Mark Question:**
    - "Describe the main categories of attacks that networks face. Explain Denial-of-Service (DoS) attacks in detail, including the different types and the role of a botnet."
        - **Tip:** Start by listing the main attack forms (Malware, DoS, Sniffing, Spoofing). Then, focus on DoS. Define its goal (unavailability). Explain bandwidth flooding and connection flooding. Finally, explain how a DDoS attack leverages a botnet to amplify the attack and make it harder to defend against. Use a diagram for the DDoS attack structure.

---

With this understanding of the threats, we can better appreciate the security mechanisms we'll see in later units. The final topic in Unit 1 will be a look back at the history of the Internet.
