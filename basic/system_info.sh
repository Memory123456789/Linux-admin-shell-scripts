#!/bin/bash
# ============================================
# Script Name : system_info.sh
# Description : Display system and network information
# Author      : Leelakrishna
# ============================================

# Hostname and OS
echo "🔹 Hostname       : `hostname`"
echo "🔹 OS Version     : $NAME $VERSION "
echo "🔹 Kernel Version : $(uname -r)"
echo "🔹 Uptime         : $(uptime -p)"

# Users
echo "👤 Logged-in Users: $(who | wc -l)"
who

# IP and Network Info
echo "Private IP Address : `hostname -I`
      Public IP Address  :  `curl -s ifconfig.me`
      Default Gateway    :  `ip route | grep default` 
      DNS Servers        :  `cat /etc/resoln.conf | grep nameserver`"

# System Load
echo "⚙️  CPU Load      : $(uptime)"

# Disk Usage
echo "💾 Disk Usage  : `df -h --total | grep total`"
