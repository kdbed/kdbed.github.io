+++
title = "Collatz conjecture"
author = ["svejk"]
draft = false
+++

## Collatz conjecture {#collatz-conjecture}

The Collatz conjecture[a] is one of the most famous unsolved problems in mathematics. The conjecture asks whether repeating two simple arithmetic operations will eventually transform every positive integer into 1. It concerns sequences of integers in which each term is obtained from the previous term as follows: if a term is even, the next term is one half of it. If a term is odd, the next term is 3 times the previous term plus 1. The conjecture is that these sequences always reach 1, no matter which positive integer is chosen to start the sequence. The conjecture has been shown to hold for all positive integers up to 2.95×10^20, but no general proof has been found.

In modular arithmetic notation, define the function f as follows:

\\[
f(n) = \begin{cases}
\dfrac{n}{2} & \text{if } n \equiv 0 \pmod{2}, \\\\
3n + 1 & \text{if } n \equiv 1 \pmod{2}.
\end{cases}
\\]

Now form a sequence by performing this operation repeatedly, beginning with any positive integer, and taking the result at each step as the input at the next.

In notation:

\\[
a\_i = \begin{cases}
n & \text{for } i = 0, \\\\
f(a\_{i-1}) & \text{for } i > 0.
\end{cases}
\\]

The Collatz conjecture is: This process will eventually reach the number 1, regardless of which positive integer is chosen initially.
