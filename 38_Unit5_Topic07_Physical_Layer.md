---
title: "Unit 5: The Physical Layer"
id: unit5-topic7
tags: [unit5, physical-layer, transmission-media, multiplexing, spread-spectrum]
aliases: [Physical Layer, Transmission Media]
---

# Unit 5, Topic 7: The Physical Layer

We have reached the bottom of our protocol stack: the **Physical Layer** (Layer 1). This layer's job is to move the individual *bits* that make up a link-layer frame from one node to the next. It is concerned with the physical properties of the transmission medium and how 0s and 1s are represented as physical signals.

---

## 1. Transmission Media

The transmission medium is the physical path between a transmitter and a receiver. Media can be classified as guided or unguided.

### a. Guided Media
Signals are guided and contained within a solid medium.
- **Twisted-Pair Copper Wire:** This consists of two insulated copper wires twisted together to reduce electrical interference from outside sources. It is the dominant medium for modern Ethernet (e.g., Cat 5, Cat 6 cables) and was used in traditional telephone networks.

- **Coaxial Cable:** A central copper conductor is surrounded by a layer of insulation, which is then shielded by a braided outer conductor. This shielding provides better noise immunity and higher bandwidth than twisted-pair, making it suitable for cable television and early Ethernet.

- **Fiber-Optic Cable:** Transmits data as pulses of light through an extremely thin glass or plastic fiber.
    - **Advantages:** It is the preferred medium for high-speed, long-distance communication due to its extremely high bandwidth, low signal attenuation (degradation over distance), and complete immunity to electromagnetic interference. It forms the backbone of the global Internet.

### b. Unguided Media
Signals propagate freely through space (wireless).
- **Radio:** Signals are broadcast in the electromagnetic spectrum. They are easy to install but are subject to environmental factors like signal attenuation and interference from other sources. Radio waves are used for Wi-Fi, Bluetooth, 4G/5G cellular, and satellite communication.

---

## 2. Multiplexing at the Physical Layer

Multiplexing is the technique of combining multiple signals for transmission over a single shared link.

- **Frequency-Division Multiplexing (FDM):** The frequency spectrum of the link is divided into distinct bands. Each signal is assigned its own private frequency band for the duration of the transmission. This is used in traditional radio and television broadcasting.

- **Time-Division Multiplexing (TDM):** Time on the link is divided into frames, which are further divided into a fixed number of time slots. Each signal is assigned a specific time slot in each repeating frame.

---

## 3. Spread Spectrum

Spread spectrum is a set of techniques used primarily in wireless communication to make a signal more robust against interference and harder to intercept. The core idea is to "spread" the signal's energy over a much wider frequency band than is strictly necessary.

### a. Frequency Hopping Spread Spectrum (FHSS)
- **How it works:** The transmitter and receiver agree on a pseudorandom sequence of frequencies. The transmitter rapidly "hops" between these frequencies, sending a small amount of data at each one.
- **Robustness:** An interfering signal at a specific frequency will only corrupt the data for the very brief moment the transmission is using that frequency. The rest of the data remains intact.
- **Example:** Bluetooth uses FHSS.

### b. Direct Sequence Spread Spectrum (DSSS)
- **How it works:** Each bit of the original data is represented by a longer, higher-rate bit sequence called a **chipping sequence** (or spreading code). For example, a '1' bit might be represented by the 11-bit sequence `10110111000`, and a '0' bit by its inverse.
- **Robustness:** This spreads the signal's energy across a wide band. The receiver, which knows the chipping sequence, can use it to "de-spread" the signal and recover the original data, even in the presence of significant noise and interference.
- **Example:** DSSS is used in some Wi-Fi standards (802.11b) and is a core technology in GPS.

---

## Exam Focus
- **2-Mark Questions:**
    - Name two types of guided transmission media. (Twisted-Pair, Coaxial, Fiber-Optic).
    - What is the primary advantage of fiber-optic cable? (Extremely high bandwidth and immunity to EMI).
    - What is the difference between FDM and TDM? (FDM shares the channel by frequency; TDM shares it by time).
- **Short-Note Question (5 Marks):**
    - "What is spread spectrum, and what is its purpose? Briefly describe the two main spread spectrum techniques."
        - **Tip:** Define spread spectrum as spreading a signal over a wide frequency band for robustness. Then briefly explain FHSS (hopping between frequencies) and DSSS (representing each bit with a longer code).
