#!/bin/bash

#To prepare the receptor for docking, the original 1M17 crystal structure was refined in PyMOL to isolate the EGFR kinase domain. After loading the structure, we visualized the binding pocket by selecting the native ligand, Erlotinib, and displaying it in stick representation. To ensure a clean docking environment, all non-essential components—including crystallographic water molecules and inorganic ions—were stripped using the remove solvent and remove inorganic commands. The resulting refined structure was then exported as 1m17_clean.pdb, providing a clean, protein-only receptor ready for grid generation and docking.

# prep_receptor.sh: Cleans PDB and converts to PDBQT for docking
# 1. Define paths
RAW_PDB="data/protein/1m17_clean.pdb"
RECEPTOR_ONLY="data/protein/1m17_receptor_only.pdb"
FINAL_PDBQT="data/protein/1m17_prepared.pdbqt"

echo "Step 1: Extracting protein atoms..."
grep "^ATOM" $RAW_PDB > $RECEPTOR_ONLY

echo "Step 2: Converting to PDBQT with OpenBabel..."
# -xr: preserve residue names
# -xh: preserve hydrogens (or add them if missing)
obabel $RECEPTOR_ONLY -O $FINAL_PDBQT -xr -xh

echo "✅ Preparation complete: $FINAL_PDBQT"