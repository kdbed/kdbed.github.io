---
id: 53e1afbc-f7c3-408c-a2c5-08522bfaf9f5
title: Org Mode - Python/Jupyter Example
---

- <a href="#create-a-session" id="toc-create-a-session">Create a Session</a>
  - <a href="#create-a-plot" id="toc-create-a-plot">Create a plot</a>
- <a href="#ocaml" id="toc-ocaml">Ocaml</a>

# Create a Session

Initialize server with org-babel-exp-src-block. Afterwards, 'Enter' in the sourceblock will execute.

``` python
print('ello, world!')
```

## Create a plot

``` python
import matplotlib.pyplot as plt
fig, ax = plt.subplots()
ax.plot([1, 2, 3, 4], [1, 4, 2, 3])
pass
```

# Ocaml

``` ocaml
print_string "Hello world!\n"
```
