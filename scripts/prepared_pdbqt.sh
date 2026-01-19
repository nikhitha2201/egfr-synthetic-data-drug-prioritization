#!/bin/bash
# Create the output directory
mkdir -p /home/nikki/egfr_lowdata_scoring/data/ligands_real/prepared_pdbqt

# Loop through all 3D SDF files
for f in /home/nikki/egfr_lowdata_scoring/data/ligands_real/prepared_3D/*.sdf; do
    # Get the filename without the extension
    ligand_name=$(basename "$f" .sdf)
    
    echo "Converting $ligand_name to PDBQT..."
    
    # Use OpenBabel to convert SDF to PDBQT
    # -p 7.4: Adds hydrogens consistent with pH 7.4
    # --partialcharge gasteiger: Assigns charges required for docking
    obabel "$f" -O "/home/nikki/egfr_lowdata_scoring/data/ligands_real/prepared_pdbqt/${ligand_name}.pdbqt" -p 7.4 --partialcharge gasteiger
done
