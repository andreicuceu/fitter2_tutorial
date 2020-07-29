# picca fitter2 tutorial

Make sure you have the necessary packages by running
```
> pip install -r requirements.txt
```
or at NERSC:
```
> PATH_TO_CONDA_ENV/bin/pip install -r requirements.txt
```

Picca and Polychord are also required. 
Here are instructions for installing them at NERSC (assumes you have the default modules loaded):

Make a new conda env:
```
> module load python
> conda create -n picca python=3.7
> source activate picca
```
Swap modules to the GNU compilers:
```
> module swap PrgEnv-intel PrgEnv-gnu
> module load openmpi
```
Clone Polychord and compile:
```
> git clone https://github.com/PolyChord/PolyChordLite 
> cd PolyChordLite
> make clean
> make COMPILER_TYPE=gnu
```
Install python wrapper (the -e is crucial):
```
> PATH_TO_CONDA_ENV/bin/pip install -e .
> export LD_LIBRARY_PATH=PATH/PolyChordLite/lib:${LD_LIBRARY_PATH}
```
The export can be added to your bash_profile
Clone picca and install:
```
> git clone https://github.com/igmhub/picca.git
> cd picca
> PATH_TO_CONDA_ENV/bin/pip install -e .
> PATH_TO_CONDA_ENV/bin/pip install mpi4py
```


To run the fitter:
```
> PATH_TO_CONDA_ENV/bin/python PATH_TO_PICCA/bin/picca_fitter2_control.py chi2.ini
```

To run in parallel in interactive mode at NERSC:
```
> salloc -N 1 -C haswell -q interactive -t 00:30:00
> source activate picca
> srun -n 32 PATH_TO_CONDA_ENV/bin/python PATH_TO_PICCA/bin/picca_fitter2_control_mpi.py chi2.ini
```
