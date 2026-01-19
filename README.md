# egfr-synthetic-data-drug-prioritization
EGFR low-data hit prioritization using physics-aware synthetic data from docking.  Tests Genesis Molecular AI's GEMS/Pearl idea: real ChEMBL data + high-confidence docking pseudo-labels → Random Forest → ROC-AUC 0.81 → 1.00 improvement.  Full pipeline: ChEMBL → Vina docking → RDKit features → reproducible ML comparison.
