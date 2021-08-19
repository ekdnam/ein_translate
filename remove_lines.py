#!/home/pict/anaconda3/bin/python3.8
import pandas as pd
import numpy as np

filename = 'subword.mr'
mr = None
with open(filename) as f:
    x = f.readlines()
    if x != '\n':
      mr = x
mr = [x.replace('\n', '') for x in mr]
mr = list(filter(None, mr))

filename = 'subword.en'
en = None
with open(filename) as f:
    x = f.readlines()
    if x != '\n':
      en = x
en = [x.replace('\n', '') for x in en]
en = list(filter(None, en))

# df
mr_en = pd.DataFrame()
# add columns
mr_en['mr'] = mr[1:]
mr_en['en'] = en[1:]

def train_validate_test_split(df, train_percent=.6, validate_percent=.2, seed=None):
  np.random.seed(seed)
  perm = np.random.permutation(df.index)
  m = len(df.index)
  train_end = int(train_percent * m)
  validate_end = int(validate_percent * m) + train_end
  train = df.iloc[perm[:train_end]]
  validate = df.iloc[perm[train_end:validate_end]]
  test = df.iloc[perm[validate_end:]]
  return train, validate, test

# train test split
# train, validate, test = \
#               np.split(mr_en.sample(frac=1, random_state=42), 
#                        [int(.6*len(mr_en)), int(.8*len(mr_en))])

train, validate, test = \
              train_validate_test_split(df=mr_en, train_percent=0.98, validate_percent=0.01, seed=42)
# train
pd.DataFrame(train['mr']).to_csv('train.mr', index=False)
pd.DataFrame(train['en']).to_csv('train.en', index=False)
# validate
pd.DataFrame(validate['mr']).to_csv('valid.mr', index=False)
pd.DataFrame(validate['en']).to_csv('valid.en', index=False)
# test
pd.DataFrame(test['mr']).to_csv('test.mr', index=False)
pd.DataFrame(test['en']).to_csv('test.en', index=False)
