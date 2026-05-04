from pathlib import Path

import pandas as pd
from sqlalchemy import create_engine, text
from sqlalchemy.engine import Engine

DB_URL = "postgresql+psycopg2://postgres:postgres@127.0.0.1:5433/instacart_de"
DATA_DIR = Path("data/raw")

FILES_TO_TABLES = {
    "aisles.csv": "stg_aisles",
    "departments.csv": "stg_departments",
    "products.csv": "stg_products",
    "orders.csv": "stg_orders",
    "order_products__prior.csv": "stg_order_products_prior",
    "order_products__train.csv": "stg_order_products_train",
}

STAGING_TABLES = list(FILES_TO_TABLES.values())


def truncate_staging_tables(engine: Engine) -> None:
    tables_sql = ", ".join(f"staging.{table_name}" for table_name in STAGING_TABLES)

    with engine.begin() as connection:
        connection.execute(text(f"TRUNCATE TABLE {tables_sql};"))

    print("Staging tables successfully truncated.")



def load_csv_to_postgres() -> None:
    engine = create_engine(DB_URL)

    truncate_staging_tables(engine)

    for filename, table_name in FILES_TO_TABLES.items():
        file_path = DATA_DIR / filename
        print(f"Loading {file_path} -> staging.{table_name}")

        df = pd.read_csv(file_path)
        df.to_sql(
            name=table_name,
            con=engine,
            schema="staging",
            if_exists="append",
            index=False,
        )

        print(f"Loaded {len(df)} rows into staging.{table_name}")


if __name__ == "__main__":
    load_csv_to_postgres()