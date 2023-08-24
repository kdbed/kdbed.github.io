+++
title = "Lang - Test"
author = ["svejk"]
draft = false
+++

```rustic

  extern crate regex;

  use regex::Regex;

  fn main() {
      let re = Regex::new(r"^\d{4}-\d{2}-\d{2}$").unwrap();
      println!("test");
      assert!(re.is_match("2014-01-01"));
}
```

```cpp { linenos=true, linenostart=1 }
#include <iostream>
int main(){
    std::cout<<"Hello, World.\n";
    return 0;
}
```

```text
Hello, World.
```

```csharp { linenos=true, linenostart=1 }

// Hello World! program
namespace HelloWorld
{
    class Hello {
        static void Main(string[] args)
        {
            System.Console.WriteLine("Hello World!");
        }
    }
}
```

```text
Hello World!
```
