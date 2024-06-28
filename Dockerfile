version: '3.8'  # version of Docker Compose syntax

services:
  sqlserver:
    build:
      context: .
      dockerfile: Dockerfile  # Path to the Dockerfile
    environment:
      ACCEPT_EULA: Y
      SA_PASSWORD: "Sairam123" 
      RUN_UNIT_TESTS: "true"
      RUN_INTEGRATION_TESTS: "true"
    ports:
      - "1433:1433"  # Expose SQL Server port
    volumes:
      - ./db-create_database:/scripts/db-create_database
      - ./db-deployment:/scripts/db-deployment
      - ./test-data:/scripts/test-data
      - ./unit-tests:/scripts/unit-tests
      - ./integration-tests:/scripts/integration-tests
    user: mssql
