fairseq-preprocess --source-lang mr --target-lang en \
    --trainpref mr-en/train --validpref mr-en/valid --testpref mr-en/test \
    --destdir data-bin/tokenized.mr-en \
    --workers 20
