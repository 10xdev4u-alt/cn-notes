---
title: "Unit 2: File Transfer Protocol (FTP)"
id: unit2-topic3
tags: [unit2, application-layer, ftp, file-transfer, ftps, sftp]
aliases: [FTP]
---

# Unit 2, Topic 3: File Transfer: FTP

After exploring the web with HTTP, we'll now look at one of the Internet's oldest and most fundamental applications: the **File Transfer Protocol (FTP)**. As its name implies, FTP is a protocol specifically designed to transfer files from one host to another.

---

## 1. FTP's Unique Architecture: Two TCP Connections

The most defining characteristic of FTP, and a key difference from HTTP, is that it uses **two parallel TCP connections** to manage a session: a control connection and a data connection.

```ascii
+------------+                               +------------+
| FTP Client |                               | FTP Server |
+------------+                               +------------+
      |                                              |
      |--------- CONTROL CONNECTION (Port 21) ------>| (Commands: USER, PASS, LIST, RETR, STOR)
      |          (Stays open for entire session)     |
      |                                              |
      |                                              |
      |<---------- DATA CONNECTION (Port 20) --------| (Actual file data is transferred here)
      |         (Opens/closes for each file)         |
      |                                              |
```

### a. The Control Connection
- **Purpose:** To send control information between the client and server. This includes commands from the client (like `USER`, `PASS`, `LIST`, `RETR` for retrieve, `STOR` for store) and replies from the server.
- **Port:** The server listens for incoming control connections on port **21**.
- **Lifecycle:** This connection is established at the start of the session and remains open for the entire duration.
- **"Out-of-Band" Control:** Because the control information is sent on a separate connection from the data, FTP is said to have **out-of-band** control.

### b. The Data Connection
- **Purpose:** To transfer the actual file data.
- **Port:** The server sends data from port **20** (in active mode).
- **Lifecycle:** A new data connection is created **for every single file** that is transferred. After the file is transferred, this connection is closed.

---

## 2. FTP is a Stateful Protocol

Unlike HTTP, which is stateless, **FTP is a stateful protocol**.

- **What this means:** The FTP server maintains state about the user throughout the session. Because the control connection persists, the server remembers:
    - Who the user is (they are logged in).
    - What directory the user is currently in on the remote server.
- This allows for a more interactive, command-line session feel.

---

## 3. Sample FTP Command/Reply Interaction

The stateful, out-of-band control connection works like a command-line session. The client sends commands, and the server responds with 3-digit status codes.

```
CONTROL CONNECTION (Port 21)
+------------+                               +------------+
| FTP Client |                               | FTP Server |
+------------+                               +------------+
      |                                              |
      | --- USER chris ---------------------------> |
      | <--------- 331 User name okay, need password|
      | --- PASS ******* -------------------------> |
      | <-------------------- 230 User logged in.  |
      | --- LIST ---------------------------------> |
      | <--------- 150 Opening data connection.    |
      |                                              |
      | <--(File listing sent on DATA CONNECTION)-- |
      |                                              |
      | <--------- 226 Transfer complete.           |
      | --- QUIT ---------------------------------> |
      | <-------------------- 221 Goodbye.          |
      |                                              |
```

---

## 4. Active vs. Passive Mode

This topic deals with how the data connection is established, which is important for navigating firewalls.

- **Active Mode (Original):** The client tells the server a port to connect back to. The **server initiates** the data connection back to the client. This is often blocked by client-side firewalls.

- **Passive Mode (Modern Standard):** The client asks the server for a port to connect to. The **client initiates** both the control and data connections to the server. This is much more firewall-friendly.

---

## 5. Security Warning: FTP is Insecure

> [!warning] FTP is an old protocol and is fundamentally insecure. All information, including usernames, passwords, commands, and file contents, is sent over the network in **cleartext**. This makes it extremely vulnerable to packet sniffing.

For this reason, standard FTP should not be used today. Secure alternatives are:
- **FTPS (FTP over SSL/TLS):** This wraps the standard FTP session in a layer of TLS encryption, just like HTTPS does for HTTP.
- **SFTP (SSH File Transfer Protocol):** This is not related to FTP. It is a completely different protocol that runs over an encrypted SSH session and is the modern standard for secure file transfers.

---

## Exam Focus

- **2-Mark Questions:**
    - What is the primary difference between FTP and HTTP in terms of connections? (FTP uses two parallel TCP connections; HTTP uses one).
    - What is meant by FTP's "out-of-band" control? (Control and data are sent on separate connections).
    - Is FTP stateful or stateless? Explain. (Stateful; the server remembers user information throughout the session).
- **10-Mark Question:**
    - "Describe the architecture of the File Transfer Protocol (FTP). Explain the roles of the control and data connections and why FTP is considered a stateful protocol, contrasting it with HTTP."
        - **Tip:** Draw the diagram showing the two connections. Clearly label the control (port 21) and data (port 20) connections. Explain that control is for commands/replies and persists, while data is for file contents and is transient. Contrast this with HTTP's single connection and stateless nature. Mentioning the security flaw of cleartext passwords is also a good point.
