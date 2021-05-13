#!/bin/bash
#SBATCH -N 1
#SBATCH -p GPU          # Queue (partition) name
#SBATCH -t 48:00:00        # Run time (hh:mm:ss)
#SBATCH --gpus=4
#SBATCH --mail-user=donglinzhuang@outlook.com
#SBATCH --mail-type=all    # Send email at begin and end of job

conda activate py37
export PYTHONPATH="./"

python ./official/vision/image_classification/classifier_trainer.py --mode=train_and_eval --model_type=resnet --dataset=imagenet --model_dir=./ckpt_sh1/ --data_dir=/scratch/07464/donglinz/datasets/ILSVRC2012 --config_file=./official/vision/image_classification/configs/examples/resnet/imagenet/gpu.yaml --project imagenet --group rf_randtf