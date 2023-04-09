#!/bin/bash

if [[ $# != 3 ]]; then
	# echo -e "Usage: nm-eduroam.sh <username> <password> <cert>\n\nUse the Eduroam CAT tool to generate the certificate."
	echo "Usage: nm-eduroam.sh <username> <password> <cert>

Use the Eduroam CAT tool to generate the certificate."
	exit 1
fi

username=$1
password=$2
cert=$3

echo 'Adding new connection "eduroam"...'

nmcli con add \
	type wifi \
	con-name "eduroam" \
	ifname "wlp1s0" \
	ssid "eduroam" \
	wifi-sec.key-mgmt "wpa-eap" \
	wifi-sec.pairwise "ccmp" \
	wifi-sec.group "ccmp,tkip" \
	802-1x.eap "peap" \
	802-1x.ca-cert "$cert" \
	802-1x.identity "$username" \
	802-1x.password "$password" \
	802-1x.altsubject-matches "DNS:token.wireless.cam.ac.uk" \
	802-1x.phase2-auth "mschapv2" \
	802-1x.anonymous-identity "_token@cam.ac.uk"

echo 'Connection added.'
echo 'Activating connection "eduroam"...'

nmcli connection up eduroam

echo 'Connection activated.'
