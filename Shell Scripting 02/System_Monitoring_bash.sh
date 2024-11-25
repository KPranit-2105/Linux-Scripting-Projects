#!/bin/bash

# Function to display CPU Usage
function cpu_usage {
    echo "CPU Usage:"
    mpstat 1 1 | awk '/Average/ {print $3 "%"}'
    echo ""
}

# Function to display Memory Usage
function memory_usage {
    echo "Memory Usage:"
    free -h | awk 'NR==2{print "Used: " $3 " / Total: " $2 " - Swap Used: " $3 " / Total: " $2 }'
    echo ""
}

# Function to display Disk Space Usage
function disk_space {
    echo "Disk Space Usage:"
    df -h | grep -v tmpfs
    echo ""
}

# Function to display Network Activity
function network_activity {
    echo "Network Activity:"
    netstat -tuln
    echo ""
}

# Function to display Top 5 CPU Consuming Processes
function top_processes {
    echo "Top 5 CPU Consuming Processes:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo ""
}

# Function to display System Uptime
function system_uptime {
    echo "System Uptime:"
    uptime -p
    echo ""
}

# Main function that calls all the above functions
function main {
    cpu_usage
    memory_usage
    disk_space
    network_activity
    top_processes
    system_uptime
}

# Run the main function
main

