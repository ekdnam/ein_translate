export INDIC_NLP_RESOURCES="indic_nlp_resources"
python indicTrans/scripts/preprocess_translate.py og-en-mr/train.en indic_preprocess.en en
python indicTrans/scripts/preprocess_translate.py og-en-mr/train.mr indic_preprocess.mr mr