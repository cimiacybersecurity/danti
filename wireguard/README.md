# WireGuard - VPN Infrastructure

## Goal

Set up a secure VPN that allows:

- the private communication between the servers
- the secure administration of machines
- the protection of internal services

The program is designed to deploy wireguard as a server or a client according to the command line executed.

---

## Architecture

### Server Role

The WireGuard server:
- is hosted on a server accessible from the Internet,
- acts as the central point of the VPN,
- accepts client connections

---

## Addressing Plan

Defined in the external YAML configuration

---

## Basic Setup

Defined in the external YAML configuration

---

## Security Philosophy

- No full tunnel (no `0.0.0.0/0`)
- No default NAT
- No IP forwarding enabled automatically
- Limited access to the VPN network only

---

## Management Script

**Main Script:** wireguard.sh

### Available Commands

| Command                | Description                                           |
|------------------------|-------------------------------------------------------|
| -i / --install         | Install wireguard on the target.                      |
| -S / --status          | Generate the status of the targeted asset.            |
| -t / --test            | Test the targeted asset.                              |
| --genkeys              | Generate keys.                                        |
| --peer-add             | Add peer.                                             |
| --device [ID]          | The targeted device.                                  |
| --config [PATH]        | The configuration file path.                          |
| --yes                  | Automatically confirm the installation after checking |
| -l / --log-file [PATH] | Path to log wireguard.sh execution.                   |
| -q / --quiet           | Only print if an interaction with the user is needed. |
| -h / --help            | Print help.                                           |
| --dry-run              | Dry running of wireguard.sh                           |

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

## Configuration source

WireGuard deployment is driven by the external YAML configuration file.

The repository only provides:
- a public example configuration file
- the expected schema
- the deployment logic

For security reasons, real infrastructure values must be defined outside the public repository, in a local configuration file.

Typical usage:

```bash
./wireguard.sh --server --install --config config/infrastructure.local.yaml --device front
```

The selected --device determines:
* the machine role
* interface names
* VPN addressing
* peer definitions
* service-specific behavior
* …

---

## hub-and-spoke topology

### What it is

The current WireGuard design follows a **hub-and-spoke** topology.

* A central node = **hub**  
* Several peripheral nodes = **spokes**

- the VPN server acts as the central hub
- each client acts as a spoke
- clients connect to the server, not directly to each other by default

This model simplifies:
- peer management
- access control
- routing logic
- future infrastructure growth

It also allows the central server to enforce network policy while keeping client configurations minimal.

### Why is it good

- simple to reason,
- easy to upgrade,
- There’s no need for all the clients to know each other,
- centralized control.

---

CIMIA CYBERSECURITY, a cybersecurity empire!
