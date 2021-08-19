#!/bin/bash

EXPDIR=$PWD

if [ ! -d $EXPDIR/mosesdecoder ]; then 
  git clone https://github.com/moses-smt/mosesdecoder.git
fi

if [ ! -d $EXPDIR/indicTrans ]; then 
 git clone https://github.com/AI4Bharat/indicTrans.git
fi

if [ ! -d $EXPDIR/subword_nmt ]; then 
 git clone https://github.com/rsennrich/subword-nmt subword_nmt
 pushd subword_nmt
 pip install -r requirements.txt
 popd
fi

if [ ! -d $EXPDIR/indic_nlp_library ]; then 
 git clone https://github.com/anoopkunchukuttan/indic_nlp_library
 pushd indic_nlp_library
 pip install -r requirements.txt
 popd
fi

if [ ! -d $EXPDIR/fairseq ]; then 
 git clone https://github.com/pytorch/fairseq
 pushd fairseq
 pip install --editable ./
 popd
fi

if [[ -z "${INDIC_NLP_RESOURCES}" ]]; then
  git clone https://github.com/anoopkunchukuttan/indic_nlp_resources
  export INDIC_NLP_RESOURCES="${EXPDIR}/indic_nlp_resources"
else
  echo "Indic NLP Resources exists"
fi
