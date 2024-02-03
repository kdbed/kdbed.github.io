+++
title = "C++ Programming"
author = ["svejk"]
tags = ["programming", "examples"]
draft = false
+++

## Basics {#basics}


### Hello world {#hello-world}

```cpp { linenos=true, linenostart=1 }
#include <iostream>

int main(){
    std::cout << "Hello, world." << std::endl;
}
```


## Templates {#templates}


### Basic Template {#basic-template}

```cpp { linenos=true, linenostart=1 }
#include <iostream>

template<typename T>
T add_em_up(T& lhs, T& rhs){
    return lhs + rhs;
    }

int main(){

    int a{ 72 };
    int b{ 47 };
    std::cout << add_em_up<int>(a,b) << "\n";
}
```
