# Hashing Algorithms - The One Way Street

## Overview

Hashing algorithms are a one-way algorithm, designed to not be unencrypted.  It's purpose is to create a unique digital fingerprint of data.
Hashing algorithms can be used for digital signatures, authentication systems, message and file integrity, and more.


## Traits of a secure hashing algorithm:

  - Fixed size - no matter the data input, the hash output will be the same size
  - Unique - no input should make the same output (Collisions)
  - Original - shouldn't be able to produce a desired or pre-defined hash
  - Secure - the hash cannot be reversed
  

## Common Hash Algorithms

 - MD Family - Message Digest - an early hashing algorithm, including MD5 has been deprecated
 - SHA - Secure Hash Algorithm - of them SHA1 is deprecated.  SHA2 includes: SHA-256, SHA-384, and SHA-512.  SHA3 is newer and so dissimilar squashing earlier work to comprimise SHA.
 - RipeMD - RACE Integrity Primiteves Evaluation Message Digest - Combination of two different and independant parallel chains of computation.  Include: RipeMD-160, RipeMD-256, RipeMD-320
 - Whirlpool - Whirlpool is a block cipher and takes messages of any length less than 2256bits and returns a 512-bit message digest.  It will never be patented and can be used freely.
 - bcrypt - uses key stretching to slow down a brute force attack
 - PBKDF2 - uses key stretching
 - Argon2 - uses key stretching, salting, and specific memory usage


## Attacks on Hashing Algorithms

 - Collision Attacks - A collision is two inputs that produce the same output
    - Collisions in MD algorithm are very easy to find.  The odds of a collision decrease the longer the digest ie SHA3-512
    - Birthday attack: is a way to make finding collisions easier - It is based on a statistical phenomenom called the Birthday Paradox.  The Birthday Paradox says that for there to be a 50 percent chance that someone shares your birthday, 253 need to be present.  If you are looking for a greater than 50 percent chanec that any two people are in the room, you would only need 23 people.
       - Meaning: it is harder to find a collision for a specific hash than it is to find two inputs that have the same hash.

 - Brute Force, Dictionary, Rainbow attacks - Passwords are stored as hashes in authentication systems.  Attackers can use brute force, which brutally goes through each iteration and combination of the alphabet; dictionary and rainbow attacks use a table of words or common passwords to crack a password file.
    - To mitigate these attacks algorithm designers have come up with methods like:
       - Salting - Appends a random string to password
       - Peppering - Uses a symetrical cryptographic algorithm to append a string to a password
       - Key Stretching - uses a method of delibrately slowing down the time it takes to encode a password.  