---
title: "Unit 1: What is the Internet?"
id: unit1-topic1
tags: [unit1, internet, basics]
aliases: [Introduction to the Internet]
---

# Unit 1, Topic 1: What is the Internet?

Welcome to the first topic of our journey into Computer Networks! Before we dive deep, let's start with the most fundamental question: What *is* the Internet?

We can view the Internet from two primary perspectives:
1.  **The "Nuts and Bolts" View:** What are the physical components?
2.  **The "Services" View:** What does it do for us?

Let's break these down.

---

## 1. The "Nuts and Bolts" Perspective

From a hardware and infrastructure standpoint, the Internet is a massive, globally connected system of computer networks.

> [!note] Definition: A computer network is simply two or more computers connected together to share resources and exchange data. The Internet is a **network of networks**.

The core components include:

- **Hosts or End Systems:** These are the devices at the edge of the Internet that we use every day. Examples include your PC, smartphone, smart TV, servers in a data center, and even IoT devices like a smart thermostat. They are called "end systems" because they sit at the edge of the network.

- **Communication Links:** These are the physical media that connect end systems. They come in various forms:
    - **Wired:** Coaxial cable, Copper wire (like in LAN cables), Fiber-optic cable.
    - **Wireless:** Radio waves (WiFi, 4G/5G cellular), Satellite links.
    - **Transmission Rate:** The speed of a link is measured in **bits per second (bps)**. Common rates are Mbps (megabits), Gbps (gigabits), etc.

- **Packet Switches:** These are specialized devices that forward data through the network. The two most common types are:
    - **Routers:** Used in the network core to connect different networks.
    - **Link-layer Switches:** Typically used in access networks (like your home or university campus).

Data is sent through the network in chunks called **packets**. Imagine sending a large book through the mail. Instead of sending the whole book at once, you tear it into individual pages, send each page in a separate envelope, and the recipient reassembles them. The Internet does this with data.

### Visualizing the Structure

Here is a simple ASCII diagram to illustrate these components:

```ascii
      +------------------+      +------------------+
      | Smartphone (End)|      |   Server (End)   |
      +------------------+      +------------------+
              |                        |
(Wireless Link)|                        |(Wired Link)
              |                        |
         +----------+            +----------+
         |  Access  |            |  Access  |
         |  Router  |------------|  Router  |
         +----------+ (Network   +----------+
                           Core)       |
                                       |
                                +------------------+
                                |    PC (End)      |
                                +------------------+
```

---

## 2. The "Services" Perspective

From a user's point of view, we don't often think about the routers and cables. We think about what the Internet allows us to do.

> [!note] Definition: From a services perspective, the Internet is an **infrastructure that provides services to applications**.

These applications—like the Web, email, streaming video, and online gaming—are what we interact with. The Internet provides the underlying programming interface, often called **sockets**, that allows these applications to send and receive data.

This perspective highlights a key principle of the Internet's design: the separation of the applications from the underlying network. The network's job is simply to move data from one end system to another. It doesn't need to know *what* that data is (whether it's an email or a video frame).

---

## Exam Focus

For your exams, this topic is foundational. You can expect questions like:

- **2-Mark Questions:**
    - Define the Internet. (Provide both "nuts and bolts" and "services" views).
    - What is an end system? Give two examples.
    - What is a packet switch?
    - List two types of communication links.

- **Potential 10-Mark Question:**
    - "Explain the components of the Internet from a 'nuts and bolts' perspective. Draw a simple diagram to illustrate the structure."
        - **Tip:** Start by defining the Internet. Then, describe end systems, communication links, and packet switches in detail. Use the ASCII diagram provided and explain how they connect. Conclude by mentioning how data travels in packets.

---

This gives us a solid starting point. We've defined the Internet using two different but equally important viewpoints.

