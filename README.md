# DANTI, by CIMIA CYBERSECURITY

DANTI - Deployment Automation for Network &amp; Threat Infrastructure - is a modular infrastructure automation framework by CIMIA CYBERSECURITY, designed to deploy, secure, and manage resilient systems. It integrates VPN, hardening, monitoring, and security tools to build scalable and controlled environments.

## Goal

This repository contains all the scripts, configurations and documentation necessary for the deployment, security and operation of the CIMIA CYBERSECURITY infrastructure.

The goal is to build a modular, secure, reproducible and evolutionary infrastructure.

---

## Global Architecture

### Server Types

| Server Type      | Role                                           |
|------------------|------------------------------------------------|
| Front-end        | Reverse proxy, public access, exposed services |
| AI server        | Model hosting (Ollama, GPU)                    |
| (Future) Bastion | Centralized secure access                      |
| Customers        | Administration machines, users                 |

---

## IP Network Topology (simplified)

Internet -> [ Frontend ] -> (WireGuard VPN) -> [ IA Server ] --- [ Admin Machines ] --- [ Other Clients ]


---

## Security Philosophy

- No sensitive services exposed directly on the Internet
- Internal access via VPN only
- Partitioning of services
- Monitoring and active detection (Netdata, Wazuh)
- Systematic hardening of systems

---

## Infrastructure Modules

| Module    | Description                 |
|-----------|-----------------------------|
| wireguard | secure VPN between machines |
| Hardening | Hardening of systems        |
| Backup    | Backups                     |
| netdata   | Real-time monitoring        |
| fail2ban  | Protection against attacks  |
| wazuh     | SIEM / advanced detection   |

---

## Repository Structure

infra/

├── README.md

├── wireguard/

├── hardening/

├── backup/

├── netdata/

├── fail2ban/

├── wazuh/


---

## Current Roadmap

1. WireGuard Deployment
2. Deployment monitoring (Netdata)
3. Implementation of backups
4. IDS
5. IPS
6. SIEM (Wazuh)

---

## Scripting Principles

- 1 script per module
- use of subcommands
- standard CLI compatibility (short + long options)
- idempotent scripts
- explicit logs

---

## Documentation

Each module has its own README detailing:
- its role
- its operation
- its deployment
- its tests

---

## Vision

This infrastructure is designed to evolve towards:
- a multi-service architecture
- a distributed AI platform
- a secure production environment

---

CIMIA CYBERSECURITY, a cybersecurity empire!
