+++
title = "Lang - Test"
author = ["svejk"]
tags = ["programming", "examples"]
draft = false
+++

## Language tests in org {#language-tests-in-org}


### Rust {#rust}

```rustic
extern crate primal;

use primal::Sieve;

fn num_divisors(n: usize, primes: &Sieve) -> Option<usize> {
    match primes.factor(n) {
        Ok(factors) => Some(factors.into_iter().fold(1, |acc, (_, x)| acc * (x + 1))),
        Err(_) => None,
    }
}

fn main() {
    println!("24 days of Rust - primal (day 2)");
    let sieve = Sieve::new(10000);
    let suspect = 5273;
    println!("{} is prime: {}", suspect, sieve.is_prime(suspect));
    let not_a_prime = 1024;
    println!("{} is prime: {}", not_a_prime, sieve.is_prime(not_a_prime));
    let n = 1000;
    match sieve.primes_from(0).nth(n - 1) {
        Some(number) => println!("{}th prime is {}", n, number),
        None => println!("I don't know anything about {}th prime.", n),
    }
    println!("{:?}", sieve.factor(2610));
    println!("{:?}", num_divisors(2610, &sieve));
}
```


### C++ {#c-plus-plus}

```cpp { linenos=true, linenostart=1 }
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void){
    int niter=10; //Specify the number of samples.
    srand((unsigned)time(NULL)); //Set the seed of random number generator.
    int n_in=0; //Initialize the counter.
/*************/
/* Main loop */
/*************/
    for(int iter=1;iter<niter+1;iter++){
        double x = (double)rand()/RAND_MAX;
        double y = (double)rand()/RAND_MAX;
        //Generate random numbers x,y in [0,1].
        if(x*x+y*y < 1e0) //If xˆ2+yˆ2<1....
            n_in=n_in+1; //Add 1 to n_in.
        printf("%d %.10f\n",iter,(double)n_in/iter);}
}
```

```text
1 1.0000000000
2 1.0000000000
3 1.0000000000
4 1.0000000000
5 1.0000000000
6 1.0000000000
7 1.0000000000
8 1.0000000000
9 1.0000000000
10 1.0000000000
```

```cpp { linenos=true, linenostart=1 }
#include <iostream>
int main(){
    std::cout<<"Hello, World!\n";
    return 0;
}
```

```text
Hello, World!
```


### C# {#c}

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


### Haskell {#haskell}

```haskell
add_1 : Nat -> Nat
add_1 x = x + 1
add_1 5




```

```text
6
```


#### map {#map}

<a id="code-snippet--org-babel-haskell-formatter"></a>
```emacs-lisp
  (format "%s"
          (replace-regexp-in-string
           (rx line-start
               (+ (| alphanumeric blank "." "|" ">")))
           "" (format "%s" strr)))
```

```haskell

:{
    -- a very verbose way to sum a sequence of numbers:
    sumInts :: Int -> Int -> Int
    sumInts a b =
      if a == b
        then b
        else (+ a) $ (sumInts (a + 1) b)
:}

    map (\[a,b] -> sumInts a b) [[0, 10] , [1, 3], [1,5], [2,10]]


```

|    |   |    |    |
|----|---|----|----|
| 55 | 6 | 15 | 54 |
