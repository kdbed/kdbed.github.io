---
id: a3c1aea3-62c8-4414-b957-6339df6619cf
title: PowerShell - Classes
---

- <a href="#powershell---classes-1" id="toc-powershell---classes-1">PowerShell - Classes</a>
  - <a href="#introduction" id="toc-introduction">Introduction</a>
  - <a href="#student-class" id="toc-student-class">Student Class</a>
  - <a href="#methods" id="toc-methods">Methods</a>
    - <a href="#return-is-mandatory" id="toc-return-is-mandatory"><code>return</code> is mandatory</a>
- <a href="#references" id="toc-references">References</a>

# [PowerShell](id:86716c7a-447f-4c8f-94ed-87dc6f79f0af) - Classes

## Introduction

PowerShell is an object-oriented language. When you run commands, see the output on your screen, those are objects.

Skeleton of a class called `student`:

``` powershell
class student {

        }
```

Classes have properties that look like parameters that are attributes that describe that class. The example below shows a class called student with two properties; `FirstName` and `LastName`.

When you define a property, you should always define a type that sets a specific *schema* for what property values can hold. In the example below, both properties are defined as strings.

## Student Class

Class with two properties:

``` powershell
class student {
    [string]$FirstName
    [string]$LastName
}
```

After you define a class, create an object from it or instantiate an object. There are multiple ways to instantiate objects from classes; one common way is to use type accelerators such as \[student\] which represent the class, followed by a default method that comes with every class called new().

Using the type accelerator shortcut is the same as creating an object using the New-Object command. `New-Object -TypeName student`

Once you've created an object from that class, then assign values to properties. The example below is assigning values of *Tyler* and *Muir* for the `FirstName` and `LastName` properties.

``` powershell
class student {
    [string]$FirstName
    [string]$LastName
}
$student1 = [student]::new()
$student1.FirstName = 'Tyler'
$student1.LastName = 'Muir'
$student1 | Get-Member
$student1 | Write-Output
```

Notice that Get-Member returns four methods and two properties. The properties probably look familiar, but the methods sure don't. PowerShell adds certain methods by default, but you can add your own methods or even modify the default methods.

## Methods

Defining methods with a *scriptblock*

``` powershell
[<output type>]<name>() {
    <code that runs when the method is executed>
}
```

Method parameters set set inside the parentheses ().

### `return` is mandatory

PowerShell functions will return objects by simply placing the object anywhere in the function; if a method returns an object, you must use the return construct as shown below.

``` powershell
[string]GetName() {
    return 'foo'
}
```

# References

Taken from: [ATA](https://adamtheautomator.com/powershell-classes/)
