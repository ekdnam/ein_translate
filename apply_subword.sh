# echo "learning bpe and subword"
# python subword_nmt/subword_nmt/learn_joint_bpe_and_vocab.py --verbose --input indic_preprocess.mr indic_preprocess.en \
# 	-s 32000 \
# 	-o code --write-vocabulary vocab.mr vocab.en
echo "apply bpe [en]"
python subword_nmt/subword_nmt/apply_bpe.py -c code \
	--vocabulary vocab.mr \
	--vocabulary-threshold 50 < indic_preprocess.mr > subword.mr
echo "apply bpe [mr]"
python subword_nmt/subword_nmt/apply_bpe.py -c code \
	--vocabulary vocab.en \
	--vocabulary-threshold 50 < indic_preprocess.en > subword.en