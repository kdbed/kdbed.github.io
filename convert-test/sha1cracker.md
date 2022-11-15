---
id: 9ecc66d6-d120-4ab0-9fcd-c2550b052d8f
title: sha1Cracker
---

- <a href="#implementing-a-sha1-hash-cracker-in-rust" id="toc-implementing-a-sha1-hash-cracker-in-rust">Implementing a sha1 hash cracker in Rust</a>
  - <a href="#imports" id="toc-imports">Imports</a>
  - <a href="#inputs" id="toc-inputs">Inputs</a>
  - <a href="#read-file" id="toc-read-file">Read File</a>
  - <a href="#check-pass" id="toc-check-pass">Check Pass</a>
- <a href="#bibliography" id="toc-bibliography">Bibliography</a>

# Implementing a [sha1](id:b74d623f-efe7-4b7e-814e-7a7f2c179f13) hash cracker in Rust

``` rust

<<imports>>

fn main() -> Result<(), Box<dyn Error>> {

    <<inputs>>

    <<readFile>>

    <<checkPass>>

    println!("password not found in wordlist.");

    Ok(())

}

```

## Imports

``` rust
use sha1::Digest;
use std::{
    env,
    error::Error,
    fs::File,
    io::{BufRead, BufReader},
};

const SHA1_HEX_STRING_LENGTH: usize = 40;
```

## Inputs

``` rust
let args: Vec<String> = env::args().collect();

if args.len() != 3 {
    println!("Usage:");
    println!("sha1_cracker: <wordlist.txt> <sha1_hash>");
    return Ok(());
}

let hash_to_crack = args[2].trim();
if hash_to_crack.len() != SHA1_HEX_STRING_LENGTH {
    return Err("sha1 hash is not valid.".into());
}
```

## Read File

``` rust
let wordlist_file = File::open(&args[1])?;
let reader = BufReader::new(&wordlist_file);
```

## Check Pass

``` rust
for line in reader.lines() {
    let line = line?;
    let common_password = line.trim();
    if hash_to_crack == &hex::encode(sha1::Sha1::digest(common_password.as_bytes())) {
        println!("Password found: {}", &common_password);
        return Ok(());
    }
}
```

# Bibliography

Black Hat Rust
