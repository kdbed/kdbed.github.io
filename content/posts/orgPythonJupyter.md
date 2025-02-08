+++
title = "Org Mode - Python/Jupyter Example"
author = ["svejk"]
tags = ["example", "jupyter", "python", "org-roam", "org"]
draft = false
+++

## Create a Session {#create-a-session}

Initialize server with org-babel-exp-src-block.  Afterwards, 'Enter' in the sourceblock will execute.

```python
print('hello, world')
a = 10
```


### Create a plot {#create-a-plot}

```python
import matplotlib, numpy
matplotlib.use('Agg')
import matplotlib.pyplot as plt
fig=plt.figure(figsize=(4,2))
x=numpy.linspace(-15,15)
plt.plot(numpy.sin(x)/x)
fig.tight_layout()
plt.savefig('python-matplot-fig.png')
return 'python-matplot-fig.png' # return filename to org-mode
```


## Ocaml {#ocaml}

```ocaml
print_string "Hello world!\n"
```
