#!/bin/bash

# Inspired from https://github.com/surafelml/improving-zeroshot-nmt/blob/master/setup-env.sh

EXPDIR=$PWD

echo "Installing dependencies"

# check mosesdecoder
if [ ! -d ${EXPDIR}/mosesdecoder ]; then 
  echo "Mosesdecoder not found. Cloning from moses-smt/mosesdecoder"
  git clone https://github.com/moses-smt/mosesdecoder.git
else
  echo "mosesdecoder already exists. Skipping download."
fi

# check indicTrans
if [ ! -d ${EXPDIR}/indicTrans ]; then 
 echo "indicTrans not found. Cloning from AI4Bharat/indicTrans"
 git clone https://github.com/AI4Bharat/indicTrans.git
else
  echo "indicTrans already exists. Skipping download."
fi

# check subword_nmt
if [ ! -d ${EXPDIR}/subword_nmt ]; then 
 echo "subword_nmt not found. Cloning from rsennrich/subword-nmt"
 git clone https://github.com/rsennrich/subword-nmt subword_nmt
 pushd subword_nmt
 pip install -r requirements.txt
 popd
else
  echo "subword_nmt already exists. Skipping download."
fi

# check indic_nlp_library
if [ ! -d ${EXPDIR}/indic_nlp_library ]; then 
 echo "indic_nlp_library not found. Cloning from anoopkunchukuttan/indic_nlp_library"
 git clone https://github.com/anoopkunchukuttan/indic_nlp_library
 pushd indic_nlp_library
 pip install -r requirements.txt
 popd
else
  echo "indic_nlp_library already exists. Skipping download."
fi

# check fairseq
if [ ! -d ${EXPDIR}/fairseq ]; then 
 echo "fairseq not found. Cloning from pytorch/fairseq"
 git clone https://github.com/pytorch/fairseq
 pushd fairseq
 pip install --editable ./
 popd
else
  echo "fairseq already exists. Skipping download."
fi

# check indic_nlp_resources
if [[ -z "${INDIC_NLP_RESOURCES}" ]]; then
  echo "indic_nlp_resources not found. Cloning from anoopkunchukuttan/indic_nlp_resources"
  git clone https://github.com/anoopkunchukuttan/indic_nlp_resources
  export INDIC_NLP_RESOURCES="${EXPDIR}/indic_nlp_resources"
else
  echo "indic_nlp_resources already exists. Skipping download."
fi
