#!/bin/bash
# sysinfo.sh - Display basic system information

echo "=============================="
echo "      SYSTEM INFORMATION"
echo "=============================="
echo "Hostname   : $(hostname)"
echo "User       : $(whoami)"
echo "Date/Time  : $(date '+%Y-%m-%d %H:%M:%S')"
echo "OS         : $(grep PRETTY_NAME /etc/os-release 2>/dev/null | cut -d= -f2 | tr -d '\"')"
echo "Kernel     : $(uname -r)"
echo "Uptime     : $(uptime -p)"
echo "IP Address : $(hostname -I 2>/dev/null | awk '{print $1}')"
echo "------------------------------"
echo "CPU Cores  : $(nproc)"
echo "Memory     : $(free -h | awk '/Mem:/ {print $3 " used / " $2 " total"}')"
echo "Disk (/)   : $(df -h / | awk 'NR==2 {print $3 " used / " $2 " total (" $5 ")"}')"
echo "=============================="