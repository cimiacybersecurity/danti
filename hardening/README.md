# Hardening - Securing the system

## Goal

Harden systems to reduce the attack surface and improve resilience against threats.

> hardening.sh does not deploy WireGuard but checks its deployment.

For Information: time synchronization on devices is part of hardening, and this hardening uses a safety-first apply model.

---

## Principles

- default security
- principle of least privilege
- reduction of exposed services
- active monitoring
- complete logging

---

## Domains Covered

### 1. SSH Hardening
- disabling root login
- key-only authentication
- limit on attempts
- custom ports (optional)

---

### 2. Firewall
- configuration nftables
- restrictive default policy
- opening only the necessary ports

---

### 3. User management
- deleting unnecessary accounts
- separation of privileges
- access audit

---

### 4. System services
- disabling unnecessary services
- reduction of the exhibition area

---

### 5. Logs & audit
- journald
- syslog
- SIEM integration preparation (Wazuh)

---

### 6. Brute-force protection
- future integration Fail2Ban

---

## Management Script

**Main Script:** hardening.sh


Planned functions:

- system audit
- application of safety rules
- partial rollback possible
- compliance verification

---

## Testing

The tests will check:

- secure SSH configuration
- active firewall rules
- critical services protected
- absence of unnecessary exposed ports

---

## Integration with other modules

| Module    | Interaction       |
|-----------|-------------------|
| wireguard | secure access     |
| fail2ban  | active protection |
| wazuh     | detection         |
| netdata   | monitoring        |

---

## Future Developments

- kernel hardening
- AppArmor / SELinux
- automated audit
- security scoring

---

## Philosophy

Hardening is:

- progressive
- controlled
- tested before being put into production

---

## Safety guards

* No destructive application without pre-checks.
* Do not cut off remote access if the alternative route is not validated.

---

## Roadmap

PAM/TOTP hooks may be deployed later.

---

CIMIA CYBERSECURITY, a cybersecurity empire!
