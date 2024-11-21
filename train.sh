CUDA_VISIBLE_DEVICES=1
python scripts/train.py --lr 0.5  --batch_size 16  --epoch 10 --max_length 512 \
 --model_name_or_path t5-large --tokenizer_name_or_path t5-large --warmup_ratio 0.06 \
 --method prompt-routing --dataset_name boolq --num_virtual_tokens 5 \
 --num_virtual_tokens_full 20 --perturb_router True --topk 1


# t5-large base 'boolq', 'cb', 'copa', 'multirc', 'rte_superglue', 'wic', 'semeval'