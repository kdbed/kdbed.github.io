+++
title = "Assembly Language and Computer Architecture Foundations"
author = ["svejk"]
lastmod = 2021-07-12T01:07:31-04:00
draft = false
weight = 1
+++

## Contents {#contents}


## Basic Computer Architecture {#basic-computer-architecture}

We consider the fundamentals of computer functioning, describing the core model of computation, enumerating its extensions and focusing on two of them, registers and the hardware stack.<sup id="612d99b45774438b13d3a71f05a5208e"><a href="#IgorZhirkov10" title="Igor Zhirkov, Low-Level Programming: C, Assembly, and Program Execution on Intel&#174; 64 Architecture, Apress (2017).">IgorZhirkov10</a></sup>


### The Core Architecture {#the-core-architecture}

<!--list-separator-->

-  Models of Computation

    All ideas -- algorithms included -- need precise, finite expressions.  We take a fixed set of basic actions as building blocks.  A <span class="underline">Model of Computation</span> is a set of basic operations and their respective costs.  The costs are usually integer numbers and are used to reason about the algorithms' complexity via calculating the combined cost of all their operations.  Most models of computation are also <span class="underline">abstract machines</span> : they describe a hypothetical computer whose instructions correspond to the model's basic operations.  The other type of models, decision trees, are discussed elsewhere ([decisionTrees]({{< relref "2021-07-11-decisionTrees" >}})).

<!--list-separator-->

-  Von Neumann Architecture


## Bibliography {#bibliography}

# Bibliography
<a id="IgorZhirkov10"></a>Zhirkov, I., *Low-level programming: c, assembly, and program execution on intel® 64 architecture* (2017), : Apress. [↩](#612d99b45774438b13d3a71f05a5208e)
