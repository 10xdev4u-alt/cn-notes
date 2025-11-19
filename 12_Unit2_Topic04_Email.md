---
title: "Unit 2: Electronic Mail in the Internet"
id: unit2-topic4
tags: [unit2, application-layer, email, smtp, pop3, imap, mime]
aliases: [Email Protocols]
---

# Unit 2, Topic 4: Electronic Mail in the Internet

Electronic mail (email) is one of the most heavily used and essential applications on the Internet. Its architecture involves several components and protocols working together.

---

## 1. Core Components of the Email System

```ascii
+-------------+      +--------------------+      +--------------------+      +-------------+
| Sender's UA |----->| Sender's Mail Server |----->| Recvr's Mail Server|----->| Recvr's UA  |
+-------------+  (1) +--------------------+  (2) +--------------------+  (3) +-------------+
                     |  Message Queue   |        |     Mailbox      |
                     +------------------+        +------------------+
```

1.  **User Agents (UAs):** The software users interact with to read and compose email (e.g., Microsoft Outlook, Gmail web interface).
2.  **Mail Servers:** The workhorses of the email system. They store incoming messages in user **mailboxes** and have a **message queue** of outgoing mail.
3.  **SMTP (Simple Mail Transfer Protocol):** The protocol used to send email messages from server to server.

---

## 2. SMTP: The Push Protocol

SMTP is the principal protocol for **pushing** email messages between mail servers.

- **Transport:** It runs on **TCP** (port **25**), providing a reliable channel.
- **Push Protocol:** The sending mail server initiates the session and pushes the message to the receiving mail server.
- **ASCII Only:** A key limitation of SMTP is that message content must be in 7-bit ASCII format.

---

## 3. Email Message Format and MIME

The protocols transport the messages, but what's inside them?

- **RFC 5322 Format:** A standard email message consists of two parts, separated by a blank line:
    1.  **The Header:** A series of lines like `To:`, `From:`, `Subject:`.
    2.  **The Body:** The actual content of the message, which SMTP requires to be in 7-bit ASCII.

- **MIME (Multipurpose Internet Mail Extensions):** How do we send attachments, images, and non-English characters if SMTP only accepts ASCII? The MIME standard extends the email format to support this.
    - It adds extra headers to the message, like `Content-Type:` and `Content-Transfer-Encoding:`.
    - These headers allow the sender to declare that the message body contains, for example, a JPEG image that has been encoded into Base64 (an ASCII representation of binary data). The receiving user agent then reads these MIME headers to correctly decode and display the non-ASCII content.

---

## 4. Mail Access Protocols: POP3 and IMAP

SMTP handles sending mail *between servers*. A **mail access protocol** is needed for a user to get email from their mail server to their user agent.

### a. POP3 (Post Office Protocol - Version 3)
- **Purpose:** A very simple protocol for downloading mail.
- **Mode of Operation:** Typically operates in a "download-and-delete" mode, where emails are removed from the server once downloaded to the client. It is stateless across sessions.

### b. IMAP (Internet Message Access Protocol)
- **Purpose:** A more flexible protocol that allows users to access and manage mail that is stored *on the server*.
- **Mode of Operation:** All messages and folders are kept on the server. The user agent syncs with this server state. It is stateful across sessions.

### c. POP3 vs. IMAP at a Glance

| Feature | POP3 | IMAP |
|---|---|---|
| **Philosophy** | Simple Download | Remote Folder Management |
| **State** | Stateless across sessions | Stateful across sessions |
| **Message Storage** | On the client device | On the server |
| **Use Case** | Good for single-device access | Essential for multi-device access |

### d. Web-Based Email
- Services like Gmail use **HTTP** as the protocol between the user's browser and their mail server.
- The mail servers themselves still use **SMTP** to communicate with each other behind the scenes.

---

## 5. Exam Focus

- **2-Mark Questions:**
    - What is the difference between a user agent and a mail server?
    - Is SMTP a "push" or "pull" protocol? (Push).
    - What is the main drawback of POP3's "download-and-delete" mode?
    - What is the purpose of MIME? (To allow email to carry non-ASCII data like attachments).
- **10-Mark Question:**
    - "Explain the roles of SMTP, POP3, and IMAP in the Internet email system. Draw a simple diagram showing where each protocol is used."
        - **Tip:** Draw the diagram showing UA-to-Server and Server-to-Server. Label the Server-to-Server link as **SMTP**. Label the final Server-to-UA link as **Mail Access (POP3/IMAP)**. Describe SMTP as the push protocol and then contrast POP3 (simple download) and IMAP (remote management) as the pull protocols.
