#!/bin/bash

# Function to get the environment based on the server's hostname
get_environment() {
    local hostname="$(hostname)"
    
    if [[ "$hostname" == *"dev"* ]]; then
        echo "dev"
    elif [[ "$hostname" == *"sai"* ]]; then
        echo "QA"
    else
        echo "prod"
    fi
}

# Function to check the table count in Vertica and Hive based on the environment
check_table_count() {
    local environment="$1"
    local table_name="$2"

    case "$environment" in
        "dev")
            # Run your logic to get the count from dev Vertica and Hive
            ;;
        "QA")
            # Run your logic to get the count from QA Vertica and Hive
            ;;
        "prod")
            # Run your logic to get the count from prod Vertica and Hive
            ;;
        *)
            echo "Invalid environment: $environment"
            exit 1
            ;;
    esac
}

# Get the environment automatically based on the server's hostname
current_environment=$(get_environment)

# Call the function with the detected environment and the table name
check_table_count "$current_environment" "your_table_name"
