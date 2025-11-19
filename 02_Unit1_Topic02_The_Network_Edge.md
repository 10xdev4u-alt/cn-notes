---
title: "Unit 1: The Network Edge"
id: unit1-topic2
tags: [unit1, network-edge, access-networks, hosts, dsl, ftth]
aliases: [Network Edge]
---

# Unit 1, Topic 2: The Network Edge

In our last topic, we introduced the "nuts and bolts" view of the Internet. Now, let's zoom in on one of its most important parts: **The Network Edge**.

As the name suggests, the network edge is the boundary of the network. It's where we, the users, and our devices connect to the vast global Internet.

> [!note] Definition: The Network Edge consists of **hosts (or end systems)** and the **access networks** that connect them to the first router (the "edge router") on the path to the global Internet.

Let's look at these two components.

---

## 1. Hosts: Clients and Servers

We already know hosts as **end systems**. They can be broadly classified into two categories:

- **Clients:** These are devices that typically request and receive information. Your desktop PC, laptop, and smartphone are common clients.
- **Servers:** These are powerful computers that store and distribute information to clients. When you watch a YouTube video, your device (the client) is requesting the video file from a YouTube server. Servers often reside in large data centers.

It's a simple relationship: clients request, and servers serve.

---

## 2. Access Networks

This is the crucial part. How do our end systems (clients) actually connect to the Internet? Through an **Access Network**. The access network is the network that physically connects an end system to its **edge router**.

### a. Home Access
This category includes technologies used to connect residential homes to their Internet Service Provider (ISP).

- **Digital Subscriber Line (DSL):**
    - **Physical Medium:** Uses the existing telephone line (twisted-pair copper wire).
    - **How it works:** A DSL modem separates data signals from traditional phone signals on the line. Frequencies are different, so you can surf the web and talk on the phone simultaneously.
    - **Nature:** This is a **dedicated** connection from the home to the phone company's central office.

- **Cable:**
    - **Physical Medium:** Uses the existing cable television infrastructure (coaxial cable).
    - **How it works:** A cable modem is used. Data is sent over specific frequency channels on the cable.
    - **Nature:** This is a **shared** medium. Everyone in a neighborhood shares the same link, so performance can degrade if many people are using it heavily at the same time.

- **Fiber to the Home (FTTH):**
    - **Physical Medium:** A dedicated optical fiber from the central office directly to the home.
    - **How it works:** Provides for incredible speeds by converting electrical signals to light for transmission.
    - **Nature:** A **dedicated** fiber link, offering the highest speeds and best performance.

| Technology | Physical Medium | Nature | Common Equipment |
|---|---|---|---|
| **DSL** | Twisted-Pair Copper | Dedicated | DSL Modem |
| **Cable** | Coaxial Cable | Shared | Cable Modem |
| **FTTH** | Fiber-Optic Cable | Dedicated | Optical Network Terminal (ONT) |

### b. Enterprise (Company/University) Access
- **Ethernet (LAN):** This is the most common technology for wired access in companies, universities, and schools. End systems connect via Ethernet (twisted-pair copper wire) to an Ethernet switch, which in turn connects to the institutional router.

### c. Wireless Access
- **Wireless LAN (WLAN):** We all know this as **Wi-Fi**. In a WLAN, users connect wirelessly to an **Access Point (AP)**, which is then connected via a wired link (usually Ethernet) to the broader network.
- **Wide-Area Wireless Access:** This is what our smartphones use, connecting via a cellular provider's network (e.g., 4G, 5G). The connection is made to a nearby cell tower.

### Visualizing Access Networks

```ascii
                  +----------------+
                  | Internet Core  |
                  +----------------+
                         ^
                         |
                  +----------------+
                  |  Edge Router   |  <-- First router in the ISP's network
                  +----------------+
                   ^      ^         ^
                   |      |         |
(Access Networks)  |      |         |
+------------------+------+------------------+
|                  |      |                  |
Home Access      Enterprise Access    Wireless Access
(DSL/Cable/Fiber)  (Ethernet)           (Wi-Fi/5G)
|                  |                         |
v                  v                         v
+-------+        +-------+               +----------+
| Modem |        | Switch|               | Access   |
+-------+        +-------+               | Point/Tower|
    |                  |                         |
    v                  v                         v
+----+            +----+ +----+               +----+
| PC |            | PC | | PC |               |Phne|
+----+            +----+ +----+               +----+
 (End Systems at the Network Edge)
```

---

## Exam Focus

- **2-Mark Questions:**
    - What comprises the network edge? (Hosts and Access Networks).
    - Differentiate between a client and a server.
    - Is a home Cable internet connection a dedicated or shared medium? Explain why. (Shared, because neighbors share the same physical cable line capacity).

- **Potential 10-Mark Question:**
    - "Describe the different types of access networks used to connect end systems to the Internet. For home access, compare and contrast DSL, Cable, and FTTH."
        - **Tip:** Start by defining the network edge and access networks. Then, create a table (like the one above) to compare the three home access technologies based on their physical medium and shared/dedicated nature. Finish by briefly describing enterprise (Ethernet) and wireless access.

---

We have now defined the edge of the network. The next logical step is to understand what lies beyond it: **The Network Core**.

