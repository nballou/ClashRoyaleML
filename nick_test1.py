import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import json
from pandas.io.json import json_normalize
from subprocess import check_output

# print(check_output(["ls", '/Users/Nick/PycharmProjects/ClashRoyaleML/MethodsData2/matches.json']).decode("utf8"))

with open('/Users/Nick/PycharmProjects/ClashRoyaleML/MethodsData2/matches.json') as file:
    CR = [line.strip() for line in file.readlines()]

# Check number of rows
print(len(CR))

deserialize_cr = [pd.json_normalize(eval(row)) for row in CR[0:10000]]
df_cr = pd.concat(deserialize_cr, ignore_index=True)

# Label Columns
#df_cr.columns = ['Type','Result','Time','Left Trophy','Right Clan','Right Deck','Right Player','Right Trophy','RightTrophies','Clan','RightPlayer']
print(df_cr.head())

df_cr.to_csv("/Users/Nick/PycharmProjects/ClashRoyaleML/MethodsData2/matches.csv")
