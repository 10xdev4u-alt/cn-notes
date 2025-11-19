---
title: "Unit 2: DNS—The Internet’s Directory Service"
id: unit2-topic5
tags: [unit2, application-layer, dns, resource-records]
aliases: [DNS, Domain Name System]
---

# Unit 2, Topic 5: DNS—The Internet’s Directory Service

Humans prefer to use mnemonic, easy-to-remember hostnames like `www.google.com`. However, network routers and devices operate on numeric IP addresses like `142.250.196.78`. The **Domain Name System (DNS)** is the critical application-layer protocol that translates between these two.

> [!note] Definition: DNS is a distributed database implemented in a hierarchy of DNS servers, and an application-layer protocol that allows hosts to query that database to resolve hostnames into IP addresses. It's often called the "phonebook of the Internet."

---

## 1. Services Provided by DNS

While hostname-to-IP translation is its primary job, DNS provides several other important services:
- **Host Aliasing:** A host can have multiple names. DNS can be used to find the *canonical hostname* for a given alias.
- **Mail Server Aliasing:** For a given email address like `user@example.com`, DNS finds the hostname of the mail server for the `example.com` domain (using special `MX` records).
- **Load Distribution:** A single, popular hostname (like `google.com`) can be associated with a *set* of IP addresses, each for a different replicated server. When clients query DNS for the name, DNS distributes the load by rotating the order of the IP addresses in its replies.

---

## 2. How DNS Works: A Distributed, Hierarchical Database

A centralized design for DNS would be a terrible idea. Instead, DNS uses a **hierarchical architecture** of Root, Top-Level Domain (TLD), and Authoritative servers. In addition, every client connects to a **Local DNS Server**, which acts as a proxy to the hierarchy.

---

## 3. Iterative vs. Recursive Queries & The Full Query Chain

- **Recursive Query:** A query where the server is obligated to find the full answer on the client's behalf. **This is how a host talks to its local DNS server.**
- **Iterative Query:** A query where the server replies with the address of the *next* server to ask. **This is how DNS servers talk to each other.**

### Example: The Full Query Chain
Let's trace the steps to resolve `www.example.com`.

```ascii
+----------+   (1) Query: www.example.com    +-----------------+
|          |------------------------------->|                 |
|  Client  |    (Recursive Query)            | Local DNS Server|
|   Host   |<-------------------------------| (e.g., your ISP) |
|          | (8) Reply: IP Address           |                 |
+----------+                                 +-----+-----------+
                                                  |   ^ (Iterative Queries)
 (2) Query: www.example.com  |   | (3) Reply: .com TLD Servers' Addresses
                             v   |
                         +------------+
                         | Root Server|
                         +------------+
                             |   ^
 (4) Query: www.example.com  |   | (5) Reply: example.com Auth. Servers' Addresses
                             v   |
                         +------------+
                         | TLD Server |
                         |   (.com)   |
                         +------------+
                                 |   ^
 (6) Query: www.example.com      |   | (7) Reply: IP Address for www.example.com
                                 v   |
                       +---------------------+
                       | Authoritative Server|
                       |   (for example.com) |
                       +---------------------+
```
1.  Your host sends a **recursive query** to your Local DNS Server.
2.  The Local DNS server begins an **iterative query**, starting by asking a Root Server.
3.  The Root Server replies with the address of the `.com` TLD Server.
4.  The Local DNS server asks the `.com` TLD Server.
5.  The `.com` TLD Server replies with the address of the authoritative server for `example.com`.
6.  The Local DNS server asks the `example.com` Authoritative Server.
7.  The Authoritative Server returns the final IP address.
8.  The Local DNS Server sends the final answer back to your host and caches it.

---

## 4. DNS Caching

To improve performance and reduce traffic, DNS responses are **cached**. When a local DNS server receives a mapping, it stores this information. The next time someone asks for the same hostname, the local server can return the answer immediately. These cached entries expire after a period of time called the **Time-to-Live (TTL)**.

---

## 5. DNS Records

The DNS database stores **Resource Records (RRs)** in the format `(Name, Value, Type, TTL)`. The most common types are:
- `Type=A`: `A` stands for Address. `value` is an IPv4 address.
- `Type=AAAA`: `value` is an IPv6 address.
- `Type=NS`: `NS` is for Name Server. `value` is the hostname of an authoritative DNS server for the domain `name`. This is how the DNS hierarchy delegates authority.
- `Type=CNAME`: `CNAME` is for Canonical Name. `value` is the canonical (true) hostname for the alias `name`.
- `Type=MX`: `MX` is for Mail eXchange. `value` is the hostname of the mail server for the domain `name`.

---

## Exam Focus

- **2-Mark Questions:**
    - What is the primary function of DNS? (To translate hostnames to IP addresses).
    - List the three types of servers in the DNS hierarchy. (Root, TLD, Authoritative).
    - Differentiate between an iterative and a recursive DNS query.
- **10-Mark Question:**
    - "Explain how DNS resolves a hostname into an IP address. Describe the roles of the different server types and contrast iterative and recursive queries using a diagram."
        - **Tip:** Draw the diagram above, showing your host, a local DNS server, a root server, a TLD server, and an authoritative server. Use numbered arrows to show the sequence of messages, clearly labeling the recursive part and the iterative part.
