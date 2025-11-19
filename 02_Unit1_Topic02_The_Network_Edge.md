---
title: "Unit 1: The Network Edge"
id: unit1-topic2
tags: [unit1, network-edge, access-networks, hosts]
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

This is the crucial part. How do our end systems (clients) actually connect to the Internet? Through an **Access Network**. The access network is the physical link that connects an end system to its **edge router**.

There are many technologies for this, broadly categorized by the physical medium they use.

### A. Home Access
How do you connect from home?
- **Digital Subscriber Line (DSL):** Uses the existing telephone line. A DSL modem separates data signals from phone signals. It's a "dedicated" line from your home to the phone company's central office.
- **Cable:** Uses the existing cable television infrastructure. A cable modem is used. It's a "shared" medium, meaning you share the connection bandwidth with your neighbors.
- **Fiber to the Home (FTTH):** The fastest option. It provides a direct fiber-optic connection to the home, offering incredible speeds.

### B. Enterprise (Company/University) Access
- **Ethernet (LAN):** This is the most common technology for wired access in companies, universities, and schools. End systems connect via Ethernet switches, which in turn connect to the institutional router.

### C. Wireless Access
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
                  |  Edge Router   |  <-- First router in the provider's network
                  +----------------+
                   ^    ^         ^
                   |    |         |
(Access Networks)  |    |         |
+------------------+----+------------------+
|                  |    |                  |
DSL/Cable/Fiber  Ethernet (LAN)         Wi-Fi/5G
(Home)           (Enterprise)         (Wireless)
|                  |    |                  |
v                  v    v                  v
+----+            +----+ +----+           +----+
| PC |            | PC | | PC |           | Phn|
+----+            +----+ +----+           +----+
 (End Systems at the Network Edge)
```

---

## Exam Focus

- **2-Mark Questions:**
    - What comprises the network edge? (Hosts and Access Networks).
    - Differentiate between a client and a server.
    - What is an access network? Give two examples. (e.g., DSL, Cable).
    - Is a home Cable internet connection a dedicated or shared medium? (Shared).

- **Potential 10-Mark Question:**
    - "Describe the different types of access networks used to connect end systems to the Internet. Explain at least three in detail."
        - **Tip:** Start by defining the network edge and access networks. Then, choose three technologies (e.g., DSL, Cable, and FTTH or Wi-Fi). For each, explain the medium it uses, the equipment involved (modem/AP), and whether it's dedicated or shared. A simple diagram will fetch extra marks.

---

We have now defined the edge of the network. The next logical step is to understand what lies beyond it: **The Network Core**.

