+++
title = "The Action Principle"
author = ["svejk"]
tags = ["eulerLagrange", "action", "physics"]
draft = false
+++

## The Action Principle {#the-action-principle}

Define the Lagrangian as the following combination of the kinetic energy \\(T\\) and the potential energy \\(V\\):

\\[
L = T - V
\\]

\\(L\\) is a function of the coordinates \\(x\\) and the velocity \\(\dot{x}\\), which are treated as independent variables.
For a point particle

\\[
L(x,\dot{x}) = \frac{1}{2}m \sum\_{i=1}^D (\dot{x}^i)^2 - V(x)
\\]

Taking derivatives

\begin{align\*}
\frac{\partial L}{\partial x^i} &= - \frac{\partial V}{\partial x^i} \\\\
\frac{\partial L}{\partial \dot{x}^i} &= m \dot{x}^i
\end{align\*}

Using Newton's equations, it follows that

\\[
\boxed{0 = \frac{\partial L}{\partial x^i} - \frac{d}{dt}\left(\frac{\partial L}{\partial \dot{x}^i}\right)}
\\]

These are the Euler-Lagrange equations.
