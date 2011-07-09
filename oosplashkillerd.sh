#!/bin/sh

if [ "x$1" != "x--" ]; then
$0 -- &> /dev/null &
exit 0
fi

echo $$ > /var/run/oosplashkillerd.pid

for (( ; ; ))
do
getps=$(ps -C oosplash.bin --format pid --no-heading)
for i in $getps
do
kill $i
done
sleep 300
done

