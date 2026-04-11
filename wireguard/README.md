# WireGuard - VPN Infrastructure

## Goal

Set up a secure VPN that allows:

- the private communication between the servers
- the secure administration of machines
- the protection of internal services

---

## Architecture

### Server Role

The WireGuard server:
- is hosted on a server accessible from the Internet,
- acts as the central point of the VPN,
- accepts client connections

---

## Addressing Plan

< CONFIDENTIAL >

---

## Basic Setup

< CONFIDENTIAL >

---

## Security Philosophy

- No full tunnel (no `0.0.0.0/0`)
- No default NAT
- No IP forwarding enabled automatically
- Limited access to the VPN network only

---

## Management Script

**Main Script:** wireguard.sh

### Available Orders

| Order     | Description     |
|-----------|-----------------|
| -s -i     | Deploy server   |
| -s -S     | Server status   |
| -s -t     | Test a server   |
| -c -i     | Deploy client   |
| -c -S     | Client status   |
| -c -t     | Test a client   |
| --genkeys | Generate keys   |
| -peer-add | Add peer        |

---

## Testing

The test mode checks:

- correct installation
- active service
- network interface
- valid configuration
- active listening port
- actual operation of the VPN

---

## Key Management

**Keys are stored in:** /etc/wireguard/

Strict permissions:
- private key: root only
- public key: can be read

---

## Adding Peer

A peer is a VPN client.

Each peer has:
- a public key
- a dedicated IP
- a specific configuration

---

## Future Developments

- deploy a mobile phone (QR code)
- integrate a secure bastion
- integration monitoring

---

## Notes

WireGuard is used here as:
- secure network layer
- foundation of private infrastructure

---

CIMIA CYBERSECURITY, a cybersecurity empire!
