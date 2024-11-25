


# Linux System Monitoring Script In Bash

## Description
This project is a simple **Linux System Monitoring Tool** implemented in **Bash** scripting. The script provides a real-time overview of various system resources, including:
- CPU Usage
- Memory Usage
- Disk Space Usage
- Network Activity
- Running Processes
- System Uptime

The monitoring information is gathered using standard Linux commands and displayed in a readable format.

## Features
- **CPU Usage**: Monitors and displays the CPU usage percentage.
- **Memory Usage**: Displays the usage of RAM and swap memory.
- **Disk Space Usage**: Provides information about disk space availability.
- **Network Activity**: Displays the network connections and listening ports.
- **Top Processes**: Shows the top 5 CPU-consuming processes.
- **System Uptime**: Displays the system's uptime since the last boot.

## Requirements
To run this script, you need:
- A **Linux-based OS** (e.g., Ubuntu, CentOS, Debian)
- The following command-line utilities should be available (they are typically pre-installed):
  - `mpstat` (for CPU stats)
  - `free` (for memory stats)
  - `df` (for disk space usage)
  - `netstat` or `ss` (for network stats)
  - `ps` (for processes)
  - `uptime` (for system uptime)

To ensure all necessary tools are installed, you can install them using:
```bash
sudo apt-get install sysstat net-tools


## Installation

1. **Clone the repository** or **download the script**:
   - If you are using Git, clone the repository:
     ```bash
     git clone https://github.com/KPranit-2105/system-monitoring.git
     cd system-monitoring
     ```

2. **Make the script executable**:
   Navigate to the directory where you downloaded the script and run:
   ```bash
   chmod +x system_monitor.sh
   ```

## Usage

### Running the Script
To run the script, execute the following command:
```bash
./system_monitor.sh
```

This will display system monitoring information such as CPU usage, memory usage, disk space, network activity, running processes, and system uptime.

### Automating the Script with Cron
To run this script automatically at regular intervals (e.g., every 5 minutes), you can use `cron`. Here's how you can set it up:

1. Open the crontab editor:
   ```bash
   crontab -e
   ```

2. Add a new cron job to run the script every 5 minutes:
   ```bash
   */5 * * * * /path/to/system_monitor.sh >> /path/to/logfile.log
   ```

This will run the script every 5 minutes and log the output to `logfile.log`.

## Enhancements

- **Email Alerts**: You can modify the script to send an email alert if certain thresholds are exceeded (e.g., CPU usage > 80%).
- **Slack Integration**: Add functionality to send system status to a Slack channel.
- **Logging**: Add more robust logging, such as writing output to log files with timestamps.
- **User Interface**: Improve the user interface with color-coding or formatted tables for better readability.
- **Extended Monitoring**: Add more advanced metrics like disk I/O statistics or detailed network traffic.

## Troubleshooting

- **Missing commands**: If you encounter errors like "command not found" (e.g., `mpstat`, `netstat`, etc.), ensure the required tools are installed on your system:
  ```bash
  sudo apt-get install sysstat net-tools
  ```
- **Permissions**: If you get permission errors, ensure you have execute permissions on the script:
  ```bash
  chmod +x system_monitor.sh
  ```

## License

This project is open-source and available under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Author

- **Pranit Kolamkar**  
- (https://github.com/KPranit-2105)
```

