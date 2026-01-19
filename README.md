# egfr-synthetic-data-drug-prioritization
EGFR synthetic and real ligand dataset for ML-based scoring and prioritization.  
Includes docking pipelines, feature extraction, and baseline machine learning models.  
Results with ROC/PR curves and PyMOL visualizations for protein-ligand interactions.


## 🚀 Quick Start

```bash
# Clone & setup
git clone <your-repo>
cd egfr-synthetic-data-drug-prioritization
conda env create -f environment.yml
conda activate egfr_env

# Run pipeline
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



