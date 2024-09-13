#!/bin/bash

# sysopctl v0.1.0

# Display help menu
show_help() {
    echo "sysopctl - A custom command for managing system resources."
    echo "Usage: sysopctl [OPTIONS] COMMAND"
    echo "Commands:"
    echo "  service list               List all active services"
    echo "  service start <name>       Start a specific service"
    echo "  service stop <name>        Stop a specific service"
    echo "  system load                View current system load averages"
    echo "  disk usage                 Show disk usage statistics"
    echo "Options:"
    echo "  --help                     Display this help message"
    echo "  --version                  Display version information"
}

# Display version information
show_version() {
    echo "sysopctl version 0.1.0"
}

# List running services
list_services() {
    echo "Listing active services..."
    systemctl list-units --type=service
}

# View system load
view_system_load() {
    echo "System load averages:"
    uptime
}

# Start a service
start_service() {
    if [ -z "$1" ]; then
        echo "Error: Service name required"
        exit 1
    fi
    echo "Starting service: $1"
    systemctl start "$1"
    if [ $? -eq 0 ]; then
        echo "Service '$1' started successfully."
    else
        echo "Failed to start service '$1'."
    fi
}

# Stop a service
stop_service() {
    if [ -z "$1" ]; then
        echo "Error: Service name required"
        exit 1
    fi
    echo "Stopping service: $1"
    systemctl stop "$1"
    if [ $? -eq 0 ]; then
        echo "Service '$1' stopped successfully."
    else
        echo "Failed to stop service '$1'."
    fi
}

# Check disk usage
check_disk_usage() {
    echo "Disk usage statistics:"
    df -h
}

# Main command handler
case "$1" in
    --help)
        show_help
        ;;
    --version)
        show_version
        ;;
    service)
        case "$2" in
            list)
                list_services
                ;;
            start)
                start_service "$3"
                ;;
            stop)
                stop_service "$3"
                ;;
            *)
                echo "Unknown service command. Use sysopctl --help for usage information."
                ;;
        esac
        ;;
    system)
        case "$2" in
            load)
                view_system_load
                ;;
            *)
                echo "Unknown system command. Use sysopctl --help for usage information."
                ;;
        esac
        ;;
    disk)
        case "$2" in
            usage)
                check_disk_usage
                ;;
            *)
                echo "Unknown disk command. Use sysopctl --help for usage information."
                ;;
        esac
        ;;
    *)
        echo "Unknown command. Use sysopctl --help for usage information."
        ;;
esac
