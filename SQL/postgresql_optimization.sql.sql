CREATE INDEX idx_customer_id
ON warehouse.fact_sales("Customer ID");

CREATE INDEX idx_product_id
ON warehouse.fact_sales("Product ID");

CREATE INDEX idx_order_date
ON warehouse.fact_sales("Order Date");

CREATE MATERIALIZED VIEW warehouse.mv_sales_summary AS

SELECT
    "Order Date",
    SUM("Sales") AS total_sales,
    SUM("Profit") AS total_profit,
    SUM("Quantity") AS total_quantity

FROM warehouse.fact_sales

GROUP BY "Order Date";

SELECT *
FROM warehouse.mv_sales_summary
LIMIT 5;

CREATE EXTENSION IF NOT EXISTS pg_trgm;

EXPLAIN ANALYZE

SELECT *
FROM warehouse.fact_sales
WHERE "Customer ID" = 'RH-19495';

EXPLAIN ANALYZE

SELECT *
FROM warehouse.mv_sales_summary;

-- Sales Per Year
SELECT
    EXTRACT(YEAR FROM "Order Date"::DATE) AS year,
    SUM("Sales") AS total_sales

FROM warehouse.fact_sales

GROUP BY year

ORDER BY year;

-- Profit Per Category
SELECT
    dp."Category",
    SUM(fs."Profit") AS total_profit

FROM warehouse.fact_sales fs

JOIN warehouse.dim_product dp
ON fs."Product ID" = dp."Product ID"

GROUP BY dp."Category"

ORDER BY total_profit DESC;

-- Top Customer
SELECT
    dc."Customer Name",
    SUM(fs."Sales") AS total_sales

FROM warehouse.fact_sales fs

JOIN warehouse.dim_customer dc
ON fs."Customer ID" = dc."Customer ID"

GROUP BY dc."Customer Name"

ORDER BY total_sales DESC

LIMIT 10;