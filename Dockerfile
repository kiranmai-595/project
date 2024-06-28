FROM mcr.microsoft.com/mssql/server:2022-latest as base

# Environment variables 
ENV RUN_UNIT_TESTS=true
ENV RUN_INTEGRATION_TESTS=true
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Sairam123
USER root
# Create directories for artifacts
RUN mkdir -p /scripts/db-deployment /scripts/test-data /scripts/unit-tests /scripts/integration-tests

# Copy artifacts into the image
COPY ./db-create_database/* /scripts/db-create_database/
COPY ./db-deployment/* /scripts/db-deployment/
COPY ./test-data/* /scripts/test-data/
COPY ./unit-tests/* /scripts/unit-tests/
COPY ./integration-tests/* /scripts/integration-tests/

# Copy entrypoint script
COPY entrypoint.sh /scripts/entrypoint.sh

# Grant permissions for the entrypoint script to be executable
RUN chmod +x /scripts/entrypoint.sh
USER mssql
# Set the working directory
WORKDIR /scripts

# Expose SQL Server default port
EXPOSE 1433

# Start SQL Server and run the entrypoint script
CMD ["/bin/bash", "/scripts/entrypoint.sh"]

