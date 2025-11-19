---
title: "Unit 1: What is the Internet?"
id: unit1-topic1
tags: [unit1, internet, basics, protocol]
aliases: [Introduction to the Internet]
---

# Unit 1, Topic 1: What is the Internet?

Welcome to our first topic. Before we dive deep, let's start with the most fundamental question: What *is* the Internet?

We can view the Internet from two primary perspectives:
1.  **A "Nuts and Bolts" View:** What are the physical components?
2.  **A "Services" View:** What does it do for us?

Let's break these down.

---

## 1. The "Nuts and Bolts" Perspective

From a hardware and infrastructure standpoint, the Internet is a massive, globally connected system of computer networks. The core components include:

- **Hosts or End Systems:** These are the devices at the edge of the Internet that we use every day: PCs, smartphones, servers in data centers, and smart IoT devices. They are called "end systems" because they sit at the edge of the network.

- **Communication Links:** These are the physical media that connect end systems. They come in various forms (e.g., fiber-optic cable, copper wire, radio links) and have different transmission rates, measured in **bits per second (bps)**.

- **Packet Switches:** These are specialized devices that forward chunks of data, called **packets**, through the network. The two most common types are **Routers** (in the network core) and **Link-layer Switches** (in the access network).

The entire system comes together to form a **network of networks**.

### Visualizing the Structure

```ascii
+-------------------------------------------------------------+
|                        NETWORK EDGE                         |
|                                                             |
| +----------+      +----------+        +----------+          |
| | Mobile   |      |   PC     |        | Server   |          |
| +----------+      +----------+        +----------+          |
|      |                 |                   |                |
| (Wireless)             | (Wired)           | (Wired)        |
|      |                 |                   |                |
| +-----------------+  +-----------------+   |                |
| | Access Point    |  | Ethernet Switch |   |                |
| +-----------------+  +-----------------+   |                |
|         |                  |               |                |
+---------|------------------|---------------|----------------+
          |                  |               |
          |                  |               |
+---------|------------------|---------------|----------------+
|         v                  v               v                |
| +-----------------+  +-----------------+  +-----------------+ |
| |  Edge Router 1  |--|  Edge Router 2  |--|  Edge Router 3  | |
| +-----------------+  +-----------------+  +-----------------+ |
|         |                  |                                |
|   ... --|------> NETWORK CORE (mesh of routers) <----|-- ...   |
|                                                             |
+-------------------------------------------------------------+
```

---

## 2. The "Services" Perspective

From a user's point of view, the Internet is an **infrastructure that provides services to applications**.

These applications—like the Web, email, and streaming video—are what we interact with. The Internet provides a **programming interface** (the socket API) that allows these distributed applications to send and receive data without needing to know the complex details of the underlying infrastructure.

---

## 3. What is a Protocol?

For communication to be successful, all parties involved must agree on a set of rules.

> [!note] Definition: A **protocol** defines the format and the order of messages exchanged between two or more communicating entities, as well as the actions taken on the transmission and/or receipt of a message or other event.

> [!analogy] Human Protocol for Asking the Time
> 1.  You (Host A) make eye contact with someone (Host B).
> 2.  You say, "Excuse me, do you have the time?" (A specific message format).
> 3.  Host B receives the message and understands it.
> 4.  Host B replies, "It's 2:30 PM." (Another specific message format).
> 5.  You say, "Thank you."
>
> Network protocols (like HTTP, TCP, IP) are just more formal, unambiguous versions of this same idea for computers.

---

## Exam Focus

- **2-Mark Questions:**
    - Define the Internet. (Provide both "nuts and bolts" and "services" views).
    - What is a protocol?
    - What is an end system? Give two examples.
    - List two types of packet switches.

- **Potential 10-Mark Question:**
    - "Explain the key components of the Internet from a 'nuts and bolts' perspective. Draw a diagram to illustrate the structure and describe the role of protocols."
        - **Tip:** Start by defining the Internet as a network of networks. Then, describe end systems, communication links, and packet switches. Crucially, use the diagram to show how the **network edge** (where end systems live) connects to the **network core** (the mesh of routers). Finish by defining what a protocol is and explaining that these components all use protocols to communicate with each other.


---

This gives us a solid starting point. We've defined the Internet using two different but equally important viewpoints.

