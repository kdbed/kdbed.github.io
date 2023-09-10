+++
title = "Python - List Comprehensions"
author = ["svejk"]
tags = ["python"]
draft = false
+++

## Python - List Comprehensions {#python-list-comprehensions}

List comprehensions are a compact way of defining a list by looping
through another list or other data structure. Let's say we want to
double every element in a list. Without list comprehensions:

```python
  sample_list = [4, 5, 6, 7]

  new_list = []
  for i in range(len(sample_list)):
      new_list.append(sample_list[i]*2)

  print(new_list)
```

```text
  [8, 10, 12, 14]
```

A simplified way to do this:

```python
  newer_list = [2*num for num in sample_list]
  print(newer_list)
```

```text
  [8, 10, 12, 14]
```


### List Comprehensions on lists of strings {#list-comprehensions-on-lists-of-strings}

```python
  sample_strings = ["python", "is", "awesome!"]
  upper_case_strings = [s.upper() for s in sample_strings]
  print(upper_case_strings)
```

```text
  ['PYTHON', 'IS', 'AWESOME!']
```

```python
  words = ["zen", "of", "python"]
  word_zero = [word[0] for word in words]
  print(word_zero)
```

```text
  ['z', 'o', 'p']
```


### Looping and filtering in one step {#looping-and-filtering-in-one-step}

List comprehensions also allow conditionals in their definitions:

```python
  nums = [1, 3, 5, 7, 9, 11, 13, 15]
  new_nums = [num for num in nums if num < 9]
  print(new_nums)
```

```text
  [1, 3, 5, 7]
```


### If-else statements in list comprehensions {#if-else-statements-in-list-comprehensions}

```python
  nums2 = [1,2, 3, 5, 7, 9, 11, 13, 15]
  odd_even = ["even" if num % 2 == 0 else "odd" for num in nums2]
  print(odd_even)
```

```text
  ['odd', 'even', 'odd', 'odd', 'odd', 'odd', 'odd', 'odd', 'odd']
```

```python
  nums = [1, 3, 5, 7, 9, 11, 13, 15]

  info = ["by 5" if num % 5 == 0 else "by 3" if num % 3 == 0 else "one" if num == 1 else "other" for num in nums]
  print(info)
```

```text
  ['one', 'by 3', 'by 5', 'other', 'by 3', 'other', 'other', 'by 5']
```


### Defining a list comprehension from a dictionary {#defining-a-list-comprehension-from-a-dictionary}

```python
  mapping = {"a": 10, "b": 20, "c": 30, "d": 40, "e": 50, "f": 60, "g": 70, "h": 80}

  reduced = [key for key,val in mapping.items() if val < 40]
  print(reduced)
```

```text
  ['a', 'b', 'c']
```

```python

```


### Reference: [[<http://theautomatic.net/tutorial-on-python-list-comprehensions/> {#reference-http-theautomatic-dot-net-tutorial-on-python-list-comprehensions}

]]
