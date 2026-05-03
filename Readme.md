# Instacart Batch Data Pipeline

## Overview

This project is a batch data pipeline built on the Instacart Online Grocery Basket Analysis dataset from Kaggle.

The pipeline loads raw CSV files into PostgreSQL, organizes data into staging, core, and mart layers, and prepares analytical data marts for product, department, aisle, and order behavior analysis.

## Dataset

The project uses the Instacart Online Grocery Basket Analysis dataset from Kaggle.

Raw source files:
- `aisles.csv`
- `departments.csv`
- `products.csv`
- `orders.csv`
- `order_products__prior.csv`
- `order_products__train.csv`

## Tech Stack

- Python
- PostgreSQL
- Docker Compose
- pandas
- SQLAlchemy
- psycopg2-binary
- SQL

## Architecture

The pipeline is organized into four layers:

- **Raw** — source CSV files from Kaggle
- **Staging** — raw data loaded into PostgreSQL with minimal transformation
- **Core** — structured business model with dimensions and facts
- **Mart** — aggregated analytical tables for reporting and analysis

Pipeline flow:

`raw -> staging -> core -> mart`

## Data Model

### Core layer

**Dimensions**
- `dim_aisles`
- `dim_departments`
- `dim_products`

**Facts**
- `fct_orders`
- `fct_order_items`

### Core table descriptions

- `dim_aisles` — aisle reference data
- `dim_departments` — department reference data
- `dim_products` — product reference data enriched with aisle and department
- `fct_orders` — order-level data
- `fct_order_items` — order item rows combined from prior and train datasets

## Data Marts

The following marts were created:

- `mart_top_products` — top products by reorder volume
- `mart_orders_by_time_of_day` — order distribution by time of day
- `mart_department_reorders` — reorder metrics by department
- `mart_aisle_reorders` — reorder metrics by aisle
- `mart_avg_cart_size` — average number of items per order

## How to Run

1. Start PostgreSQL with Docker Compose
2. Download the Instacart dataset from Kaggle
3. Place raw CSV files into `data/raw/`
4. Run the Python loader to populate staging tables
5. Execute SQL scripts to build core and mart layers

## Project Status

Current version includes:
- staging layer
- core layer
- mart layer

## Repository Structure

- `data/raw/` — source CSV files
- `scripts/` — Python loader
- `sql/staging/` — staging SQL scripts
- `sql/core/` — core layer SQL scripts
- `sql/mart/` — mart layer SQL scripts
- `docker-compose.yml` — PostgreSQL setup