# WireGuard - Server Deployment

## Goal

Deploy a secure WireGuard server to serve as the central VPN point.

---

## Prerequisites

- OS: Debian 13
- Root access
- Internet connection
- UDP port 51820 open (or configurable)

---

## Installation

The deployment is carried out via:

```bash
./wireguard.sh --server --install
```

---

## Generated Files

/etc/wireguard/

├── private.key

├── public.key

├── <interface>. conf

---

## Security

* Strict key permissions
* No direct exposure on the Internet (excluding VPN port).
* No default enabled internet routing.

---

## Service Start

systemctl enable wg-quick@<interface>
systemctl start wg-quick@<interface>

---

## Verification

``bash
./wireguard.sh --server --status
``

---

## Operation

The server listens on its UDP port, manages peers, then routes only VPN traffic.

---

## Notes

* No NAT enabled by default.
* No full tunnel configured.
* Deliberately minimum configuration for security.

---

CIMIA CYBERSECURITY, a cybersecurity empire!
