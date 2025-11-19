---
title: "Unit 5: Error-Detection and Correction Techniques"
id: unit5-topic2
tags: [unit5, link-layer, error-detection, error-correction, parity, checksum, crc]
aliases: [EDC, Error Detection]
---

# Unit 5, Topic 2: Error-Detection and Correction Techniques

Data traveling across a physical link is not immune to corruption. Electromagnetic noise and signal attenuation can cause bits to flip (a 0 becomes a 1, or vice versa). The link layer must be able to detect, and sometimes even correct, these errors.

The general principle is to add extra bits, called **Error-Detection and Correction (EDC)** bits, to the data. The receiver uses these bits to check the integrity of the received data.

---

## 1. Parity Checks

This is the simplest form of error detection.

### a. Single-Bit Parity
- **How it works:** A single extra bit, the **parity bit**, is added to a block of data.
    - **Even Parity:** The parity bit is chosen such that the total number of '1's in the data plus the parity bit is *even*.
    - **Odd Parity:** The parity bit is chosen so that the total number of '1's is *odd*.
- **Example (Even Parity):**
    - Data: `0110101` (contains four '1's, which is even) -> Parity Bit: `0` -> Sent: `01101010`
    - Data: `1101001` (contains four '1's, which is even) -> Parity Bit: `0` -> Sent: `11010010`
- **Limitation:** A single parity bit can only detect an *odd* number of bit errors (1, 3, 5, etc.). If an even number of bits flip (e.g., two bits), the parity will still appear correct, and the error will go undetected.

### b. Two-Dimensional Parity
This is a more robust method that can both detect and correct some errors.
- **How it works:** The data bits are arranged in a grid. A parity bit is calculated for each row and each column.
- **Example:** Data `101101011100` arranged in a 3x4 grid with even parity:
  ```
          c1 c2 c3 c4
        +-----------+--+
     r1 | 1  0  1  1 | 1| (Row Parity)
     r2 | 0  1  0  1 | 0|
     r3 | 1  1  0  0 | 0|
        +-----------+--+
          |  |  |  |
         (Col Parity)
          0  0  1  0
  ```
- **Error Detection:** This scheme can detect all 1, 2, and 3-bit errors, and most 4-bit errors.
- **Error Correction:** Crucially, it can **correct any single-bit error**. If one bit flips, both its row parity and its column parity will be incorrect. The intersection of the incorrect row and column pinpoints the exact bit that flipped, allowing the receiver to correct it.

---

## 2. Checksums

This technique, which we saw in the transport layer, is also used at the link layer.
- **How it works (recap):** The sender treats the data as a sequence of numbers and calculates their sum. A variation of this sum (typically the 1s complement) is placed in the header as the checksum. The receiver performs the same calculation. If the results don't match, an error is detected.

---

## 3. Cyclic Redundancy Check (CRC)

CRC is the most powerful and widely used error-detection technique in modern link-layer protocols like Ethernet, Wi-Fi, and PPP. It is based on the mathematics of polynomial division.

- **Core Idea:** Treat bit strings as representations of polynomials. For a `d`-bit piece of data `D`, we can think of it as a degree `d-1` polynomial.
- **How it works (High Level):**
    1.  **Generator:** The sender and receiver agree on a common `r+1` bit pattern, called the **Generator** (`G`).
    2.  **Calculation at Sender:**
        - The sender adds `r` zero bits to the end of the `d`-bit data `D`.
        - It performs a binary division of this `d+r` bit string by the generator `G`.
        - The `r`-bit remainder from this division, `R`, is the CRC code.
    3.  **Transmission:** The sender replaces the `r` zero bits with the calculated remainder `R` and transmits the `d+r` bit string.
    4.  **Verification at Receiver:** The receiver gets the `d+r` bit string and divides it by the same generator `G`.
        - If the remainder is **zero**, there are no detected errors.
        - If the remainder is **non-zero**, an error has occurred, and the frame is discarded.

- **Power of CRC:** A well-chosen generator `G` can detect all single-bit errors, all double-bit errors, all odd-numbered bit errors, and, most importantly, all "burst errors" (a sequence of corrupted bits) of length less than or equal to `r`. This makes it extremely effective at detecting the types of errors common in physical media.

---

## Exam Focus
- **2-Mark Questions:**
    - What is the limitation of single-bit parity? (It cannot detect an even number of bit errors).
    - How can two-dimensional parity correct a single-bit error? (By identifying the intersection of the row and column with the incorrect parity).
    - What is the most common error-detection technique used in modern link-layer protocols like Ethernet? (CRC).
- **10-Mark Question:**
    - "Compare and contrast single-bit parity, two-dimensional parity, and Cyclic Redundancy Check (CRC) as error-detection techniques. Explain the specific advantages of 2D parity and CRC over simpler methods."
        - **Tip:** For single-bit parity, highlight its simplicity but significant limitations. For 2D parity, emphasize its ability to *correct* single-bit errors. For CRC, explain that it's the most powerful, based on polynomial division, and is especially good at detecting burst errors.
