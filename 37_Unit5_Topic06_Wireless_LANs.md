---
title: "Unit 5: Wireless Links and LANs"
id: unit5-topic6
tags: [unit5, link-layer, wireless, wifi, 802-11, csma-ca]
aliases: [Wireless LANs, Wi-Fi]
---

# Unit 5, Topic 6: Wireless Links and LANs

We now turn our attention from wired links to wireless links, which have their own unique set of challenges and require different protocols to manage. The most prevalent wireless LAN technology is **Wi-Fi**, defined by the **IEEE 802.11** family of standards.

---

## 1. Characteristics and Challenges of Wireless Links

Wireless links are fundamentally different from wired links, introducing several challenges:

- **Signal Attenuation:** The strength of a wireless signal decreases as it travels through space. This limits the effective range of communication.
- **Interference:** Signals from other sources (other Wi-Fi networks, Bluetooth devices, microwave ovens, etc.) can interfere with and corrupt the transmission.
- **Multipath Propagation:** The radio signal reflects off objects like walls and buildings. This causes the receiver to get multiple copies of the signal at slightly different times, which can blur the signal and increase the error rate.
- **The Hidden Terminal Problem:** This is a classic problem in wireless networking. Consider an Access Point (AP) with two stations, A and C, on opposite sides. A and C can both "hear" the AP, but they are out of range of each other.
    - If A and C both sense the channel is idle and try to transmit to the AP at the same time, a **collision will occur at the AP**.
    - However, neither A nor C will be aware of this collision because they cannot hear each other's transmission. This makes simple Collision Detection (like in Ethernet) impossible.

```ascii
  (A) )) ... (( AP )) ... (( (C)
   ^                     ^
   |---------------------|
     (A and C cannot hear each other)
```

---

## 2. IEEE 802.11 Wireless LANs (Wi-Fi)

The basic architecture of a Wi-Fi network consists of:
- **Stations (STA):** The wireless end-user devices, like laptops, smartphones, etc.
- **Access Point (AP):** A central base station that acts as a bridge between the wireless stations and the wired network infrastructure (e.g., an Ethernet switch).
- **Basic Service Set (BSS):** The collection of all stations associated with a single Access Point.

### The 802.11 MAC Protocol: CSMA/CA
Because of the hidden terminal problem and the fact that radios cannot easily transmit and receive at the same time (making Collision Detection impractical), 802.11 uses a different protocol: **CSMA/CA (Carrier Sense Multiple Access with Collision *Avoidance*)**.

The goal is to try to *avoid* collisions before they happen.

#### The CSMA/CA Mechanism
1.  **Carrier Sense (CS):** If the station senses the channel is idle, it waits a short, specified amount of time (a DIFS - Distributed Inter-frame Space). If the channel remains idle during this time, it then transmits its frame.
2.  **Acknowledgements (ACKs):** Due to the high error rate and potential for collisions, 802.11 uses explicit acknowledgements for every frame.
    - After a station receives a frame, it waits a very short time (a SIFS - Short Inter-frame Space) and then sends back an ACK frame.
    - If the original sender **does not receive an ACK** within a certain timeout period, it assumes the frame was lost (due to a collision or error) and retransmits it, using a binary exponential backoff scheme similar to Ethernet.

This `SIFS -> ACK` sequence is atomic and has priority over any other station trying to transmit, ensuring the ACK can be sent without collision.

### The RTS/CTS Solution to the Hidden Terminal Problem
CSMA/CA with ACKs helps, but it doesn't completely solve the hidden terminal problem. For this, 802.11 has an optional mechanism: **RTS/CTS (Request to Send / Clear to Send)**.

1.  A station `A` that wants to send a large data frame first sends a small **RTS** frame to the AP.
2.  The AP, upon receiving the RTS, broadcasts a **CTS** frame to all stations in its BSS. This CTS frame essentially says, "Everybody be quiet for a specified duration, because `A` is about to transmit."
3.  Station `C` (the hidden terminal) doesn't hear `A`'s RTS, but it *does* hear the AP's CTS. It therefore knows not to transmit for the specified duration, avoiding a collision at the AP.
4.  Station `A` receives the CTS and, knowing the channel is reserved, sends its data frame.

This adds overhead, so it's typically only used for frames that are larger than a certain threshold.

---

## Exam Focus
- **2-Mark Questions:**
    - What is the "hidden terminal problem"?
    - What does CSMA/CA stand for, and how does it differ from CSMA/CD? (Collision Avoidance vs. Collision Detection).
    - What is the purpose of the RTS/CTS exchange in 802.11? (To mitigate the hidden terminal problem).
- **10-Mark Question:**
    - "Explain why CSMA/CD is not suitable for wireless LANs. Describe the CSMA/CA protocol, including the role of acknowledgements, used in IEEE 802.11."
        - **Tip:** Start by explaining the hidden terminal problem and the impracticality of collision detection for radios. Then, describe the "listen before talk" carrier sense part of CSMA/CA. Critically, explain that reliability is achieved via per-frame ACKs, and if an ACK is not received, the frame is assumed lost and retransmitted. Mentioning RTS/CTS as an additional mechanism for collision avoidance is a key detail.
