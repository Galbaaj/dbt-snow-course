markdown
{% docs __overview__ %}

# TPC-H dbt Training Project

This dbt project transforms the Snowflake TPC-H sample dataset into a structured
analytics layer for training purposes.

## Data Source

The raw data is provided through:

`SNOWFLAKE_SAMPLE_DATA.TPCH_SF1`

The source tables include orders, customers, line items, nations, parts, suppliers,
and regions.

## Layer Structure

### Sources

Raw Snowflake tables are declared in `sources.yml` and referenced through
`source()`.

### Staging

Staging models standardize source columns, apply consistent naming conventions,
cast data types, and add lightweight mappings.

Examples:

- `stg_tpch__orders`
- `stg_tpch__customers`
- `stg_tpch__lineitems`

### Intermediate

Intermediate models join and enrich staging models for reuse downstream.

Example:

- `int_orders_enriched`

### Marts

Mart models provide business-facing fact and dimension tables for analytics and
reporting.

Examples:

- `fct_orders`
- `dim_customers`

### Seeds

Small static reference datasets are version-controlled as CSV files and loaded
with `dbt seed`.

Example:

- `nation_codes`

### Snapshots

Snapshots preserve historical versions of mutable customer records using an
SCD Type 2 pattern.

Example:

- `customers_snapshot`

{% enddocs %}


markdown
{% docs order_status %}

Order status code received from the TPC-H ORDERS source table.

| Code | Meaning |
|------|---------|
| `O`  | Open |
| `F`  | Fulfilled |
| `P`  | In Progress |

{% enddocs %}