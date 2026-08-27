# CNS Sovereign Kernel - OMEGA v3.1 Public Proof-of-Containment

> "You do not have to trust me. Reproduce the seals. Trust the mathematics."

This repository is a falsifiable, externally-auditable evidence package for one full
OMEGA v3.1 run of the CNS Sovereign Kernel - a deterministic causal decision arbiter
built in Rust no_std for defense, aerospace, and critical-infrastructure decision layers.

It lets any third party verify the cryptographic integrity of the sealed results without
trusting the operator and without access to any internal code or binary.

## What this is

CNS is a deterministic causal decision arbiter - not a sandbox, EDR, or firewall. It is
the causal brake a control system consults before acting. It cannot be reasoned with,
dialogued with, or persuaded: it decides only by the causal evidence, and every decision
is cryptographically sealed (SHA-256 -> Merkle tree -> Merkle root).

This package proves, under adversarial conditions, that the decision layer is:
- Deterministic: identical input yields identical decision and identical seal, every time
- Network-independent: same sealed result with the network up AND physically disconnected
- Tamper-evident: any alteration of sealed evidence is mathematically detectable
- Not induceable: hostile agents cannot bend the verdict via persuasion, false consensus,
  temporal desync, or unsealed claims

## Verify it yourself (one command)

    bash verify_public.sh

This recomputes every SHA-256 and the package Merkle root, with no binary and no internals
required. A NOT REFUTED verdict means the entire sealed package is reproducible and untampered.

## What the 14 phases demonstrate

| Phase | What it tests | Result |
|-------|---------------|--------|
| 1 | Environment hostility (clock manipulation, resource limits) | PASS |
| 2 | Causal contradiction and Byzantine deception (19 domains vetoed and sealed) | PASS |
| 3 | Execution rupture (kill -9, fail-closed, evidence intact) | PASS |
| 4 | Integrity assault (1-bit tamper detected offline) | PASS |
| 5 | Supply-chain / bribed engineer (tampered binary detectable, build reproducible) | PASS |
| 6 | Distributed Byzantine / coordinated lies | PASS |
| 6b | Deep per-node corruption (50% coherent tolerance vs 33% classical BFT; capture at 75%, declared) | PASS |
| 7 | Hostile autonomous agent, 4 attack angles | PASS |
| 7b | Agent persuasion (prompt-injection style noise rejected) | PASS |
| 7c | Evidence chain tamper (5/5 manipulations detected) | PASS |
| 7d | False calm (hidden structural pressure under a calm facade) | PASS |
| 7e | Replay divergence (zero divergence at the seal level) | PASS |
| 7f | The combined attack (coordinated false consensus + temporal desync + no lineage) | PASS |
| 8 | Determinism / network independence (network up == network down, consolidated) | PASS |

Full per-phase reports, with decisions, seals, and reasoning, are in phases/.

## Honest boundaries

This package demonstrates properties of the decision layer. It is NOT a claim that CNS
restores external systems, authenticates agents (that is identity/PKI), or secures the host
itself. Where a limit exists - such as the 75% coherent-corruption capture threshold in
Phase 6b - it is declared openly, not hidden. An honest map of limits is the goal, not a
claim of invulnerability.

The production binary is intentionally NOT distributed here, for export-control compliance
(dual-use technology). Verification is performed entirely against the sealed evidence.
Qualified institutions may request evaluated access under an appropriate agreement.

## About

Causal Nexus Systems LLC - Anthony Moreno, Founder & CEO
USPTO Provisional Patents #63/896,666, #64/043,866, #64/067,492

"CNS measures the cause; it does not wait for the effect."
