#!/bin/bash
#SBATCH -N 1
#SBATCH -p GPU          # Queue (partition) name
#SBATCH -t 48:00:00        # Run time (hh:mm:ss)
#SBATCH --gpus=8
#SBATCH --mail-user=donglinzhuang@outlook.com
#SBATCH --mail-type=all    # Send email at begin and end of job

# Other commands must follow all #SBATCH directives...

module load cuda/11
module load cudnn

export PYTHONPATH="./"
export CUDA_VISIBLE_DEVICES="0,1,2,3"
nohup python ./official/vision/image_classification/classifier_trainer.py --mode=train_and_eval --model_type=resnet --dataset=imagenet --model_dir=./ckpt_sh31/ --data_dir=/ocean/projects/asc200010p/shared/dataset/deeplearning/imagenet/tfds --config_file=./official/vision/image_classification/configs/examples/resnet/imagenet/gpu.yaml --project imagenet --group rf_randtf
export CUDA_VISIBLE_DEVICES="4,5,6,7"
nohup python ./official/vision/image_classification/classifier_trainer.py --mode=train_and_eval --model_type=resnet --dataset=imagenet --model_dir=./ckpt_sh32/ --data_dir=/ocean/projects/asc200010p/shared/dataset/deeplearning/imagenet/tfds --config_file=./official/vision/image_classification/configs/examples/resnet/imagenet/gpu.yaml --project imagenet --group rf_randtf

wait $(jobs -p)

