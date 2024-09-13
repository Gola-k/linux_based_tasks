Explanation of Features:
Level 1 (Easy):
List Running Services:
Command: sysopctl service list
Uses systemctl list-units --type=service to display all active services.
View System Load:
Command: sysopctl system load
Displays system load averages using the uptime command.
Level 2 (Intermediate):
Start a Service:
Command: sysopctl service start <service-name>
Uses systemctl start <service-name> to start a specified service.
Stop a Service:
Command: sysopctl service stop <service-name>
Uses systemctl stop <service-name> to stop a specified service.
Check Disk Usage:
Command: sysopctl disk usage
Displays disk usage statistics using the df -h command.
How to use:
Create the script:

Save the script as sysopctl.sh.
Make it executable: chmod +x sysopctl.sh.
Running the commands:

To list running services: ./sysopctl.sh service list.
To start a service: ./sysopctl.sh service start <service-name>.
To stop a service: ./sysopctl.sh service stop <service-name>.
To view system load: ./sysopctl.sh system load.
To check disk usage: ./sysopctl.sh disk usage.
