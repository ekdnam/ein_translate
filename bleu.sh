fairseq-generate data-bin/tokenized.mr-en \
    --path checkpoints/checkpoint_best.pt \
    --batch-size 128 --beam 5 --remove-bpe \
    --skip-invalid-size-inputs-valid-test

