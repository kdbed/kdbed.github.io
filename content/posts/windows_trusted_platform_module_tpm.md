+++
title = "Windows - Trusted Platform Module (TPM)"
author = ["svejk"]
draft = false
+++

## Trusted Platform Module {#trusted-platform-module}

A Trusted Platform Module (TPM) is a specialized chip on your computer's motherboard designed to enhance security by securely storing cryptographic keys used for encryption and decryption. It ensures that your operating system and firmware are authentic and have not been tampered with. TPMs can be implemented as discrete chips, which are separate components on the motherboard, or as integrated solutions within the main processor.

For example, the Microsoft Pluton security processor is an integrated solution that embeds TPM functionality directly into the CPU. This integration reduces the attack surface by eliminating the communication path between the CPU and a separate security chip.

Several Windows features leverage TPM to enhance security, including:

Windows Hello uses the TPM to securely store biometric data (like fingerprints or facial recognition) and PINs, providing a secure and convenient way to sign into your device without using a password

BitLocker uses the TPM to encrypt your hard drive, ensuring that the data remains secure even if your device is lost or stolen. The TPM stores the encryption keys, making it difficult for unauthorized users to access your data

[learn.microsoft](https://learn.microsoft.com/en-us/windows/security/hardware-security/tpm/trusted-platform-module-overview)
