
# Symmetric and Asymmetric Cryptography - The Key to Secrecy

## Overview
Symmetric and Asymmetric cryptographic algorithms are considered a two-way algorithm. Two-way algorithms give us the ability to both encrypt AND decrypt data.   
This type of cryptography uses keys to unlock the encrypted data.

Symmetrically encrypted data uses the same key to encrypt and unencrypt.  
Asymmetrically encrypted data uses two keys, a private and public key. One to encrypt and the other to unencrypt.

The usage of symmetric encryption are limited to applications that don't share keys.  
And in turn asymmetric encryption is limited to sharing a public key, though it's not that simple. A whole infrastructure for key sharing had to be built, Public Key Infrastruce (PKI).   


## Common Uses
 - Symmetric encryption
    - Data storage (file systems, folders, disks)
	- Data tunneling (VPN, SSH)	
	- Databases

 - Asymmetric encryption
    - Secure email - PGP (Pretty Good Privacy)
	- Establishing secure initial communication -  SSL/TLS/HTTPS
	- Digital Signatures
	- Blockchain

## Popular algorithms
 - Symmetric
    - AES - No attacks have been successful - it performs three steps on every 128 bit block.  in step two multiple rounds are perfomed depending on the keysize
	- Blowfish and Twofish - Blowfish operates on 64bit blocks and has a key length of 32 to 448 bits.  To date, no significant weaknesses have been found.  Twofish is a later derivation considered as strong as Blowfish, but isn't as widely used.
	- Deprecated: RC, DES, 3DES
 
 - Asymmetric
    - RSA - multiplies two prime numbers and goes and does more math from there
    - ECC - Elliptic Curve Cryptography - uses points on a sloping curve 
    - DSA - Digital Signature Algorithm - can be used to verify the sender, prevent the sender from disowning the message, prove the integrity of the message
	
	
## The Good, the Bad and the Ugly?

  - Symetric encryption is faster than asymmetric.
  - Symetric sucks if you lose your key.

  -Will Quantum Computing squash them all?