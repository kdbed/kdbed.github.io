+++
title = "Rust Programming"
author = ["svejk"]
tags = ["programming"]
draft = false
+++

## Basics {#basics}


### Hello World {#hello-world}

```rustic { linenos=true, linenostart=1 }
// comment
fn main() {
    // print text to console
    println!("Hello World");
    println!("I'm a Rustacean!");

}
```


### Comments {#comments}

```rustic { linenos=true, linenostart=1 }
fn main(){
    // line comment

    /* block comment
     * continued
     * ...
     */

    let x = 5 + 90 + 5;
    println!("Is `x` 10 or 100? x = {}", x);
}
```


### Formatted Print {#formatted-print}

Printing is handled by a series of `macros` defined in `std::fmt`, some of which are:

-   `format!`  : write formatted text to `String`
-   `print!`   : same as `format!` but text is printed to console (io:stdout)
-   `println!` : same as `print!` but new line appended
-   `eprint!`  : same as `print!` but text is printed to standard error (io::stderr)
-   `eprintln!`: same as `eprint!` but new line is appended

<!--listend-->

```rustic { linenos=true, linenostart=1 }
fn main() {
    // In general, the `{}` will be automatically replaced with stringified arguments
    println!("{} days", 31);

    // positional arguments can be used, starting at 0
    println!("{0}, this is {1}. {1}, this is {0}", "Alice", "Bob");

    // named arguments
    println!("{subject} {verb} {object}",
        object="the lazy dog",
        subject="the quick brown fox",
        verb="jumps over");

    // format char after `:`
    println!("Base 10:               {}", 69420); //69420
    println!("Base 2 (binary):       {:b}", 69420);
    println!("Base 8 (octal):        {:o}", 69420);//207454
    println!("Base 16 (hexadecimal): {:x}", 69420);//10f2c
    println!("Base 16 (hexadecimal): {:X}",69420);//10F2C

    // right-justify text with specified width
    println!("{number:>5}", number=1);

    // pad numbers with extras zeroes
    println!("{number:0>5}", number=1); // 00001
    println!("{number:0<5}", number=1); // 10000
    println!("{number:0>width$}", number=1, width=5);

    // rust checks to ensure correct number of arguments

    // only types that implement fmt::Display can be formatted with `{}`; user-defined types do not have this by default

    let number: f64 = 1.0;
    let width: usize = 5;
    println!("{number:>width$}");


    let pi: f64 = 3.141592;
    println!("pi is approximately {pi:.prec$}", prec=3);


}
```


## Examples {#examples}


### Sieve {#sieve}

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
