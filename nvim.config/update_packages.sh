#!/bin/bash

git submodule foreach 'git pull --recurse-submodules origin `git rev-parse --abbrev-ref HEAD`'
