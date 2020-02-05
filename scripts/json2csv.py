#!/usr/bin/env python

import time

# pip install progressbar2
import progressbar

import pathlib
import pandas as pd


start = time.time()


### SET PATHS
# Base directory
BASE = pathlib.Path.cwd()

print(BASE)

# Raw data dir
RAWDIR = BASE / 'data_raw'
RAWFILE = 'matches.txt'

SAVEDIR = BASE / 'data_clean'


### READ DATA
with open(RAWDIR / RAWFILE) as file:
    rows = [line.strip() for line in file.readlines()]

# Check number of rows
print("{} rows".format(len(rows)))

# json = [pd.io.json.json_normalize(eval(row)) for row in rows]
json = []
with progressbar.ProgressBar(max_value=len(rows)) as bar:
    for i, row in enumerate(rows):
        try:
            json.append(pd.io.json.json_normalize(eval(row)))
        except:
            pass
        bar.update(i)

df = pd.concat(json, ignore_index=True)

print(df.head())

df.to_csv(SAVEDIR/'matches.csv')

end = time.time()
print("Time elapsed: {}".format(end - start))
