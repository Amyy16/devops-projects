#!/bin/bash
#author: Amarachi
#description: This script that analyses basic server performance stats

echo "=============================="
echo "      SERVER STATS REPORT"
echo "=============================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"

#--------------------CPU USAGE--------------------
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo "CPU Usage: $CPU_USAGE%"

#--------------------MEMORY USAGE--------------------
MEMORY_USAGE=$(free -m | awk '/Mem:/ {printf "Used: %s MB | Free: %s MB | Usage: %.2f%%\n", $3, $4, $3/$2*100}'
)
echo "Memory Usage: $MEMORY_USAGE"

#--------------------DISK USAGE--------------------
DISK_USAGE=$(df -h / | awk 'NR==2 {printf "Used: %s | Free: %s | Usage: %s\n", $3, $4, $5}')
echo "Disk Usage: $DISK_USAGE"

#--------------------TOP PROCESSES BY CPU USAGE-------------------
echo "---------------Top 5 Processes by CPU Usage----------------"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

#--------------------TOP PROCESSES BY MEMORY USAGE-------------------
echo "---------------Top 5 Processes by Memory Usage----------------"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

#---------------------OS VERSION----------------------
OS_VERSION=$(cat /etc/os-release | grep "PRETTY_NAME")
echo "$OS_VERSION"

#---------------------UPTIME--------------------------
echo "Uptime: $(uptime -p)"

#---------------------LOAD AVERAGE----------------------
echo "Load Average: $(uptime | awk -F 'load average:' '{print $2}')"

#-------------LOGGED IN USERS----------------------
echo "Logged in Users: $(who | wc -l)"

#---------------------FAILED LOGIN ATTEMPTS----------------------   


echo
echo "=============================="
echo "        END OF REPORT"
echo "=============================="
