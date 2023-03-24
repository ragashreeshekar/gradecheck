#!/bin/bash

$count = 0 
$firewall_status = (sudo ufw status | tr -d ' ')
if echo $firewall_status | grep -q "Status:active"; then
  echo "Firewall is active"
  count=$((count+1))
else
  echo "Firewall is inactive"
fi

if echo $firewall_status | grep -q "443ALLOWAnywhere"; then
  echo "Port 443 is allowed"
  count=$((count+1))
else
  echo "Port 443 is not allowed"
fi

if echo $firewall_status | grep -q "3001ALLOWAnywhere"; then
  echo "Port 3001 is allowed"
  count=$((count+1))
else
  echo "Port 3001 is not allowed"
fi

if echo $firewall_status | grep -q "5432ALLOW127.0.0.1"; then
  count=$((count+1))
  echo "Port 5432 is allowed only from localhost"
else
  echo "Port 5432 is allowed from other sources"
fi

if echo $firewall_status | grep -q "5432DENYAnywhere"; then
  count=$((count+1))
  echo "Port 5432 is not allowed from other sources"
else
  echo "Port 5432 is allowed from other sources"
fi

echo "Gradecheck-03: You have configured" $count "out of 5!"
