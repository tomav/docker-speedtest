#!/bin/sh

echo "---------------------------"
echo ""
echo "Starting docker-speedtest"
echo ""
echo "---------------------------"

# printenv | grep 'SPEEDTEST' > /etc/environment
crond -f -l 2
