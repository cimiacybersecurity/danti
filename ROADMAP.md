# ROADMAP

## Legend

- ✅ Done
- ⬜ Planned
- 🧠 Under design / to be refined
- 🚧 In progress
- ⚠️ Blocked / sensitive
- 🔐 Security-critical
- 🧪 Testing-related

---

## Repository and architecture

- ✅ Global repository structure defined
- ✅ Separation between deployment and hardening validated
- ✅ Public repository / private configuration model validated
- ✅ YAML-based configuration model selected
- 🚧 Module documentation refinement
- ⬜ Finalize `config.example.yaml`

---

## WireGuard

- ✅ WireGuard module scope defined
- 🚧 CLI command model defined
- ✅ Test dependency model defined
- ✅ Server assumptions validated
- ⬜ Write `wireguard.sh`
- ⬜ Implement `--genkeys`
- ⬜ Implement `--server --install`
- ⬜ Implement `--server --status`
- ⬜ Implement `--server --test`
- ⬜ Implement `--peer-add`
- ⬜ Implement client logic
- 🧪 Add advanced connectivity tests

---

## Hardening

- ⬜ Hardening kept separate from deployment
- ⬜ Hardening must verify WireGuard without deploying it
- ⬜ SSH hardening direction validated
- ⬜ Full Ed25519 selected
- ⬜ Full curve25519-sha256 selected
- ⬜ Full chacha20-poly1305@openssh.com selected
- ⬜ PAM kept enabled
- ⬜ Implement time synchronization checks
- ⬜ Implement SSH hardening
- ⬜ Implement access safety guards
- 🔐 Prevent lockout during hardening apply
- 🧠 Define PAM/TOTP integration details
- 🧠 Define SSH certificate workflow

---

## Operations

- 🧠 Design local secret generation workflow
- 🧠 Design mini in-house orchestrator model
- ⬜ Backup module
- ⬜ Netdata module
- ⬜ Fail2Ban module
- ⬜ Wazuh / OSSEC integration
