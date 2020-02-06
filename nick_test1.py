import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import json
from pandas.io.json import json_normalize
from subprocess import check_output
import progressbar2

# print(check_output(["ls", '/Users/Nick/PycharmProjects/ClashRoyaleML/MethodsData2/matches.json']).decode("utf8"))

with open('/Users/Nick/PycharmProjects/ClashRoyaleML/MethodsData2/matches.txt') as file:
    CR = [line.strip() for line in file.readlines()]

# Check number of rows
print(len(CR))

deserialize_cr = [pd.json_normalize(eval(row)) for row in CR]
df_cr = pd.concat(deserialize_cr, ignore_index=True)

# Label Columns
df_cr.columns = ['Type','Result','Date','Right Deck','Right Trophies','Right Clan','Right Name','Left Deck','Left Trophies','Left Clan','Left Name']
print(df_cr.head())


df_cr.to_csv("/Users/Nick/PycharmProjects/ClashRoyaleML/MethodsData2/matches_full.csv")


# common cards = [['Arrows',3],['Tombstone',3],['Ice Spirit',1],['Goblins',2],['Zap',2],['Elite Barbarians',6],['Archers',3],['Knight',3],['Mortar',4],
# ['Spear Goblins',2],['Cannon',3],['Royal Giant',6],['Minions',3],['Minion Horde',5],'Skeletons',
# rare cards = ['Valkyrie','Hog Rider','Inferno Tower','Mega Minion','Musketeer','Three Musketeers','Fireball','Battle Ram','Heal',
# epic cards = ['Lightning','Bowler','Golem','Baby Dragon','Poison','Tornado',
# legendary cards = ['Princess','The Log','Bandit','Electro Wizard','Night Witch',
