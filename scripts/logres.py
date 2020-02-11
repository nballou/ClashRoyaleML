#!/usr/bin/env python


#   Run script from base directory:
#   python scripts/logres.py
#
###################################


from datetime import timedelta
import pathlib
import time
start = time.time()

import numpy as np
import pandas as pd
from sklearn.linear_model import LogisticRegression



### SETTINGS

# Base directory
BASE = pathlib.Path.cwd()

# Data dir and files
DATADIR = BASE / 'data_clean'

FILEPREFIX = 'processed_split_seed999'

FILENAME_TEST_DATA = '{}_test.csv'.format(FILEPREFIX)
FILENAME_TRAIN_DATA = '{}_train.csv'.format(FILEPREFIX)



### HELPERS
# Time elapsed
def clock():
    return timedelta(seconds=(time.time() - start))

# Feature and label loader
def load_data(PATH):
    df = pd.read_csv(PATH)

    # Fill missing data (card levels)
    df.fillna(-1.0, inplace=True)

    # Columns needed
    cols_labels = ['winner']
    cols_features = [
        'players.right.trophy',
        'players.left.trophy',
        'trophy.discrepancy',
        'Skeletons_L', 'Skeletons_R', 'Skeletons_L_lvl', 'Skeletons_R_lvl',
        'Ice_Spirit_L', 'Ice_Spirit_R', 'Ice_Spirit_L_lvl', 'Ice_Spirit_R_lvl',
        'Goblins_L', 'Goblins_R', 'Goblins_L_lvl', 'Goblins_R_lvl',
        'Spear_Goblins_L', 'Spear_Goblins_R', 'Spear_Goblins_L_lvl', 'Spear_Goblins_R_lvl',
        'Zap_L', 'Zap_R', 'Zap_L_lvl', 'Zap_R_lvl',
        'Bats_L', 'Bats_R', 'Bats_L_lvl', 'Bats_R_lvl',
        'Fire_Spirits_L', 'Fire_Spirits_R', 'Fire_Spirits_L_lvl', 'Fire_Spirits_R_lvl',
        'Archers_L', 'Archers_R', 'Archers_L_lvl', 'Archers_R_lvl', 'Arrows_L',
        'Arrows_R', 'Arrows_L_lvl', 'Arrows_R_lvl',
        'Knight_L', 'Knight_R', 'Knight_L_lvl', 'Knight_R_lvl',
        'Minions_L', 'Minions_R', 'Minions_L_lvl', 'Minions_R_lvl',
        'Bomber_L', 'Bomber_R', 'Bomber_L_lvl', 'Bomber_R_lvl',
        'Cannon_L', 'Cannon_R', 'Cannon_L_lvl', 'Cannon_R_lvl',
        'Goblin_Gang_L', 'Goblin_Gang_R', 'Goblin_Gang_L_lvl', 'Goblin_Gang_R_lvl',
        'Mortar_L', 'Mortar_R', 'Mortar_L_lvl', 'Mortar_R_lvl',
        'Tesla_L', 'Tesla_R', 'Tesla_L_lvl', 'Tesla_R_lvl',
        'Barbarians_L', 'Barbarians_R', 'Barbarians_L_lvl', 'Barbarians_R_lvl',
        'Minion_Horde_L', 'Minion_Horde_R', 'Minion_Horde_L_lvl', 'Minion_Horde_R_lvl',
        'Royal_Giant_L', 'Royal_Giant_R', 'Royal_Giant_L_lvl', 'Royal_Giant_R_lvl',
        'Elite_Barbarians_L', 'Elite_Barbarians_R', 'Elite_Barbarians_L_lvl', 'Elite_Barbarians_R_lvl',
        'Heal_L', 'Heal_R', 'Heal_L_lvl', 'Heal_R_lvl',
        'Ice_Golem_L', 'Ice_Golem_R', 'Ice_Golem_L_lvl', 'Ice_Golem_R_lvl',
        'Tombstone_L', 'Tombstone_R', 'Tombstone_L_lvl', 'Tombstone_R_lvl',
        'Mega_Minion_L', 'Mega_Minion_R', 'Mega_Minion_L_lvl', 'Mega_Minion_R_lvl',
        'Dart_Goblin_L', 'Dart_Goblin_R', 'Dart_Goblin_L_lvl', 'Dart_Goblin_R_lvl',
        'Fireball_L', 'Fireball_R', 'Fireball_L_lvl', 'Fireball_R_lvl',
        'Mini_Pekka_L', 'Mini_Pekka_R', 'Mini_Pekka_L_lvl', 'Mini_Pekka_R_lvl',
        'Musketeer_L', 'Musketeer_R', 'Musketeer_L_lvl', 'Musketeer_R_lvl',
        'Hog_Rider_L', 'Hog_Rider_R', 'Hog_Rider_L_lvl', 'Hog_Rider_R_lvl',
        'Valkyrie_L', 'Valkyrie_R', 'Valkyrie_L_lvl', 'Valkyrie_R_lvl',
        'Battle_Ram_L', 'Battle_Ram_R', 'Battle_Ram_L_lvl', 'Battle_Ram_R_lvl',
        'Furnace_L', 'Furnace_R', 'Furnace_L_lvl', 'Furnace_R_lvl',
        'Flying_Machine_L', 'Flying_Machine_R', 'Flying_Machine_L_lvl', 'Flying_Machine_R_lvl',
        'Bomb_Tower_L', 'Bomb_Tower_R', 'Bomb_Tower_L_lvl', 'Bomb_Tower_R_lvl',
        'Giant_L', 'Giant_R', 'Giant_L_lvl', 'Giant_R_lvl',
        'Goblin_Hut_L', 'Goblin_Hut_R', 'Goblin_Hut_L_lvl', 'Goblin_Hut_R_lvl',
        'Inferno_Tower_L', 'Inferno_Tower_R', 'Inferno_Tower_L_lvl', 'Inferno_Tower_R_lvl',
        'Wizard_L', 'Wizard_R', 'Wizard_L_lvl', 'Wizard_R_lvl',
        'Rocket_L', 'Rocket_R', 'Rocket_L_lvl', 'Rocket_R_lvl',
        'Elixir_Collector_L', 'Elixir_Collector_R', 'Elixir_Collector_L_lvl', 'Elixir_Collector_R_lvl',
        'Barbarian_Hut_L', 'Barbarian_Hut_R', 'Barbarian_Hut_L_lvl', 'Barbarian_Hut_R_lvl',
        'Three_Musketeers_L', 'Three_Musketeers_R', 'Three_Musketeers_L_lvl', 'Three_Musketeers_R_lvl',
        'Mirror_L', 'Mirror_R', 'Mirror_L_lvl', 'Mirror_R_lvl',
        'Rage_L', 'Rage_R', 'Rage_L_lvl', 'Rage_R_lvl',
        'Skeleton_Army_L', 'Skeleton_Army_R', 'Skeleton_Army_L_lvl', 'Skeleton_Army_R_lvl',
        'Goblin_Barrel_L', 'Goblin_Barrel_R', 'Goblin_Barrel_L_lvl', 'Goblin_Barrel_R_lvl',
        'Tornado_L', 'Tornado_R', 'Tornado_L_lvl', 'Tornado_R_lvl',
        'Guards_L', 'Guards_R', 'Guards_L_lvl', 'Guards_R_lvl',
        'Clone_L', 'Clone_R', 'Clone_L_lvl', 'Clone_R_lvl',
        'Baby_Dragon_L', 'Baby_Dragon_R', 'Baby_Dragon_L_lvl', 'Baby_Dragon_R_lvl',
        'Hunter_L', 'Hunter_R', 'Hunter_L_lvl', 'Hunter_R_lvl',
        'Poison_L', 'Poison_R', 'Poison_L_lvl', 'Poison_R_lvl',
        'Dark_Prince_L', 'Dark_Prince_R', 'Dark_Prince_L_lvl', 'Dark_Prince_R_lvl',
        'Freeze_L', 'Freeze_R', 'Freeze_L_lvl', 'Freeze_R_lvl',
        'Prince_L', 'Prince_R', 'Prince_L_lvl', 'Prince_R_lvl',
        'Witch_L', 'Witch_R', 'Witch_L_lvl', 'Witch_R_lvl',
        'Balloon_L', 'Balloon_R', 'Balloon_L_lvl', 'Balloon_R_lvl',
        'Bowler_L', 'Bowler_R', 'Bowler_L_lvl', 'Bowler_R_lvl',
        'Executioner_L', 'Executioner_R', 'Executioner_L_lvl', 'Executioner_R_lvl',
        'Giant_Skeleton_L', 'Giant_Skeleton_R', 'Giant_Skeleton_L_lvl', 'Giant_Skeleton_R_lvl',
        'Lightning_L', 'Lightning_R', 'Lightning_L_lvl', 'Lightning_R_lvl',
        'X_Bow_L', 'X_Bow_R', 'X_Bow_L_lvl', 'X_Bow_R_lvl',
        'PEKKA_L', 'PEKKA_R', 'PEKKA_L_lvl', 'PEKKA_R_lvl',
        'Golem_L', 'Golem_R', 'Golem_L_lvl', 'Golem_R_lvl',
        'The_Log_L', 'The_Log_R', 'The_Log_L_lvl', 'The_Log_R_lvl',
        'Miner_L', 'Miner_R', 'Miner_L_lvl', 'Miner_R_lvl',
        'Princess_L', 'Princess_R', 'Princess_L_lvl', 'Princess_R_lvl',
        'Ice_Wizard_L', 'Ice_Wizard_R', 'Ice_Wizard_L_lvl', 'Ice_Wizard_R_lvl',
        'Bandit_L', 'Bandit_R', 'Bandit_L_lvl', 'Bandit_R_lvl',
        'Night_Witch_L', 'Night_Witch_R', 'Night_Witch_L_lvl', 'Night_Witch_R_lvl',
        'Inferno_Dragon_L', 'Inferno_Dragon_R', 'Inferno_Dragon_L_lvl', 'Inferno_Dragon_R_lvl',
        'Lumberjack_L', 'Lumberjack_R', 'Lumberjack_L_lvl', 'Lumberjack_R_lvl',
        'Electro_Wizard_L', 'Electro_Wizard_R', 'Electro_Wizard_L_lvl', 'Electro_Wizard_R_lvl',
        'Graveyard_L', 'Graveyard_R', 'Graveyard_L_lvl', 'Graveyard_R_lvl',
        'Sparky_L', 'Sparky_R', 'Sparky_L_lvl', 'Sparky_R_lvl',
        'Lava_Hound_L', 'Lava_Hound_R', 'Lava_Hound_L_lvl', 'Lava_Hound_R_lvl'
    ]

    # Grab features
    X = df[cols_features].to_numpy()

    # Map target values
    # 'left': 0
    # 'right': 1
    y = np.ravel(np.where( df[cols_labels] == 'left', 0, 1 ))

    print("Loaded data  ({}) \n{} \n{} examples \n".format(clock(), PATH.name, len(df.index)))
    return X, y


### SCRIPT

print("Ready  ({})\n".format(clock()))


X, y = load_data(DATADIR/FILENAME_TRAIN_DATA)
X_test, y_test = load_data(DATADIR/FILENAME_TEST_DATA)


clf = LogisticRegression(
    random_state = 0,
    max_iter = 1000
).fit(X, y)

score = clf.score(X_test, y_test)
print("Test score  ({}) \n{}\n".format(clock(), score))


print("Done  ({})".format(clock()))
