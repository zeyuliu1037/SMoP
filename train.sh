# CUDA_VISIBLE_DEVICES=0
# model_name_or_path=google-t5/t5-base
# python scripts/train.py --lr 0.5  --batch_size 32  --epoch 50 --max_length 512 \
#  --model_name_or_path $model_name_or_path --tokenizer_name_or_path $model_name_or_path --warmup_ratio 0.06 \
#  --method p-tuning --dataset_name cb --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1

CUDA_VISIBLE_DEVICES=0
model_name_or_path=google-t5/t5-large
python scripts/train.py --lr 0.5  --batch_size 32  --epoch 10 --max_length 512 \
 --model_name_or_path $model_name_or_path --tokenizer_name_or_path $model_name_or_path --warmup_ratio 0.06 \
 --method p-tuning --dataset_name wic --num_virtual_tokens 5 --num_virtual_tokens_full 20 \
 --perturb_router True --topk 1 --eval_flops True

    # "cb"
    # "copa"
    # "rte_superglue"
    # "wic"
    # "boolq" 10 smop
    # "multirc" 10 smop0
    # facebook/blenderbot-400M-distill facebook/bart-base
    # google-t5/t5-base google/flan-t5-base 82.1
    # prompt-tuning
    # p-tuning
    # prompt-routing