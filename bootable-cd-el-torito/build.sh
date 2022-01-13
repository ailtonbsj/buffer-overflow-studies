#!/bin/bash

python3 sectors.py > sectors.img
nasm tron.asm -o tron.img
cat sectors.img tron.img > game.iso