source SMoPVenv/bin/activate
CUDA_VISIBLE_DEVICES=0
for dataset in rte_superglue cb 
do
    for epoch in 50 100
    do
        for lr in 0.7 0.5 0.3 0.1
        do
            python scripts/train.py --lr $lr  --batch_size 32  --epoch $epoch --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name $dataset --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 4 --my_weighted_average True
        done
    done
done

# for dataset in boolq 
# do
#     for epoch in 10 20
#     do
#         for lr in 0.7 0.5 0.3 0.1
#         do
#             python scripts/train.py --lr $lr  --batch_size 32  --epoch $epoch --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name $dataset --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 4 --my_weighted_average True
#         done
#     done
# done