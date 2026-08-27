#!/usr/bin/env python3
"""Validador externo AUTO-CONTENIDO (embebido en el paquete publico).
Verifica los archivos QUE ESTAN dentro de este mismo paquete (no requiere el run completo).
Uso: python3 validate_external_package.py
"""
import sys, os, csv, hashlib
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
def main():
    here=os.path.dirname(os.path.abspath(__file__))
    csvp=os.path.join(here,"public_files_sha256.csv")
    rows=list(csv.DictReader(open(csvp)))
    probs=[]; hashes=[]
    for r in sorted(rows, key=lambda x:x["file"]):
        f=os.path.join(here,r["file"])
        if not os.path.isfile(f): probs.append("ausente: "+r["file"]); continue
        a=sha256_file(f); hashes.append(a)
        if a!=r["sha256"]: probs.append("sha no coincide: "+r["file"])
    mr=merkle(hashes)
    want=open(os.path.join(here,"public_merkle_root.txt")).read().strip()
    if mr!=want: probs.append("merkle root del paquete publico no coincide")
    print("=== EXTERNAL PACKAGE VALIDATION (auto-contenido) ===")
    if probs:
        print("VALIDATION_STATUS: FAIL")
        for p in probs: print("  -",p)
        sys.exit(1)
    print("VALIDATION_STATUS: PASS")
    print("Paquete publico integro: SHA-256 y Merkle verificados de forma aislada.")

if __name__ == "__main__":
    main()
