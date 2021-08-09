#!/bin/sh

echo "> Starting docker-speedtest..."
echo -e "$SPEEDTEST_CRON\n" > /etc/crontabs/root
crond -f  -l2
