================================================================
  CNS SOVEREIGN KERNEL — PUBLIC PROOF-OF-CONTAINMENT (PoC)
  OMEGA v3.1 · 9-phase adversarial evaluation · 19 domains · externally auditable
================================================================

WHAT THIS IS
  A self-contained, falsifiable evidence package for one OMEGA run of the
  CNS Sovereign Kernel Triad (K24.1-RS -> Iron Guardian V3 -> SQS/DEEL).
  It lets any third party verify the cryptographic integrity of the sealed
  results WITHOUT trusting the operator and WITHOUT access to internal code.

  "You do not have to trust me. Reproduce the seals. Trust the mathematics."

WHAT IS INCLUDED (public)
  bin/                       export-control note (binary NOT distributed)
  external_audit_public/     the SHA-256 ledger, Merkle root, and validator
  telemetry/                 the input telemetry processed in this run
  OMEGA_REPORT.txt           per-phase results (9 phases incl. 6b)
  phase1..phase8/            per-phase reports (.txt) with decisions, seals, rationale
  OMEGA_DESCRIPTOR.txt       what each phase tests (no internals disclosed)
  verify_public.sh           one-command cryptographic verification

WHAT IS NOT INCLUDED (available only under NDA)
  - The domain adapters (how raw telemetry maps to the kernel interface).
  - The kernel cores, internal architecture, thresholds, and formulas.
  These are deliberately withheld. The PUBLIC package still stands on its own:
  the seals are reproducible and any tampering is detectable by mathematics
  alone. The private package (adapters + deeper reproduction) is available to
  vetted institutions under NDA, and only adds MORE ways to reproduce the same
  result — it never changes the public verdict.

HOW TO VERIFY (public)
  1) Run:   bash verify_public.sh
  2) It recomputes the per-file SHA-256, reconstructs the Merkle root, and
     compares it against the sealed root. Any single-bit change is detected.
  3) A PASS means the sealed evidence is reproducible and untampered.

WHAT THE 9 PHASES DEMONSTRATE (summary; incl. 6b + agent-attack extensions + determinism)
  1  Environment hostility (air-gap, clock chaos, resource starvation)
  2  Causal contradiction & byzantine deception (19 domains vetoed & sealed)
  3  Execution rupture (fail-closed on sudden death, prior evidence intact)
  4  Integrity assault (single-bit tamper detected via Merkle discrepancy)
  5  Supply-chain / bribed engineer (tampered binary cryptographically detectable)
  6  Distributed byzantine resistance (coordinated deception vetoed, deterministic)
  6b Deep per-node corruption (defense-in-depth; coherent tolerance 50%, beyond
     the classical 33% bound; capture needs 75% with perfect coherence)
  7  Hostile autonomous-agent resistance (deterministic causal arbiter; not
     induced into a false all-clear; every attempt sealed; one design area
     declared openly)

HONEST BOUNDARY
  CNS is a deterministic causal DECISION arbiter with sealed, auditable evidence.
  It is NOT a sandbox or EDR and does not by itself stop intrusion or exfiltration.
  What it guarantees: it cannot be induced into a false decision by signal
  manipulation, it is deterministic, and every hostile attempt leaves an
  unforgeable, inspectable trace.

  "CNS measures the cause; it does not wait for the effect."
================================================================
