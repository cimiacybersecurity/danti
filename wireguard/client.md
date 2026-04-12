# WireGuard - Client Deployment

## Goal

Connect a machine to the WireGuard VPN in order to access internal resources.

---

## Prerequisites

- Linux OS (Debian, Ubuntu...)
- Root access
- Server public key
- Assigned client IP

---

## Configuration

Remember to modify the YAML file to give information needed about the device.

---

## Installation

```bash
./wireguard.sh --client --install --device <clientTarget>
```

---

## Generated file

/etc/wireguard/wg0.conf

---

## Operation

The client:

* establishes an encrypted tunnel to the server,
* only accesses the VPN network,
* does not redirect Internet traffic.

---

### Start

```bash
systemctl enable wg-quick@<interface>
systemctl start wg-quick@<interface>
```

---

### Check

```bash
./wireguard.sh --client --status  --device <clientTarget>
```

---

### Test

```bash
./wireguard.sh --client --test  --device <clientTarget>
```

---

### Notes

* no full tunnel
* minimum configuration
* Restricted VPN access only

---

CIMIA CYBERSECURITY, a cybersecurity empire!
