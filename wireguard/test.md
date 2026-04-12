# WireGuard - Tests

## Goal

Verify that WireGuard is properly installed and functional.

---

## Launch the tests

### Server

```bash
./wireguard.sh --server --test
```

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

### Service

* Wireguard service activated
* boot-enabled service

### Network Interface

* existing interface
* Correctly assigned VPN IP

### Connectivity

* listening on the UDP port
* WireGuard handshake (if peer is present)
* VPN network ping (if possible)

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

---

## Test Scheduling

Tests are executed in a **dependency-aware** order. There is a graph of dependencies between tests, the principle of which is that each test has:
* an id,
* a description,
* a possible dependency,
* a status:
    - **PASS**: the control succeeded
    - **FAIL**: the control failed
    - **SKIP**: the control was not executed because one or more required prerequisites were not satisfied
 
## Test Dependencies

* A failing test **must not** stop the whole test suite, unless a later test explicitly depends on it.
* a test depending on a failed prerequisite becomes SKIP
* avoid meaningless follow-up checks
* provide a precise diagnostic report:
    - real failures
    - non-executable tests

It’s much cleaner than "exit 1" at first glance.

---

## Dependency model

A test may depend on:
- a file existing
- a binary being installed
- a service being active
- an interface existing
- a peer being configured
- a handshake being present

If a dependency fails, dependent tests must be marked as **SKIP**, not **FAIL**.

---

**> /!\ RELIRE CE QUI SUIT !!!!**

## Test groups

### Group A - Local prerequisites (independent)

These tests do not depend on each other and should always be attempted first.

#### A1. Binary presence

Checks:
- `wg`
- `wg-quick`
- `ip`
- `systemctl`

#### A2. Configuration presence
Checks:
- main config file exists
- config file is readable by root
- config file syntax is not obviously malformed

#### A3. Key presence
Checks:
- private key exists
- public key exists
- permissions are restrictive enough

#### A4. Service definition
Checks:
- `wg-quick@<interface>` exists as a systemd unit

---

### Group B - Service state

These tests depend on the local configuration being present.

#### B1. Service enabled
Depends on:
- A2

Checks:
- service enabled at boot

#### B2. Service active
Depends on:
- A2
- A4

Checks:
- service currently active

---

### Group C - Interface state

These tests depend on the VPN service being active.

#### C1. Interface existence
Depends on:
- B2

Checks:
- interface `<interface>` exists

#### C2. Interface address
Depends on:
- C1

Checks:
- expected VPN IP is assigned to the interface

#### C3. `wg show` availability
Depends on:
- C1

Checks:
- WireGuard runtime state can be queried successfully

---

### Group D - Runtime network checks

These tests depend on the interface being present and configured.

#### D1. Listening port
Depends on:
- B2

Checks:
- WireGuard is listening on the expected UDP port

#### D2. Runtime consistency
Depends on:
- C3

Checks:
- configured listen port matches runtime state
- interface name matches expected state

---

### Group E - Peer-aware checks

These tests only apply if at least one peer is configured.

#### E1. Peer presence
Depends on:
- C3

Checks:
- at least one peer exists in runtime state or configuration

#### E2. Handshake presence
Depends on:
- E1

Checks:
- at least one peer has a recent or existing handshake

#### E3. Peer reachability
Depends on:
- E1
- C2

Checks:
- optional ping to a known peer address
- optional routed connectivity if explicitly configured

---

## Server test flow

Recommended order for server testing:

1. A1 - Binary presence
2. A2 - Configuration presence
3. A3 - Key presence
4. A4 - Service definition
5. B1 - Service enabled
6. B2 - Service active
7. C1 - Interface existence
8. C2 - Interface address
9. C3 - `wg show` availability
10. D1 - Listening port
11. D2 - Runtime consistency
12. E1 - Peer presence
13. E2 - Handshake presence
14. E3 - Peer reachability

---

## Client test flow

Recommended order for client testing:

1. A1 - Binary presence
2. A2 - Configuration presence
3. A3 - Key presence
4. A4 - Service definition
5. B1 - Service enabled
6. B2 - Service active
7. C1 - Interface existence
8. C2 - Interface address
9. C3 - `wg show` availability
10. D1 - Route or tunnel presence
11. D2 - Runtime consistency
12. E1 - Server peer presence
13. E2 - Handshake with server
14. E3 - Reachability of VPN server address
15. E4 - Reachability of protected resources (optional)

---

## Output expectations

The test report should clearly distinguish:

- tests that passed
- tests that failed
- tests skipped due to unmet prerequisites

It should also display:
- the reason for each skip
- the dependency chain causing the skip
- a final summary count

Example summary:

- PASS: 8
- FAIL: 2
- SKIP: 3

---

## Notes

- A peer-dependent test must never fail simply because no peer is configured unless peer presence is explicitly required by the current mode.
- Functional tests should remain non-destructive.
- The test module should prefer explicit diagnostics over early exits.

---

## Future developments

- handshake freshness thresholds
- latency measurement
- throughput checks
- resilience checks
- integration with monitoring and alerting

---

CIMIA CYBERSECURITY, a cybersecurity empire
