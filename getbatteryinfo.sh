#/bin/sh

COMMAND="pmset -g ps"
BATTERY="`$COMMAND | awk '{ for (i = 1; i <= NF; i++) { print $i } }' | grep "%" | sed -e 's/%;//g'`"
CHARGE="`$COMMAND | awk '{ for (i = 1; i <= NF; i++) { print $i } }' | grep "discharging" | sed -e 's/;//g'`"

if [ -z "$CHARGE" ]; then
	COLOR="#[fg=green]"
else
	if [ 20 -lt "$BATTERY" ]; then
		COLOR="${COLOR}#[fg=colour27]"
	else
		COLOR="${COLOR}#[fg=red]"
	fi
fi

echo "${COLOR}${BATTERY}%#[default]"
