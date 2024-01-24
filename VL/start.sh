#!/bin/bash

#SBATCH --job-name=IPYTORCH
#SBATCH --ntasks-per-node=1        # crucial - only 1 task per dist per node!
#SBATCH --cpus-per-task=20 #
#SBATCH --mem-per-cpu=8G
#SBATCH --gres=gpu:hgx:1              # number of gpus
#SBATCH -p pol,pol-preempted
#SBATCH -o ./IPYTORCH-debug-%x.log

echo "BEGIN"

MASTER_ADDR=`perl -le '$_=$ENV{"SLURM_JOB_NODELIST"}; s/,.*//; s/-.*//; s/\[//; print' | xargs -I {} host $n {} | awk '{print $4}'`
echo $MASTER_ADDR > ./ipy-addr.txt

jupyter notebook --ip 0.0.0.0