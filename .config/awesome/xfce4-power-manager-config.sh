#!/bin/bash

# for some reason this doesn't seem to persist, so set it every time awesome starts
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/logind-handle-lid-switch -s false
