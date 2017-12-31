#/bin/sh

AIRPORT="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

RSSI="`$AIRPORT -I | grep 'agrCtlRSSI' | awk '{ print $2 }'`"
SSID="`$AIRPORT -I | grep -v 'BSSID' | grep 'SSID' | awk '{ print $2 }'`"

if [ -z "$RSSI" -a -z "$SSID" ]; then
	echo "No Wi-Fi"
	exit 1
fi

if [ "$RSSI" -eq 0 ]; then
	echo "Searching..."
	exit 1
fi

SIGNAL_COLOR="#[fg=green]"
SSID_COLOR="#[fg=white]"

if [ -70 -lt "$RSSI" ]; then
	SIGNAL_COLOR="#[fg=green]"
	if [ -60 -lt "$RSSI" ]; then
		SIGNAL="▁ ▃ ▅ ▇ "
	else
		SIGNAL="▁ ▃ ▅　 "
	fi
elif [ -80 -lt "$RSSI" ]; then
	SIGNAL_COLOR="#[fg=colour209]"
	SIGNAL="▁ ▃　　 "
elif [ -90 -lt "$RSSI" ]; then
	SIGNAL_COLOR="#[fg=red]"
	SIGNAL="▁　　　 "
else
	SIGNAL="　　　　"
fi

echo "${SSID_COLOR}${SSID} ${SIGNAL_COLOR}${SIGNAL}#[default]"
