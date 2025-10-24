--Block level config

{{
  config(
    materialized = 'view',
    )
}}
Select
    *
From
    {{ source('source', 'fact_sales') }}