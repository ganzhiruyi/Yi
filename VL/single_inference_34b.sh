#!/bin/bash

#SBATCH --job-name=inference-yi-34b # create a short name for your job
#SBATCH --nodes=1 # node count
#SBATCH --ntasks-per-node=1 # total number of tasks across all nodes
#SBATCH --cpus-per-task=16 # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=48G # memory per cpu-core (4G is default)
#SBATCH --gres=gpu:hgx:1 # number of gpus per node
#SBATCH -p pol,pol-preempted # number of gpus per node

#SBATCH -o %x-%j.log # output and error log file names (%x for job id)

# pot-preempted
# --warmup_ratio 0.03

model_path='/cognitive_comp/ganruyi/huggingface_models/Yi-VL-34B'

python single_inference.py --model-path $model_path --image-file images/cats.jpg --question "Describe the cats and what they are doing in detail."