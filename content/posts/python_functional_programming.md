+++
title = "Python - Functional Programming"
author = ["svejk"]
draft = false
+++

## Functions as parameters {#functions-as-parameters}

Write a simple function that takes a function as a parameter:

```python { linenos=true, linenostart=1 }
def inch2cm(x):
    return x*2.54
def convert(f,x):
    y = f(x)
    print(x,"=>",y)

convert(inch2cm, 3)

# a function to convert celsius to fahrenheit
def c2f(x):
    return x*1.8 + 32

convert(c2f,18)

# convert integers to text
def i2text(x):
    text = ['zero','one','two','three']
    return text[x]

convert(i2text,2)
```


### The sorted function {#the-sorted-function}

The built in `sorted` function will order numbers or alphabetize strings. The optional parameter `key` accepts a function:

```python { linenos=true, linenostart=1 }
p = ['red', 'green', 'blue', 'yellow', 'cyan']
q = sorted(p, key=len)
print(q)

# sort a list of tuples by area
def area(x):
    return x[0]*x[1]

p = [(3, 3), (4, 2), (2, 2), (5, 2), (1, 7)]
q = sorted(p, key=area)
print(q)

```


## Lambda functions {#lambda-functions}
