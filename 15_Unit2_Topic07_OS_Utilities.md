---
title: "Unit 2: Basic Operating System Utilities"
id: unit2-topic7
tags: [unit2, networking-tools, cli, ping, traceroute, dig, lsof, nslookup, netstat]
aliases: [Network Utilities]
---

# Unit 2, Topic 7: Basic Operating System Utilities

Beyond application protocols, network engineers and system administrators rely on a suite of command-line utilities to diagnose and understand network behavior. These tools are fundamental for troubleshooting.

---

## 1. ping

- **Purpose:** To test the reachability of a host and measure the round-trip time (RTT). It's the most basic "is it alive?" test.
- **How it works:** `ping` uses the **ICMP (Internet Control Message Protocol)**. It sends an "ICMP Echo Request" to the target, which is obligated to send back an "ICMP Echo Reply".
- **Example:** `$ ping google.com` shows if the host is reachable and the latency to it.

---

## 2. traceroute (or `tracert` on Windows)

- **Purpose:** To discover the network path (the sequence of routers) a packet takes to a destination.
- **How it works:** It manipulates the **Time-To-Live (TTL)** field in the IP header. It sends packets with increasing TTLs (1, 2, 3, ...), causing each successive router on the path to send back an "ICMP Time Exceeded" message, revealing its identity.
- **Example:** `$ traceroute google.com` lists all the router hops between you and the destination.

---

## 3. dig (Domain Information Groper)

- **Purpose:** A powerful tool to query DNS servers for various types of resource records (A, MX, CNAME, etc.). It's more detailed than `nslookup`.
- **How it works:** It sends a DNS query to a server and prints the full response.
- **Example:** `$ dig google.com MX` will find the mail servers for `google.com`.

---

## 4. nslookup

- **Purpose:** Like `dig`, `nslookup` is used to query DNS servers. It is older but is installed by default on both Windows and Unix-like systems.
- **Example Usage & Output:**
  ```bash
  # Simple lookup for an A record
  $ nslookup google.com
  Server:		192.168.1.1
  Address:	192.168.1.1#53

  Name:	google.com
  Address: 142.250.196.113
  ```

---

## 5. lsof (List Open Files)

- **Purpose:** A Unix/Linux utility that lists all files opened by processes. Its `-i` flag is incredibly powerful for seeing which processes are responsible for which network connections.
- **How it works:** It inspects the OS kernel's list of open file descriptors.
- **Example:** `$ sudo lsof -i :443` shows which processes have a connection on the HTTPS port.

---

## 6. netstat

- **Purpose:** A universal tool (Windows, Linux, macOS) used to display active network connections, listening ports, and routing tables.
- **How it works:** Queries the OS kernel for network state information.
- **What it tells you:** It's excellent for a quick overview of all network activity.
- **Example Usage & Output:**
  ```bash
  # List all active TCP connections and listening ports, with numeric addresses
  $ netstat -ant
  Active Internet connections (servers and established)
  Proto Recv-Q Send-Q Local Address           Foreign Address         State
  tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
  tcp        0      0 192.168.1.10:54321      172.217.16.14:443       ESTABLISHED
  ```
  - **`LISTEN`**: A process is waiting for an incoming connection on this port.
  - **`ESTABLISHED`**: An active, open connection.

---

## Exam Focus

- **2-Mark Questions:**
    - What protocol does `ping` use? (ICMP).
    - Which IP header field does `traceroute` manipulate? (The TTL field).
    - Which two utilities could you use to query for a domain's MX records? (`dig` and `nslookup`).
- **Short-Note Question (5 Marks):**
    - "Briefly describe the purpose and underlying mechanism of the `ping` and `traceroute` utilities."
        - **Tip:** For `ping`, mention ICMP Echo Request/Reply and RTT measurement. For `traceroute`, explain the incremental manipulation of the TTL field and the "ICMP Time Exceeded" messages from routers.
