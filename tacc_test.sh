#!/bin/bash
#SBATCH -J testjob           # Job name
#SBATCH -o testjob.o%j       # Name of stdout output file
#SBATCH -e testjob.e%j       # Name of stderr error file
#SBATCH -p development          # Queue (partition) name
#SBATCH -N 1               # Total # of nodes (must be 1 for serial)
#SBATCH -n 10              # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 00:30:00        # Run time (hh:mm:ss)
#SBATCH --mail-user=donglinzhuang@outlook.com
#SBATCH --mail-type=all    # Send email at begin and end of job

# Other commands must follow all #SBATCH directives...

module list
pwd
date
sleep 10

# Launch serial code...