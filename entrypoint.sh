#!/bin/bash

function help(){
	cat << EOF

docker run -it --rm 
	-e API=<your API key>
        -e MONITORS=124345453,133223
        -e ACTION=up
	pknw1/uptime-robot-update 

EOF
}

if [[ -z $API ]]; then echo "API not set"; help; exit 99; fi
if [[ -z $STATUS ]]; then echo "ACTION not set"; help; exit 99; fi
if [[ -z $MONITORS ]]; then echo "no MONITORS set"; help; exit 99; fi

	for ITEM in ${MONITORS//,/ }
	do
	echo $ITEM
	curl -X POST -H "Cache-Control: no-cache" -H "Content-Type: application/x-www-form-urlencoded" -d "api_key=${API}&format=json&id=${ITEM}&status=${STATUS}" "https://api.uptimerobot.com/v2/editMonitor" && sleep 5
	done
