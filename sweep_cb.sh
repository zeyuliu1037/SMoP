source SMoPVenv/bin/activate
CUDA_VISIBLE_DEVICES=0
for lr in 0.3 0.1
do
    python3 scripts/train.py --lr $lr  --batch_size 32  --epoch 10 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name cb --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router False --topk 1
    python3 scripts/train.py --lr $lr  --batch_size 32  --epoch 10 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name cb --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 2
    python3 scripts/train.py --lr $lr  --batch_size 32  --epoch 10 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name cb --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1 --gumbel True
    python3 scripts/train.py --lr $lr  --batch_size 32  --epoch 10 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name cb --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1 --stochastic True
    python3 scripts/train.py --lr $lr  --batch_size 32  --epoch 10 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-tuning --dataset_name cb --num_virtual_tokens 5
done
