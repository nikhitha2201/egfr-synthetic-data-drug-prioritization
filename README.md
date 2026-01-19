# egfr-synthetic-data-drug-prioritization
EGFR low-data hit prioritization using physics-aware synthetic data from docking.  Tests Genesis Molecular AI's GEMS/Pearl idea: real ChEMBL data + high-confidence docking pseudo-labels → Random Forest → ROC-AUC 0.81 → 1.00 improvement.  Full pipeline: ChEMBL → Vina docking → RDKit features → reproducible ML comparison.


## 🚀 Quick Start

```bash
# Clone & setup
git clone <your-repo>
cd egfr-synthetic-data-drug-prioritization
conda env create -f environment.yml
conda activate egfr_env

**## Run pipeline**
bash scripts/receptor_prep.sh
python notebooks/chembl_real_ligands.ipynb
bash scripts/prepared_pdbqt.sh
python notebooks/Docking.ipynb
bash scripts/dock_real_ligands.sh
python notebooks/feature_extract&model.ipynb

python notebooks/synth_ligands.ipynb
bash scripts/synthetic_pdbqt.sh
bash scripts/dock_synthetic.sh
python notebooks/synth_features&model.ipynb



