#!/bin/bash
# ============================================
# Script Name : system_info.sh
# Description : Display system and network information
# Author      : Leelakrishna
# ============================================

echo "============================================"
echo "   📊 System and Network Information"
echo "============================================"

# Hostname and OS
echo "🔹 Hostname       : $(hostname)"
echo "🔹 OS Version     : $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"
echo "🔹 Kernel Version : $(uname -r)"
echo "🔹 Architecture   : $(uname -m)"
echo "🔹 Uptime         : $(uptime -p)"
echo "--------------------------------------------"

# Users
echo "👤 Logged-in Users: $(who | wc -l)"
who
echo "--------------------------------------------"

# IP and Network Info
echo "🌐 IP Addresses   :"
ip -o -4 addr show | awk '{print "  - " $2 ": " $4}'
echo "--------------------------------------------"

echo "🌐 Default Gateway:"
ip route | grep default | awk '{print $1,$2,$3,$9}'
echo "--------------------------------------------"

# DNS
echo "🌐 DNS Servers:"
grep "nameserver" /etc/resolv.conf | awk '{print "  - " $2}'
echo "--------------------------------------------"

# Active Network Interfaces
echo "🌐 Active Interfaces:"
ip link show | grep "state UP" | awk '{print "  - " $2}' | tr -d ':'
echo "--------------------------------------------"

# System Load
echo "⚙️  CPU Load      : $(uptime | awk -F'load average:' '{ print $2 }')"
echo "--------------------------------------------"

# Disk Usage
echo "💾 Disk Usage:"
df -h --total | grep total
echo "============================================"
