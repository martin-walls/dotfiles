#!/bin/bash

# Note: workspaces must be added to the following lists in
# ascending number order, cos the script assumes sorted order
# for efficiency. All workspaces should be specified.
#
# workspace names to use as general-purpose workspaces
wksps_use=(
  '1'
  '2'
  '3'
  '4'
  '5'
  '6'
  '7'
  '8'
  '9'
  '10'
  '13'
  '14'
  '15'
  '16'
  '17'
  '18'
  '19'
  '20'
  '21'
  '22'
)
# workspace names to never use as new workspace, even if
# they're empty
wksps_ignore=(
  '11:阮'
  '12:K'
)

i=0
j=0

# skip workspaces currently in use
for w in $(swaymsg -t get_workspaces | jq -r 'sort_by(.name[0:2]|tonumber)|.[].name'); do
  if [[ ${wksps_ignore[j]} == $w ]]; then
    j=$(($j+1))
    continue
  fi
  # return the first workspace not in use
  if [[ "${wksps_use[i]}" != $w ]]; then
    break
  fi
  i=$(($i+1))
done

echo "${wksps_use[i]}"
