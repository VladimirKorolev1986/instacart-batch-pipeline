# Instacart Batch Data Pipeline

Batch data pipeline project based on the Instacart dataset.

## Stack
- Python
- PostgreSQL
- Docker
- pandas
- SQLAlchemy

## Current stage
- PostgreSQL started in Docker
- staging schema created
- CSV files loaded into staging tables

## Dataset
Instacart Online Grocery Basket Analysis Dataset from Kaggle.

## How to run
1. Start PostgreSQL with Docker Compose
2. Download dataset from Kaggle
3. Put CSV files into `data/raw/`
4. Run `python scripts/load_staging.py`