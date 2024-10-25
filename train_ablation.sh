#!/bin/bash
#SBATCH --job-name="ablation"
#SBATCH --output="ablation.out"
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
#SBATCH -t 24:00:00

source activate smop

for data in "cb" "copa" "wic" "rte_superglue"
do
    python scripts/train.py --lr 0.5  --batch_size 32  --epoch 50 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name $data --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1 \
                            --mlp True \

    python scripts/train.py --lr 0.5  --batch_size 32  --epoch 50 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name $data --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1 \
                            --mlp True --nonlinear True \

done

for data in "boolq" "multirc"
do
    python scripts/train.py --lr 0.5  --batch_size 32  --epoch 10 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name $data --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1 \
                            --mlp True \

    python scripts/train.py --lr 0.5  --batch_size 32  --epoch 10 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name $data --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1 \
                            --mlp True --nonlinear True \

done