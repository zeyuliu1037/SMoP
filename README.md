# SMoP (Sparse Mixture-of-Prompts)
 
The repository is the **reproduced project** of the EMNLP 2023 paper **"SMoP: Towards Efficient and Effective Prompt Tuning with Sparse Mixture-of-Prompts"**, written by **Joon-Young Choi**, Junho Kim, Jun-Hyung Park, Mok-Wing Lam, and SangKeun Lee.

You can find the orginal paper at https://aclanthology.org/2023.emnlp-main.884/

## Install required modules 
This codebase is implemented on Python 3.9.18. 
Run 
```
pip install -r requirements.txt
```
to download all required modules.

## Downloading the Dataset
Download the SuperGLUE datasets by
```
python data/superglue/get_huggingface_superglue.py
```
or use your custom dataset. In that case, you need to create your custom `Dataset` class for your dataset in `src/dataset.py` and apply mandatory changes such as importing your dataset or modifying the training script.

## Training
We use the following code for most experiments on cb, copa, wic, and rte_superglue datasets:
```
python scripts/train.py --lr 0.5  --batch_size 32  --epoch 50 --max_length 512  --model_name_or_path t5-base --tokenizer_name_or_path t5-base --warmup_ratio 0.06 --method prompt-routing --dataset_name rte_superglue --num_virtual_tokens 5 --num_virtual_tokens_full 20 --perturb_router True --topk 1 --eval_flops False
```
For the boolq and multirc datasets, as referenced in Appendix C of the original paper, we reduce the total training epochs to 10.

Note: Our results are (slightly) worse than those reported in the original paper. A more extensive hyperparameter sweep may be necessary to fully replicate the findings of the original study.

The training script includes the script for evaluation and exporting the results to `results/{model_name_or_path}/{args.dataset_name}/{args.method}.txt` file. 

### Arguments
- `method`: The training method
  - `full`: Full model fine-tuning
  - `prompt-tuning`: Directly fine-tuning the soft prompts (from [Lester et al., 2021](https://aclanthology.org/2021.emnlp-main.243/))
  - `p-tuning`: Utilizing a reparameterization model on the soft prompts (from [Liu et al, 2021](https://arxiv.org/abs/2103.10385))
  - `prompt-routing`: Use **SMoP** for training
  - `lora+X`: Use LoRA + X (prompt-tuning/p-tuning/prompt-routing) to test the combination of the LoRA and other different methods
 
- `num_virtual_tokens`: The number of the soft prompt tokens attached to the input instance. No impact when the training method is `full`
- `num_virtual_tokens_full`: The total number of soft prompt tokens used during training. For `prompt-routing`, this is different from 'num_virtual_tokens', while it is the same on other methods.
  - For example, if you want to use **SMoP** with 4 soft prompts of length 5, you need to set `num_virtual_tokens` as 5 and `num_virtual_tokens_full` as 20.
 
- `perturb_router`: If True, scaled Gaussian noise (Section 2.3 of our paper) is applied during training.

- `topk`: Number of soft prompt tokens to route each input instance. If larger than 2, the weighted sum of multiple soft prompts is applied.

- `eval_flops`: Whether to use the [DeepSpeed](https://www.deepspeed.ai/tutorials/flops-profiler/) library to evaluate the FLOPs and latency of the models. 

## Acknowledgments
Our implementation is largely based on the [Original SMoP](https://github.com/jyjohnchoi/SMoP).

## Issues
If you have any issues with our paper or the codebase, please leave an issue in the repository or send an email to johnjames@korea.ac.kr
