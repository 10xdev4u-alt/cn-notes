---
title: "Unit 2 Quiz"
id: unit2-quiz
tags: [unit2, quiz, revision]
aliases: [Unit 2 Test]
---

# Unit 2 Quiz: Application Layer

This quiz covers all the topics from Unit 2. Use it to test your understanding. The answers for the first section are at the bottom.

---

## 1. Quiz Questions (Multiple Choice)

1.  Which protocol is stateless?
    a) FTP
    b) HTTP
    c) IMAP
    d) TCP

2.  To send an email from a mail server to another mail server, which protocol is used?
    a) POP3
    b) IMAP
    c) SMTP
    d) HTTP

3.  In the DNS hierarchy, which servers know the addresses of the authoritative servers for a specific domain (e.g., `google.com`)?
    a) Root DNS Servers
    b) Local DNS Servers
    c) Top-Level Domain (TLD) Servers
    d) Authoritative DNS Servers themselves

4.  The primary advantage of a P2P architecture over client-server for large file distribution is:
    a) Centralized control
    b) Better security
    c) Lower latency for all applications
    d) Self-scalability

5.  The `traceroute` utility uses which protocol and IP header field?
    a) TCP and the port number
    b) UDP and the checksum
    c) ICMP and the TTL field
    d) DNS and the query ID

6.  Which DNS record type is used to map a hostname to an IPv4 address?
    a) AAAA
    b) CNAME
    c) MX
    d) A

7.  Which socket API call is used only by a TCP server and not a UDP server?
    a) `socket()`
    b) `bind()`
    c) `listen()`
    d) `recv()`

8.  Cookies are used to:
    a) Ensure reliable data transfer
    b) Help servers maintain state information about a user
    c) Reduce network latency by caching content
    d) Translate hostnames into IP addresses

9.  FTP is unique because it:
    a) Is a stateless protocol
    b) Can only transfer text files
    c) Uses UDP for fast transfers
    d) Uses a separate control connection and data connection

10. A user on a laptop reads their email, and the same emails are also perfectly synced on their phone. They are most likely using:
    a) POP3
    b) IMAP
    c) SMTP
    d) FTP

---

## 2. Reasoning Questions

1.  Why does HTTP use TCP instead of UDP?
2.  What is the difference between a persistent and a non-persistent HTTP connection? Which is better and why?
3.  Explain the purpose of DNS caching and the role of the TTL.
4.  Why is FTP considered a "stateful" protocol?
5.  What is the "tit-for-tat" mechanism in BitTorrent and why is it important?
6.  Explain the difference between a recursive and an iterative DNS query.
7.  What is the "download-and-delete" mode in POP3, and what is its main disadvantage?
8.  Explain what the command `lsof -i :80` would be used for.
9.  Why does a TCP server need both a "listening" socket and a "connection" socket?
10. If you `ping` a host and get no reply, what are two possible reasons for the failure?

---

## 3. Real-World Cases

1.  You type `www.example.com` into your browser and press Enter. Describe the role DNS plays before HTTP even begins.
2.  An online game developer needs to choose a transport protocol for their real-time game data. Would they choose TCP or UDP? Justify your answer.
3.  A company wants to set up a system for employees to upload large reports. They are considering using FTP. What is one advantage and one disadvantage of this approach compared to a web-based HTTP upload form?
4.  A university's network administrator notices that the campus's Internet connection is saturated. After investigating, they find that thousands of students are using BitTorrent to download a new movie. Why is BitTorrent consuming so much bandwidth compared to everyone streaming from a single source like Netflix?
5.  You receive an email with an image in it. Since SMTP only supports 7-bit ASCII, how was the image file transferred?
6.  You are on a corporate network that uses a proxy server for web browsing. You request a popular news website. Explain how the proxy can speed up this request. What mechanism does it use to ensure the content is not stale?
7.  A developer is building a simple TCP chat application. They run their server code and it seems to hang at the `accept()` call. Is this an error? Explain what is happening.
8.  You use the `dig` command to look up the MX records for `gmail.com`. What information are you looking for, and which Internet application uses this information?
9.  You try to `traceroute` to a server, but after a few hops, you see `* * *` for all subsequent hops. What does this mean?
10. Your friend complains that their email client (using POP3) on their laptop has all their emails, but their phone has none of the old ones. Explain to them why this is happening.

---

## 4. Rapid Fire

1.  What does FTP stand for?
2.  Is HTTP stateless or stateful?
3.  What port does SMTP traditionally use?
4.  Name the two main P2P incentive mechanisms in BitTorrent.
5.  Which socket call associates a socket with a port number?
6.  What does `404` mean in an HTTP response?
7.  True or False: DNS uses TCP.
8.  What protocol does `ping` use?
9.  Which is more complex: POP3 or IMAP?
10. Does a UDP client call `connect()`?

---

## 5. Possible 2-Mark Exam Questions

1.  What is a socket?
2.  Differentiate between a P2P and a client-server architecture.
3.  What is a web cache?
4.  List two DNS resource record types and their functions.
5.  Why is TCP unsuitable for some real-time applications like online gaming?
6.  What is out-of-band control in the context of FTP?
7.  What information does a `Cookie:` header contain?
8.  What is the purpose of the `accept()` call in TCP socket programming?
9.  What is a TLD server in the DNS hierarchy?
10. How does `traceroute` discover the path to a destination?

---
---

## Answers to Section 1 (Quiz Questions)

1.  **Answer:** b) HTTP
    - **Concept:** Protocol State.
    - **Reason:** HTTP is designed to be stateless; the server doesn't remember past requests. FTP and IMAP are stateful. TCP is also stateful (it tracks connection state), but it's a transport protocol, not an application protocol in the same sense.

2.  **Answer:** c) SMTP
    - **Concept:** Email Protocols.
    - **Reason:** SMTP is the "push" protocol used to transfer email between mail servers. POP3 and IMAP are for user access.

3.  **Answer:** c) Top-Level Domain (TLD) Servers
    - **Concept:** DNS Hierarchy.
    - **Reason:** The `.com` TLD server knows the addresses of the authoritative servers for domains ending in `.com`.

4.  **Answer:** d) Self-scalability
    - **Concept:** P2P Architecture.
    - **Reason:** In a P2P system, each new peer adds to the total system capacity, allowing it to scale effectively.

5.  **Answer:** c) ICMP and the TTL field
    - **Concept:** Network Utilities.
    - **Reason:** `traceroute` works by sending packets with incrementally increasing TTL values and listening for the "ICMP Time Exceeded" messages from routers.

6.  **Answer:** d) A
    - **Concept:** DNS Records.
    - **Reason:** An `A` record maps a hostname to an IPv4 address. `AAAA` is for IPv6.

7.  **Answer:** c) `listen()`
    - **Concept:** Socket Programming.
    - **Reason:** Only connection-oriented servers (TCP) need to listen for and accept incoming connections. `listen()` and `accept()` are unique to TCP servers.

8.  **Answer:** b) Help servers maintain state information about a user
    - **Concept:** HTTP Cookies.
    - **Reason:** Cookies are the primary mechanism used to add state (like a session ID or shopping cart) to the otherwise stateless HTTP protocol.

9.  **Answer:** d) Uses a separate control connection and data connection
    - **Concept:** FTP Architecture.
    - **Reason:** FTP's "out-of-band" control via a separate TCP connection (port 21) is its most distinct architectural feature.

10. **Answer:** b) IMAP
    - **Concept:** Mail Access Protocols.
    - **Reason:** IMAP keeps all messages and folders synchronized on the server, making it ideal for accessing email from multiple devices. POP3 typically downloads and deletes emails.
