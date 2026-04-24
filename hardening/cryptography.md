# Cryptography Choices

## Goal

This document explains the cryptographic choices used by DANTI for SSH hardening and secure administration.

---

## SSH key type

DANTI uses Ed25519 by default.

Reasons:
- modern elliptic-curve signature scheme
- compact keys
- fast verification and signing
- deterministic signatures
- reduced dependency on runtime randomness compared to ECDSA

---

## Key exchange

DANTI uses:

```text
curve25519-sha256
```

Reasons:
* modern elliptic-curve Diffie-Hellman key exchange
* tandardized name
* strong security properties
* avoids legacy or compatibility-focused algorithm names where not required

## SSH cipher

DANTI uses:

```text
chacha20-poly1305@openssh.com
```

Reasons:
* AEAD construction
* combines encryption and authentication
* excellent software performance
* better than AES, especilly without AES hardware acceleration
* avoids separate cipher/MAC composition issues

## SSH MAC

When a separate MAC is required, DANTI uses:

```text
hmac-sha2-512-etm@openssh.com
```

Reasons:
* Encrypt-then-MAC construction
* authenticates ciphertext before decryption
* reduces exposure to decrypt-before-verify classes of issues

## Password authentication

Password authentication should be disabled by default on hardened systems.

Emergency access must be handled through:
* multiple authorized SSH keys
* SSH certificates
* tested fallback users
* console/provider rescue access
* documented recovery procedure

Fail2Ban is not considered a sufficient control to justify password authentication on exposed SSH services.
