---
title: "Unit 1: Networks Under Attack"
id: unit1-topic7
tags: [unit1, security, malware, dos, mitm, sniffing, spoofing]
aliases: [Network Security Threats]
---

# Unit 1, Topic 7: Networks Under Attack

The Internet connects billions of devices, making it a prime target for malicious activity. This topic provides an overview of the common ways networks are attacked.

> [!warning] A Sobering Fact
> The Internet was originally designed for open, trusted communication. Security was not a primary design consideration, and the consequences of this are still being dealt with today.

---

## 1. The Goals of Network Security (The CIA Triad)

Before looking at attacks, it's helpful to understand what network security aims to protect. The goals are often summarized by the "CIA Triad":
- **Confidentiality:** Ensuring that data is only readable by authorized parties. Packet sniffing and MitM attacks violate this.
- **Integrity:** Ensuring that data has not been altered in transit.
- **Availability:** Ensuring that the network and its services are available to legitimate users. DoS attacks directly violate this.

---

## 2. Common Forms of Attack

### a. Malware
Malware (malicious software) is any software designed to cause damage or compromise a system.
- **Viruses & Worms:** Viruses attach to files and require user action to spread. Worms are more active and can self-propagate across the network by exploiting vulnerabilities.
- **Botnet:** A network of thousands of malware-infected computers (called "zombies" or "bots"), which can be controlled remotely by an attacker to launch large-scale attacks.

### b. Denial-of-Service (DoS) Attacks
The goal of a DoS attack is to render a resource **unavailable** to its legitimate users by overwhelming it with bogus traffic.
- **Distributed Denial-of-Service (DDoS):** This is the most powerful form of DoS, launched from a botnet.

```ascii
+----------+
| Attacker |
+----------+
     | (Issues commands)
     v
+----------+
| Botnet C&C| (Command & Control Server)
+----------+
     |
     +--------------------------+
     |           |              |
     v           v              v
+----------+ +----------+   +----------+
| Zombie 1 | | Zombie 2 |...| Zombie N | (Compromised Hosts)
+----------+ +----------+   +----------+
     |           |              |
     +----(Coordinated Flood)---+
                 |
                 v
           +----------+
           |  Target  |
           |  Server  |
           +----------+
```
Because the attack traffic comes from thousands of different sources, it is very difficult to block.

### c. Man-in-the-Middle (MitM) Attack
In a MitM attack, the attacker secretly positions themselves between two communicating parties.
- **How it works:** The attacker intercepts the communication, relaying messages between the two parties and making them believe they are talking directly to each other.
- **Threat:** The attacker can eavesdrop on the entire conversation (violating confidentiality) and even alter the messages in transit (violating integrity). A common place for this is on an unsecured public Wi-Fi network.

### d. Packet Sniffing
This is a passive attack where the attacker records a copy of every packet that passes by.
- **Defense:** The best defense against sniffing is **encryption** (e.g., using HTTPS, WPA2/3). If data is encrypted, an attacker can still sniff the packets, but the content will be unreadable to them.

### e. IP Spoofing
This is the act of creating an IP packet with a **forged source IP address** to hide the sender's identity or impersonate another system.

---

## Exam Focus

- **2-Mark Questions:**
    - What are the three goals of the CIA security triad? (Confidentiality, Integrity, Availability).
    - Define a DDoS attack.
    - What is a Man-in-the-Middle attack?
- **10-Mark Question:**
    - "Describe the main categories of attacks that networks face. For each, explain the threat it poses to the principles of confidentiality, integrity, or availability."
        - **Tip:** Structure your answer by attack type. For DoS, link it to violating **Availability**. For Packet Sniffing and MitM, link them to violating **Confidentiality**. For MitM, also mention that it can violate **Integrity** if the attacker modifies packets. This shows a deeper understanding of the "why" behind security.
