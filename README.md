# uptimerobot-api-status-switcher

```
#!/bin/bash

MONITORS=790103604,790103605,790103604,790103592,790103592

ACTION=$(echo ${1} | tr [:upper:] [:lower:])

case $ACTION in
	up) STATUS=1;;
	down) STATUS=0;;
	*)_ STATUS=1;;
esac
echo $STATUS; exit

docker run -e API=${UPTIMEROBOT_API} -e MONITORS=${MONITORS}  -e STATUS=${1} -it test
```
