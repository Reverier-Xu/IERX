#!/bin/env python3

import os

folder = 'assets/'

for file in os.listdir(folder):
    new_file = file.replace('ic_fluent_', '').replace('_16_regular', '').replace('_', '-')
    os.rename(f'{folder}/{file}', f'{folder}/{new_file}')
