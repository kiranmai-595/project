#!/bin/bash

# Start SQL Server
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to start
sleep 30s

# Function to execute SQL scripts
execute_sql_scripts() {
    local scripts_dir="$1"
    echo "Executing SQL scripts in $scripts_dir"
    for script in $(ls -v $scripts_dir/*.sql); do
        /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d master -i $script
        echo "Executed $script"
    done
}

execute_sql_scripts "/scripts/db-create_database"

# Deploy database schema and objects
execute_sql_scripts "/scripts/db-deployment"

# Enter Test Data 
execute_sql_scripts "/scripts/test-data"

# Optionally, execute unit tests
if [[ $RUN_UNIT_TESTS == "true" ]]; then
    execute_sql_scripts "/scripts/unit-tests"
fi

# Optionally, execute integration tests
if [[ $RUN_INTEGRATION_TESTS == "true" ]]; then
    execute_sql_scripts "/scripts/integration-tests"
fi

# Keep the container running
tail -f /dev/null
