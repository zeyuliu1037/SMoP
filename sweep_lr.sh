export CUDA_VISIBLE_DEVICES=0
lrs=(0.5 0.3 0.1 0.05 0.01 0.005 0.001 0.0005 0.0001)
model_name_or_path=google-t5/t5-base
for lr in "${lrs[@]}"; do
    echo "Running learning rate: $lr"
    python scripts/train.py --lr "$lr" --batch_size 32 --epoch 50 --max_length 512 \
    --model_name_or_path "$model_name_or_path" --tokenizer_name_or_path "$model_name_or_path" --warmup_ratio 0.06 \
    --method prompt-tuning --dataset_name copa --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1
done

# ['full', 'lora', 'prefix-tuning', 'p-tuning', 'prompt-tuning', 'prompt-routing']
