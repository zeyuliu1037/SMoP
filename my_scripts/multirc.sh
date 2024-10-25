#!/bin/bash
#SBATCH --job-name="multirc"
#SBATCH --output="multirc_third.out"
#SBATCH --partition=gpuA40x4
#SBATCH --mem=50G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1  # could be 1 for py-torch
#SBATCH --cpus-per-task=16   # spread out to use 1 core per numa, set to 64 if tasks is 1
#SBATCH --constraint="scratch"
#SBATCH --gpus-per-node=1
#SBATCH --gpu-bind=closest   # select a cpu close to gpu on pci bus topology
#SBATCH --account=bcqc-delta-gpu
#SBATCH --no-requeue
#SBATCH -t 48:00:00

source activate smop

for length in 1 3 5 10
do
    for multiplier in 2 4 10 20
    do
        full=$((length * multiplier))
        python scripts/train.py --lr 0.5  --batch_size 32  --epoch 10 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name multirc --num_virtual_tokens $length --num_virtual_tokens_full $full --perturb_router True --topk 1
    done
done