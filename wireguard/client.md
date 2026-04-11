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

## Installation

```bash
./wireguard.sh --client --install
```

---

## Fichiers générésç

/etc/wireguard/wg0.conf

---

## Fonctionnement

Le client :

* établit un tunnel chiffré vers le serveur
* accède uniquement au réseau VPN
* ne redirige pas le trafic Internet

---

## Démarrage

```bash
systemctl enable wg-quick@<interface>
systemctl start wg-quick@<interface>
```

---

## Vérification

```bash
./wireguard.sh --client --status
```

---

## Test

```bash
./wireguard.sh --client --test
```

---

## Remarques

* pas de full tunnel
* configuration minimale
* accès restreint au VPN uniquement

---

CIMIA CYBERSECURITY, a cybersecurity empire!
