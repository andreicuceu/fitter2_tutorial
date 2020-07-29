#!/bin/bash
#SBATCH --qos=debug
#SBATCH --time=00:30:00
#SBATCH --nodes=6
#SBATCH --tasks-per-node=32
#SBATCH --constraint=haswell
#SBATCH -o /global/cscratch1/sd/acuceu/run/dr16_lhcd/vanilla/logs/out.1

export OMP_NUM_THREADS=1
export LD_LIBRARY_PATH=/global/homes/a/acuceu/lib/PolyChordLite/lib:${LD_LIBRARY_PATH}

source activate picca
srun --tasks-per-node=32 /global/homes/a/acuceu/.conda/envs/picca/bin/python /global/u1/a/acuceu/lib/picca/bin/picca_fitter2_control_mpi.py /global/cscratch1/sd/acuceu/run/dr16_lhcd/vanilla/chi2.ini
