#!/bin/sh

if [ "x$1" != "x--" ]; then
$0 -- &> /dev/null &
exit 0
fi

echo $$ > /var/run/oosplashkillerd.pid

for (( ; ; ))
do
for i in $(pidof oosplash.bin)
do
kill $i
done
sleep 300
done

