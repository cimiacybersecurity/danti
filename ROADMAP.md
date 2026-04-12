# ROADMAP

## Objective

Track what has been completed, what is in progress, and what remains to be implemented in DANTI.

---

## Current status

### Completed
- Global repository structure defined
- Core documentation initialized
- Separation of deployment and hardening logic validated
- YAML-based configuration model selected
- WireGuard testing dependency model defined

### In progress
- WireGuard documentation refinement
- Configuration schema design (`config.example.yaml`)

### Next steps
1. Finalize `config.example.yaml`
2. Implement `wireguard.sh`
   - `--genkeys`
   - `--server --install`
   - `--server --status`
   - `--server --test`
   - `--peer-add`
3. Implement client logic in `wireguard.sh`
4. Define `hardening.sh` scope and safety guards
5. Implement baseline SSH hardening
6. Implement time synchronization checks
7. Implement PAM/TOTP hardening
8. Implement firewall logic in `hardening.sh`
9. Implement backup module
10. Implement Netdata module
11. Implement Fail2Ban module
12. Implement Wazuh/OSSEC integration

---

## Design principles

- One script per module
- Shared YAML configuration
- Public code, private real configuration
- Local generation of private secrets whenever possible
- Dependency-aware tests
- No destructive hardening without validated fallback access

---

## Longer-term goals
- Mini in-house orchestrator
- Bastion host
- Centralized secret handling
- Advanced monitoring and SIEM integration
- Infrastructure compliance scoring

CIMIA CYBERSECURITY, a Cybersecurity empire.
