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
from sklearn.externals import joblib
from sklearn.neural_network import MLPClassifier



### SETTINGS

# Random seed
SEED = 112

# Base directory
BASE = pathlib.Path.cwd()

# Data dir and files
DATADIR = BASE / 'data_clean'

FILEPREFIX = 'processed_split2_seed112'

FILENAME_TEST_DATA = '{}_test.csv'.format(FILEPREFIX)
FILENAME_TRAIN_DATA = '{}_train.csv'.format(FILEPREFIX)

MODELDIR = BASE / 'models'
SAVENAME = 'mlp.joblib.pkl'



### DATA COLS
cols_labels = ['winner']
cols_features_trophies = [
    'players.right.trophy', 'players.left.trophy',
    'trophy.discrepancy'
]
cols_features_cards = [
    'Skeletons_L', 'Skeletons_R',
    'Ice_Spirit_L', 'Ice_Spirit_R',
    'Goblins_L', 'Goblins_R',
    'Spear_Goblins_L', 'Spear_Goblins_R',
    'Zap_L', 'Zap_R',
    'Bats_L', 'Bats_R',
    'Fire_Spirits_L', 'Fire_Spirits_R',
    'Archers_L', 'Archers_R',
    'Arrows_L', 'Arrows_R',
    'Knight_L', 'Knight_R',
    'Minions_L', 'Minions_R',
    'Bomber_L', 'Bomber_R',
    'Cannon_L', 'Cannon_R',
    'Goblin_Gang_L', 'Goblin_Gang_R',
    'Mortar_L', 'Mortar_R',
    'Tesla_L', 'Tesla_R',
    'Barbarians_L', 'Barbarians_R',
    'Minion_Horde_L', 'Minion_Horde_R',
    'Royal_Giant_L', 'Royal_Giant_R',
    'Elite_Barbarians_L', 'Elite_Barbarians_R',
    'Heal_L', 'Heal_R',
    'Ice_Golem_L', 'Ice_Golem_R',
    'Tombstone_L', 'Tombstone_R',
    'Mega_Minion_L', 'Mega_Minion_R',
    'Dart_Goblin_L', 'Dart_Goblin_R',
    'Fireball_L', 'Fireball_R',
    'Mini_Pekka_L', 'Mini_Pekka_R',
    'Musketeer_L', 'Musketeer_R',
    'Hog_Rider_L', 'Hog_Rider_R',
    'Valkyrie_L', 'Valkyrie_R',
    'Battle_Ram_L', 'Battle_Ram_R',
    'Furnace_L', 'Furnace_R',
    'Flying_Machine_L', 'Flying_Machine_R',
    'Bomb_Tower_L', 'Bomb_Tower_R',
    'Giant_L', 'Giant_R',
    'Goblin_Hut_L', 'Goblin_Hut_R',
    'Inferno_Tower_L', 'Inferno_Tower_R',
    'Wizard_L', 'Wizard_R',
    'Rocket_L', 'Rocket_R',
    'Elixir_Collector_L', 'Elixir_Collector_R',
    'Barbarian_Hut_L', 'Barbarian_Hut_R',
    'Three_Musketeers_L', 'Three_Musketeers_R',
    'Mirror_L', 'Mirror_R',
    'Rage_L', 'Rage_R',
    'Skeleton_Army_L', 'Skeleton_Army_R',
    'Goblin_Barrel_L', 'Goblin_Barrel_R',
    'Tornado_L', 'Tornado_R',
    'Guards_L', 'Guards_R',
    'Clone_L', 'Clone_R',
    'Baby_Dragon_L', 'Baby_Dragon_R',
    'Hunter_L', 'Hunter_R',
    'Poison_L', 'Poison_R',
    'Dark_Prince_L', 'Dark_Prince_R',
    'Freeze_L', 'Freeze_R',
    'Prince_L', 'Prince_R',
    'Witch_L', 'Witch_R',
    'Balloon_L', 'Balloon_R',
    'Bowler_L', 'Bowler_R',
    'Executioner_L', 'Executioner_R',
    'Giant_Skeleton_L', 'Giant_Skeleton_R',
    'Lightning_L', 'Lightning_R',
    'X_Bow_L', 'X_Bow_R',
    'PEKKA_L', 'PEKKA_R',
    'Golem_L', 'Golem_R',
    'The_Log_L', 'The_Log_R',
    'Miner_L', 'Miner_R',
    'Princess_L', 'Princess_R',
    'Ice_Wizard_L', 'Ice_Wizard_R',
    'Bandit_L', 'Bandit_R',
    'Night_Witch_L', 'Night_Witch_R',
    'Inferno_Dragon_L', 'Inferno_Dragon_R',
    'Lumberjack_L', 'Lumberjack_R',
    'Electro_Wizard_L', 'Electro_Wizard_R',
    'Graveyard_L', 'Graveyard_R',
    'Sparky_L', 'Sparky_R',
    'Lava_Hound_L', 'Lava_Hound_R'
]
cols_features_card_lvls = [
    'Skeletons_L_lvl', 'Skeletons_R_lvl',
    'Ice_Spirit_L_lvl', 'Ice_Spirit_R_lvl',
    'Goblins_L_lvl', 'Goblins_R_lvl',
    'Spear_Goblins_L_lvl', 'Spear_Goblins_R_lvl',
    'Zap_L_lvl', 'Zap_R_lvl',
    'Bats_L_lvl', 'Bats_R_lvl',
    'Fire_Spirits_L_lvl', 'Fire_Spirits_R_lvl',
    'Archers_L_lvl', 'Archers_R_lvl',
    'Arrows_L_lvl', 'Arrows_R_lvl',
    'Knight_L_lvl', 'Knight_R_lvl',
    'Minions_L_lvl', 'Minions_R_lvl',
    'Bomber_L_lvl', 'Bomber_R_lvl',
    'Cannon_L_lvl', 'Cannon_R_lvl',
    'Goblin_Gang_L_lvl', 'Goblin_Gang_R_lvl',
    'Mortar_L_lvl', 'Mortar_R_lvl',
    'Tesla_L_lvl', 'Tesla_R_lvl',
    'Barbarians_L_lvl', 'Barbarians_R_lvl',
    'Minion_Horde_L_lvl', 'Minion_Horde_R_lvl',
    'Royal_Giant_L_lvl', 'Royal_Giant_R_lvl',
    'Elite_Barbarians_L_lvl', 'Elite_Barbarians_R_lvl',
    'Heal_L_lvl', 'Heal_R_lvl',
    'Ice_Golem_L_lvl', 'Ice_Golem_R_lvl',
    'Tombstone_L_lvl', 'Tombstone_R_lvl',
    'Mega_Minion_L_lvl', 'Mega_Minion_R_lvl',
    'Dart_Goblin_L_lvl', 'Dart_Goblin_R_lvl',
    'Fireball_L_lvl', 'Fireball_R_lvl',
    'Mini_Pekka_L_lvl', 'Mini_Pekka_R_lvl',
    'Musketeer_L_lvl', 'Musketeer_R_lvl',
    'Hog_Rider_L_lvl', 'Hog_Rider_R_lvl',
    'Valkyrie_L_lvl', 'Valkyrie_R_lvl',
    'Battle_Ram_L_lvl', 'Battle_Ram_R_lvl',
    'Furnace_L_lvl', 'Furnace_R_lvl',
    'Flying_Machine_L_lvl', 'Flying_Machine_R_lvl',
    'Bomb_Tower_L_lvl', 'Bomb_Tower_R_lvl',
    'Giant_L_lvl', 'Giant_R_lvl',
    'Goblin_Hut_L_lvl', 'Goblin_Hut_R_lvl',
    'Inferno_Tower_L_lvl', 'Inferno_Tower_R_lvl',
    'Wizard_L_lvl', 'Wizard_R_lvl',
    'Rocket_L_lvl', 'Rocket_R_lvl',
    'Elixir_Collector_L_lvl', 'Elixir_Collector_R_lvl',
    'Barbarian_Hut_L_lvl', 'Barbarian_Hut_R_lvl',
    'Three_Musketeers_L_lvl', 'Three_Musketeers_R_lvl',
    'Mirror_L_lvl', 'Mirror_R_lvl',
    'Rage_L_lvl', 'Rage_R_lvl',
    'Skeleton_Army_L_lvl', 'Skeleton_Army_R_lvl',
    'Goblin_Barrel_L_lvl', 'Goblin_Barrel_R_lvl',
    'Tornado_L_lvl', 'Tornado_R_lvl',
    'Guards_L_lvl', 'Guards_R_lvl',
    'Clone_L_lvl', 'Clone_R_lvl',
    'Baby_Dragon_L_lvl', 'Baby_Dragon_R_lvl',
    'Hunter_L_lvl', 'Hunter_R_lvl',
    'Poison_L_lvl', 'Poison_R_lvl',
    'Dark_Prince_L_lvl', 'Dark_Prince_R_lvl',
    'Freeze_L_lvl', 'Freeze_R_lvl',
    'Prince_L_lvl', 'Prince_R_lvl',
    'Witch_L_lvl', 'Witch_R_lvl',
    'Balloon_L_lvl', 'Balloon_R_lvl',
    'Bowler_L_lvl', 'Bowler_R_lvl',
    'Executioner_L_lvl', 'Executioner_R_lvl',
    'Giant_Skeleton_L_lvl', 'Giant_Skeleton_R_lvl',
    'Lightning_L_lvl', 'Lightning_R_lvl',
    'X_Bow_L_lvl', 'X_Bow_R_lvl',
    'PEKKA_L_lvl', 'PEKKA_R_lvl',
    'Golem_L_lvl', 'Golem_R_lvl',
    'The_Log_L_lvl', 'The_Log_R_lvl',
    'Miner_L_lvl', 'Miner_R_lvl',
    'Princess_L_lvl', 'Princess_R_lvl',
    'Ice_Wizard_L_lvl', 'Ice_Wizard_R_lvl',
    'Bandit_L_lvl', 'Bandit_R_lvl',
    'Night_Witch_L_lvl', 'Night_Witch_R_lvl',
    'Inferno_Dragon_L_lvl', 'Inferno_Dragon_R_lvl',
    'Lumberjack_L_lvl', 'Lumberjack_R_lvl',
    'Electro_Wizard_L_lvl', 'Electro_Wizard_R_lvl',
    'Graveyard_L_lvl', 'Graveyard_R_lvl',
    'Sparky_L_lvl', 'Sparky_R_lvl',
    'Lava_Hound_L_lvl', 'Lava_Hound_R_lvl'
]
cols_features_card_stats = [
    'avg_lvl_L', 'avg_lvl_R', 'level_discrepancy',
    'left_elixir_cost', 'right_elixir_cost'
]



### METHODS

# Time elapsed
def clock():
    return timedelta(seconds=(time.time() - start))


# Data set loader
def load_dataframe(PATH):
    df = pd.read_csv(PATH)

    # Fill missing data (card levels)
    df.fillna(-1.0, inplace=True)

    print("Loaded dataframe  ({}) \n{} \n{} examples \n".format(clock(), PATH.name, len(df.index)))
    return df


# Feature and target constructor
def get_dataset(df, cols_features):
    # Grab features
    X = df[cols_features].to_numpy()

    # Map target values
    # 'left': 0
    # 'right': 1
    y = np.ravel(np.where( df[cols_labels] == 'left', -1.0, 1.0 ))

    print("Built dataset  ({}) \n{} features \n".format(clock(), len(cols_features)))
    return X, y


# Training
def train(X, y):
    model = MLPClassifier(
        hidden_layer_sizes = (512, 64),

        activation = 'relu',
        solver = 'adam',
        alpha = 0.0001,
        batch_size = 256,
        learning_rate = 'constant',
        learning_rate_init = 0.001,

        random_state = SEED,
        max_iter = 1000,
        verbose = 1
    ).fit(X, y)
    print("Fit model  ({}) \n".format(clock()))
    return model


def test(model, X_test, y_test):
    score = model.score(X_test, y_test)
    print("Test score  ({}) \n{}\n".format(clock(), score))
    return score


### RUNS
# with different features
runs = [
    # ('All features', cols_features_trophies + cols_features_cards + cols_features_card_lvls, False),
    # ('No card lvls', cols_features_trophies + cols_features_cards, False),
    # ('No trophies', cols_features_cards + cols_features_card_lvls, False),
    # # ('Only trophies', cols_features_trophies, False),
    # ('Only cards', cols_features_cards, False),
    # ('Only card lvls', cols_features_card_lvls, False),
    # ('Only trophy discrepancy', ['trophy.discrepancy'], True),  # BEST
    # ('Cards, card lvls, card stats', cols_features_cards + cols_features_card_lvls + cols_features_card_stats, False)
    ('Cards, card lvls, card stats', cols_features_cards + cols_features_card_lvls + cols_features_card_stats, True)
]




### SCRIPT

print("Ready  ({})\n".format(clock()))

df_train = load_dataframe(DATADIR/FILENAME_TRAIN_DATA)
df_test = load_dataframe(DATADIR/FILENAME_TEST_DATA)

for i, (title, cols_features, save) in enumerate(runs):
    print("### RUN No. {} ###\n{}\n".format(i+1, title))

    X, y = get_dataset(df_train, cols_features)
    X_test, y_test = get_dataset(df_test, cols_features)

    model = train(X, y)
    score = test(model, X_test, y_test)

    if save:
        joblib.dump(model,
            MODELDIR/SAVENAME,
            compress = 9  # Compression level: 0 (None) to 9 (highest)
        )
        print("Saved trained model  ({}) \n{} \n".format(clock(), SAVENAME))

    del X, y, X_test, y_test, model

print("Done  ({})\n".format(clock()))
