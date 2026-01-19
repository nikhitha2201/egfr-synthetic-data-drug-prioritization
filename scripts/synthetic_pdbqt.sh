#!/bin/bash
BASE_DIR="/home/nikki/egfr_lowdata_scoring/data/ligands_synthetic"
SDF_DIR="$BASE_DIR/sdf"
OUT_DIR="$BASE_DIR/prepared"

mkdir -p "$OUT_DIR"

# Using parallel to speed up the process
# {} is the input file, {/. } is the filename without extension
find "$SDF_DIR" -name "*.sdf" | parallel -j+0 \
"obabel {} -O $OUT_DIR/{/.}.pdbqt --gen3d -p 7.4 --best"

echo "All conversions complete!"