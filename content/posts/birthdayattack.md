+++
title = "Birthday Attack"
author = ["Kyle Bednar"]
tags = ["hashCollision", "hashes", "securityPlus"]
draft = false
+++

## Birthday Paradox {#birthday-paradox}


### Problem Statement {#problem-statement}

What is the probability that at least two people in a group share the same birthday?


### Assumptions {#assumptions}

-   365 days in a year (ignore leap years)
-   Birthdays are uniformly distributed
-   Each person's birthday is independent


### Key Insight {#key-insight}

It is easier to compute the complement:

Probability(at least one shared birthday) =
1 - Probability(no shared birthdays)


### Probability Derivation {#probability-derivation}

For n people:

-   Person 1: 365/365
-   Person 2: 364/365
-   Person 3: 363/365
-   ...
-   Person n: (365 - n + 1) / 365

So:

\\[
P(no\ match) = \frac{365}{365} \cdot \frac{364}{365} \cdot \frac{363}{365} \cdots \frac{365-n+1}{365}
\\]

\\[
P(match) = 1 - P(no\ match)
\\]


### Key Results {#key-results}

| People | Probability of Match |
|--------|----------------------|
| 10     | 11.7%                |
| 20     | 41.1%                |
| 23     | 50.7%                |
| 30     | 70.6%                |
| 50     | 97.0%                |
| 70     | 99.9%                |


### Why It’s Counterintuitive {#why-it-s-counterintuitive}

People assume:
"There are 365 days, so we need ~180 people."

But actually:

-   We compare **pairs**, not individuals vs a fixed date
-   Number of pairs:

\\[
\frac{n(n-1)}{2}
\\]

Example:

-   n = 23 → 253 comparisons


### Intuition {#intuition}

-   Probability grows **nonlinearly**
-   Around 23 people → ~50%
-   Around 50 people → almost certain


### Real-World Notes {#real-world-notes}

-   Birthdays are not perfectly uniform
-   Seasonal effects exist
-   Twins increase clustering slightly

Despite this, the approximation is very accurate.


## Hash Collision Analysis (Birthday Paradox Applied) {#hash-collision-analysis--birthday-paradox-applied}


### Core Idea {#core-idea}

A hash function maps a large input space into a finite output space.

This is mathematically identical to:

-   People → inputs
-   Birthdays → hash outputs

So:

-   A "collision" = two inputs producing the same hash


### Birthday Bound {#birthday-bound}

For a hash with N possible outputs:

\\[
N = 2^k
\\]

The number of random inputs needed for ~50% collision probability:

\\[
n \approx 1.2 \cdot \sqrt{N} = 1.2 \cdot 2^{k/2}
\\]


### Key Insight {#key-insight}

-   You do NOT need 2^k attempts to find a collision
-   You only need ~2^(k/2)

This is the **birthday attack**


### Examples {#examples}

| Hash Size | Possible Outputs | ~50% Collision at |
|-----------|------------------|-------------------|
| 32-bit    | 2^32             | ~2^16 ≈ 65K       |
| 64-bit    | 2^64             | ~2^32 ≈ 4B        |
| 128-bit   | 2^128            | ~2^64             |
| 256-bit   | 2^256            | ~2^128            |


### Security Implications {#security-implications}


#### Weak Hashes {#weak-hashes}

-   32-bit or 64-bit hashes are trivially collision-prone
-   Unsafe for identifiers or security use


#### Cryptographic Hashes {#cryptographic-hashes}

Designed to resist:

-   Collision attacks
-   Preimage attacks

Examples:

-   MD5 → broken (collisions practical)
-   SHA-1 → broken (collision attacks demonstrated)
-   SHA-256 → currently secure


### Attack Types {#attack-types}


#### Birthday Attack {#birthday-attack}

Goal:

-   Find ANY two inputs with same hash

Complexity:
\\[
O(2^{k/2})
\\]


#### Preimage Attack {#preimage-attack}

Goal:

-   Given hash H, find input that produces it

Complexity:
\\[
O(2^k)
\\]


#### Second Preimage Attack {#second-preimage-attack}

Goal:

-   Given input A, find different input B with same hash

Complexity:
\\[
O(2^k)
\\]


### Practical Security Takeaways {#practical-security-takeaways}

-   Doubling hash size squares attack difficulty
-   128-bit security requires 256-bit hashes (collision resistance)
-   Never rely on:
    -   Short hashes
    -   Truncated hashes without analysis


### Real-World Applications {#real-world-applications}


#### Where Collisions Matter {#where-collisions-matter}

-   File integrity verification
-   Digital signatures
-   Certificate systems (PKI)
-   Blockchain


#### Where Collisions Can Break Systems {#where-collisions-can-break-systems}

-   Deduplication systems
-   Cache keys
-   Session IDs
-   Object storage identifiers


### Example Intuition {#example-intuition}

If you generate random 64-bit IDs:

-   After ~4 billion IDs
-   You have a ~50% chance of at least one collision

This surprises many engineers and leads to:

-   Silent data corruption risks
-   ID conflicts at scale


### Optional: Approximation Formula {#optional-approximation-formula}

\\[
P(\text{collision}) \approx 1 - e^{-\frac{n(n-1)}{2N}}
\\]

Where:

-   n = number of inputs
-   N = total hash space


## [ComptTIA Security+]({{< relref "securityplus.md" >}}) {#compttia-security-plus--securityplus-dot-md}
