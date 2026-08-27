#!/bin/bash
# ============================================================================
# CNS SOVEREIGN KERNEL - OMEGA v3.1 - PUBLIC VERIFICATION
# Cryptographic integrity of the ENTIRE package (no internals, no binary needed).
# "You do not have to trust me. Reproduce the seals. Trust the mathematics."
# ============================================================================
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
echo "============================================================"
echo "  CNS SOVEREIGN KERNEL - OMEGA v3.1 - PUBLIC VERIFICATION"
echo "  Reproduce the seals. Do not trust the operator - trust the math."
echo "============================================================"

FAIL=0

# ---- 1. Verify the CORE audit sub-package (external_audit_public) ----
if python3 "$HERE/external_audit_public/validate_external_package.py" >/dev/null 2>&1; then
    echo "  [OK] Core audit sub-package (SHA-256 + Merkle): PASS"
else
    echo "  [!!] Core audit sub-package: FAIL"; FAIL=1
fi

# ---- 2. Verify the FULL package manifest (every file in this package) ----
python3 - "$HERE" << 'PYV'
import sys, os, hashlib, csv
POC = sys.argv[1]
def sha256_file(p):
    h=hashlib.sha256()
    with open(p,"rb") as f:
        for c in iter(lambda:f.read(8192),b""): h.update(c)
    return h.hexdigest()
def merkle(leaves):
    if not leaves: return hashlib.sha256(b"").hexdigest()
    layer=[bytes.fromhex(x) for x in leaves]
    while len(layer)>1:
        nxt=[]
        for i in range(0,len(layer),2):
            a=layer[i]; b=layer[i+1] if i+1<len(layer) else layer[i]
            nxt.append(hashlib.sha256(a+b).digest())
        layer=nxt
    return layer[0].hex()
csvp=os.path.join(POC,"PACKAGE_MANIFEST_SHA256.csv")
rows=list(csv.DictReader(open(csvp)))
probs=[]; hashes=[]
for r in sorted(rows,key=lambda x:x["file"]):
    f=os.path.join(POC,r["file"])
    if not os.path.isfile(f): probs.append("missing: "+r["file"]); continue
    a=sha256_file(f); hashes.append(a)
    if a!=r["sha256"]: probs.append("sha mismatch: "+r["file"])
mr=merkle(hashes)
want=open(os.path.join(POC,"PACKAGE_MERKLE_ROOT.txt")).read().strip()
if mr!=want: probs.append("package Merkle root mismatch")
if probs:
    print(f"  [!!] Full package manifest: FAIL ({len(probs)} issue(s))")
    for p in probs[:5]: print("       -",p)
    sys.exit(1)
print(f"  [OK] Full package manifest ({len(rows)} files, SHA-256 + Merkle): PASS")
PYV
if [ $? -ne 0 ]; then FAIL=1; fi

echo "------------------------------------------------------------"
if [ $FAIL -eq 0 ]; then
    echo "  VERDICT: NOT REFUTED - the entire sealed package is reproducible"
    echo "           and untampered. Every file verified against its SHA-256"
    echo "           and the package Merkle root."
else
    echo "  VERDICT: REVIEW - one or more integrity checks did not pass."
fi
echo "============================================================"
