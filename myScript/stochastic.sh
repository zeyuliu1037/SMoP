CUDA_VISIBLE_DEVICES=0
python scripts/train.py --lr 0.5  --batch_size 32  --epoch 50 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name rte_superglue --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1 --stochastic True
python scripts/train.py --lr 0.5  --batch_size 32  --epoch 50 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name cb --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1 --stochastic True
# python scripts/train.py --lr 0.5  --batch_size 32  --epoch 10 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name boolq --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1 --stochastic True
