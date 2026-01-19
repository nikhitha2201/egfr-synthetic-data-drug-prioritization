#!/bin/bash

RECEPTOR="/home/nikki/egfr_lowdata_scoring/data/protein/1m17_prepared.pdbqt"
LIGAND_DIR="/home/nikki/egfr_lowdata_scoring/data/ligands_synthetic/prepared"
OUT_DIR="/home/nikki/egfr_lowdata_scoring/results/synth/poses"
LOG_DIR="/home/nikki/egfr_lowdata_scoring/results/synth/logs"
CONFIG="/home/nikki/egfr_lowdata_scoring/docking_config.txt"

mkdir -p "$OUT_DIR" "$LOG_DIR"


for lig in ${LIGAND_DIR}/*.pdbqt; do
    lig_id=$(basename $lig .pdbqt)

    vina \
        --receptor $RECEPTOR \
        --ligand $lig \
        --config $CONFIG \
        --out ${OUT_DIR}/${lig_id}_out.pdbqt \
        > ${LOG_DIR}/${lig_id}.log

    echo "Docked ${lig_id}"
done

