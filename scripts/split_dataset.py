#!/usr/bin/env python


#   Run script from base directory:
#   python scripts/split_dataset.py
#
###################################
#
#   Split data set into
#   - training (80 %)
#   - and test (20 %)
#   for supervised learning
#
###################################


from datetime import timedelta
import pathlib
import time
start = time.time()

import progressbar

import numpy as np
import pandas as pd



### SETTINGS

# Random seed
SEED = 42
np.random.seed(SEED)

# Base directory
BASE = pathlib.Path.cwd()

# Data dir
DATADIR = BASE / 'data_clean'
CSVFILE = 'processed_data.csv'

# Percentage of test data
TESTSPLIT = 20/100.0
TRAINSPLIT = 100.0 - TESTSPLIT



### HELPERS
# Time elapsed
def clock():
    return timedelta(seconds=(time.time() - start))



### SCRIPT

print("Ready  ({})".format(clock()))


df = pd.read_csv(DATADIR/CSVFILE)
print("Data imported  ({})".format(clock()))

N = len(df.index)
print("{} rows".format(N))

N_test = round(N * TESTSPLIT)
N_train = N - N_test

index = np.array(df.index.values)
np.random.shuffle(index)
index_test = index[:N_test]
index_train = index[N_test:]

df_test = df.iloc[index_test]
df_train = df.iloc[index_train]

np.savetxt(DATADIR/'data_split_indices_test.csv', index_test, delimiter=',')
np.savetxt(DATADIR/'data_split_indices_train.csv', index_train, delimiter=',')

df_test.to_csv(DATADIR/'data_split_test.csv')
df_train.to_csv(DATADIR/'data_split_train.csv')

print("Split data set into \n{:.0f}% training examples ({}) and \n{:.0f}% test examples ({})".format(
    (len(index_train)*1.0/N)*100, len(index_train),
    (len(index_test)*1.0/N)*100, len(index_test)
))
print("({})".format(clock()))


print("Done  ({})".format(clock()))
