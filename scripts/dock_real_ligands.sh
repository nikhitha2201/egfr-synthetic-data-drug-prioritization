#!/bin/bash

RECEPTOR="/home/nikki/egfr_lowdata_scoring/data/protein/1m17_prepared.pdbqt"
CONFIG="/home/nikki/egfr_lowdata_scoring/docking_config.txt"
LIGAND_DIR="/home/nikki/egfr_lowdata_scoring/data/ligands_real/prepared_pdbqt"
OUT_DIR="/home/nikki/egfr_lowdata_scoring/results/real/poses"
LOG_DIR="/home/nikki/egfr_lowdata_scoring/results/real/logs"

mkdir -p $OUT_DIR $LOG_DIR

for ligand in ${LIGAND_DIR}/*.pdbqt; do
    ligand_id=$(basename $ligand .pdbqt)

    vina \
        --receptor $RECEPTOR \
        --ligand $ligand \
        --config $CONFIG \
        --out ${OUT_DIR}/${ligand_id}_out.pdbqt \
        > ${LOG_DIR}/${ligand_id}.log

    echo "Docked ${ligand_id}"
done
