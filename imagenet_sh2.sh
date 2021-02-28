#!/bin/bash
#SBATCH -J imagenet_sh2           # Job name
#SBATCH -o imagenet_sh2.log       # Name of stdout output file
#SBATCH -p v100          # Queue (partition) name
#SBATCH -N 1               # Total # of nodes (must be 1 for serial)
#SBATCH -n 1              # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 48:00:00        # Run time (hh:mm:ss)
#SBATCH --mail-user=donglinzhuang@outlook.com
#SBATCH --mail-type=all    # Send email at begin and end of job

# Other commands must follow all #SBATCH directives...

conda activate py37
export PHTHONPATH="./"

python ./official/vision/image_classification/classifier_trainer.py --mode=train_and_eval --model_type=resnet --dataset=imagenet --model_dir=./ckpt_sh2/ --data_dir=/scratch/07464/donglinz/datasets/ILSVRC2012 --deterministic_input --config_file=./official/vision/image_classification/configs/examples/resnet/imagenet/gpu.yaml --project imagenet --group rf_randtf