+++
title = "PowerShell - Rust"
author = ["svejk"]
tags = ["rust", "powershell"]
draft = false
+++

## Basic Rust Integration with [powershell]({{< relref "powershell.md" >}}) {#basic-rust-integration-with-powershell--powershell-dot-md}

```powershell
$rustPgm = @"
#[no_mangle]
pub extern "C" fn add_numbers(number1: i32, number2: i32) -> i32 {
    number1 + number2
}
"@

$rustPgm | Set-Content -Encoding UTF8 .\lib.rs
rustc .\lib.rs --crate-type dylib --crate-name powershell_to_rust

## start another PS so dll doesn't get locked
powershell -command {
    $definition = @"
[DllImport("powershell_to_rust.dll")]
public static extern Int32 add_numbers(Int32 number1, Int32 number2);
"@

    $target = Add-Type -MemberDefinition $definition -Name AddNum -PassThru
    $ans = $target::add_numbers(3, 8)
    write-host $ans
}
```
