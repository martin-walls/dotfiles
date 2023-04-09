#!/bin/bash

echo "[Resetting HEAD in case any files are git added]"
git unstage

echo "[Adding dictionary files]"
git add nvim/.config/spell/*

echo "[Committing]"
git commit -m "Update Nvim spelling dictionary"
