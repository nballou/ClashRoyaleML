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
SEED = 112
np.random.seed(SEED)

# Base directory
BASE = pathlib.Path.cwd()

# Data dir and files
DATADIR = BASE / 'data_clean'
CSVFILE = 'processed_data_2.csv'
SAVEPREFIX = 'processed_split2_seed{}'.format(SEED)

FILENAME_TEST_INDEX = '{}_indices_test.csv'.format(SAVEPREFIX)
FILENAME_TRAIN_INDEX = '{}_indices_train.csv'.format(SAVEPREFIX)
FILENAME_TEST_DATA = '{}_test.csv'.format(SAVEPREFIX)
FILENAME_TRAIN_DATA = '{}_train.csv'.format(SAVEPREFIX)

# Percentage of test data
TESTSPLIT = 20/100.0
TRAINSPLIT = 100.0 - TESTSPLIT



### HELPERS
# Time elapsed
def clock():
    return timedelta(seconds=(time.time() - start))



### SCRIPT

print("Ready  ({}) \n".format(clock()))


df = pd.read_csv(DATADIR/CSVFILE)
N = len(df.index)
print("Data imported  ({}) \n"\
    "{} rows \n".format(
        clock(),
        N
    ))

N_test = round(N * TESTSPLIT)
N_train = N - N_test

index = np.array(df.index.values)
np.random.shuffle(index)
print("Shuffled data set  ({}) \n"\
    "random seed {} \n".format(
        clock(),
        SEED
    ))

index_test = index[:N_test]
index_train = index[N_test:]

df_test = df.iloc[index_test]
df_train = df.iloc[index_train]

print("Split data set  ({}) \n"\
    "{:.0f}% training examples ({}) and \n"\
    "{:.0f}% test examples ({}) \n".format(
        clock(),
        (len(index_train)*1.0/N)*100, len(index_train),
        (len(index_test)*1.0/N)*100, len(index_test)
    ))

np.savetxt(DATADIR/FILENAME_TEST_INDEX, index_test, delimiter=',')
np.savetxt(DATADIR/FILENAME_TRAIN_INDEX, index_train, delimiter=',')

df_test.to_csv(DATADIR/FILENAME_TEST_DATA)
df_train.to_csv(DATADIR/FILENAME_TRAIN_DATA)

print("Saved split sets and indices  ({}) \n"\
    "{} \n"\
    "{} \n".format(
        clock(),
        FILENAME_TEST_DATA,
        FILENAME_TRAIN_DATA
    ))


print("Done  ({})".format(clock()))
