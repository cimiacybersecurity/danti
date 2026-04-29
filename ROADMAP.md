# ROADMAP

## Legend

- ✅ Done
- ⬜ Planned
- 🧠 Under design / to be refined
- 🚧 In progress
- ⚠️ Blocked / sensitive
- 🔐 Security-critical
- 🧪 Testing-related
- ❌️ Canceled

---

## Repository and architecture

- ✅ Global repository structure defined
- ✅ Separation between deployment and hardening validated
- ✅ Public repository / private configuration model validated
- ✅ Modular documentation structure selected
- ✅ Finalize `config.example.yaml`
- ⬜ Add LICENSE
- ⬜ Add CHANGELOG.md

---

## Configuration

- ✅ YAML configuration model selected
- 🚧 Split configuration model under `conf/`
- ✅ Create example configuration files
- ⬜ Define local configuration exclusion rules
- ⬜ Implement config loader

---

## Logging

- ✅ Human-readable terminal logs selected
- ✅ JSONL file logs selected
- ✅ `-q / --quiet` behavior defined
- ✅ `-l / --log-file` behavior defined
- ⬜ Implement logging library in shell

---

## WireGuard

- ✅ WireGuard module scope defined
- ✅ Hub-and-spoke topology selected
- ✅ Preflight check model selected
- ✅ Test dependency model defined
- ✅ Server assumptions validated
- ✅ CLI command model defined
- 🚧 Implement `wireguard.sh`
- ⬜ Implement `--genkeys`
- ⬜ Implement `--check`
- ⬜ Implement `--peer-add`
- ⬜ Implement `--install`
- ⬜ Implement `--status`
- ⬜ Implement `--test`
- 🧪 Add advanced connectivity tests
- ❌️ Implement client logic

---

## Hardening

- ✅ Separate hardening from deployment
- ✅ Hardening checks WireGuard but does not deploy it
- ✅ Full Ed25519 selected
- ✅ Full `curve25519-sha256` selected
- ✅ Full `chacha20-poly1305@openssh.com` selected
- ✅ PAM enabled
- ✅ SSH hardening direction validated
- ⬜ Implement time synchronization checks
- ⬜ Implement SSH hardening
- ⬜ Implement access safety guards
- 🔐 Prevent lockout during hardening apply
- 🧠 Define PAM/TOTP integration details
- 🧠 Define SSH certificate workflow

---

## Future modules

- ⬜ Backup
- ⬜ Netdata
- ⬜ Fail2Ban
- ⬜ IDS
- ⬜ IPS
- ⬜ Wazuh / OSSEC
- 🧠 Design local secret generation workflow
- 🧠 Design mini in-house orchestrator model
