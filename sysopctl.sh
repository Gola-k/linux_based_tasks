#!/bin/bash

# sysopctl v0.1.0

# Display help menu
show_help() {
    echo "sysopctl - A custom command for managing system resources."
    echo "Usage: sysopctl [OPTIONS] COMMAND"
    echo "Commands:"
    echo "  service list    List all active services"
    echo "  system load     View current system load averages"
    echo "Options:"
    echo "  --help          Display this help message"
    echo "  --version       Display version information"
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
    *)
        echo "Unknown command. Use sysopctl --help for usage information."
        ;;
esac
