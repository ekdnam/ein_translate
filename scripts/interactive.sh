CUDA_VISIBLE_DEVICES=0 fairseq-interactive data-bin/tokenized.mr-en \
    --path checkpoints/checkpoint_best.pt \
    --batch-size 32 --beam 5 --remove-bpe \
    --skip-invalid-size-inputs-valid-test \
    --source-lang mr --target-lang en \
    --buffer-size 32
    
