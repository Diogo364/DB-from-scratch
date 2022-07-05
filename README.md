# Data Base from Scratch

- [Data Base from Scratch](#data-base-from-scratch)
  - [About](#about)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
  - [split_data.sh](#split_datash)
  - [setup.sql](#setupsql)


## About
It creates a Relational Data Base to store [Historical Series of fuel prices by resale](https://www.kaggle.com/upadorprofzs/historical-series-of-fuel-prices-by-resale) data. It uses PostgreSQL Relational Data Base, Docker, Shellscript and a CSV file.

## Requirements
- Docker
- Docker-compose
- Download the CSV file from [this link](https://www.kaggle.com/upadorprofzs/historical-series-of-fuel-prices-by-resale)

## Quickstart
These are the steps to run the application:
1. Download the CSV data file;
2. Update the Environment Variables within the `.env` file with:
   - DB deployment port;
   - Name of the csv data file;
   - DB password;
3. Build the Docker image:
   ```
   docker-compose build
   ```
4. Start the container in detached mode:
    ```
    docker-compose up -d
    ```
5. Connect to the `AA Database` using [Postgresql](https://www.postgresql.org/download/), [Sqlectron](https://sqlectron.github.io/) or similar and enjoy!

## split_data.sh
This Shellscript was prepared to split the `Historical Series of fuel prices by resale` structured data into two smaller entities tables: `revenda.csv` and `produtos.csv`. It also removes the duplicated `CNPJ` from `revenda.csv`, since it is considered Primary Key.

## setup.sql
It creates both DB Schemas, Revenda and Produtos, and copies the data within the splitted tables into the DB.
