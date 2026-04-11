# WireGuard - Tests

## Goal

Verify that WireGuard is properly installed and functional.

---

## Launch the tests

### Server

```bash
./wireguard.sh --server --test
```

---

### Client

```bash
./wireguard.sh --client --test
```

---

## Tests Completed

### Installation

* presence of wireguard binaries
* presence of configuration files
* presence of the keys

---

### Service

* Wireguard service activated
* boot-enabled service

---

### Network Interface

* existing interface
* Correctly assigned VPN IP

---

### Connectivity

* listening on the UDP port
* WireGuard handshake (if peer is present)
* VPN network ping (if possible)

---

### Consistency

* valid configuration
* matching IPs
* peer consistency

---

## Result

The script returns:

* OK → functional
* KO → problem detected

---

## Test Objective

Guarantee:

* correct deployment
* operational service
* minimum assured safety

---

## Limits

* some tests require an active peer
* no load test
* no network resilience test

---

## Future Developments

* advanced tests (latency, throughput)
* integration monitoring (Netdata)
* automatic alerts

CIMIA CYBERSECURITY, a cybersecurity empire
