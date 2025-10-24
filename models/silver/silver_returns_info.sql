wITH returns AS
(
    Select 
        sales_id,
        store_sk,
        product_sk, 
        return_reason,
        returned_qty,
        refund_amount
    From
    {{ ref('bronze_returns') }}
),
products AS
(
    Select
        product_sk,
        category
    From
    {{ ref('bronze_product') }}
),
stores AS
(
    Select
        store_sk,
        region,
        country,
        store_name
    From
    {{ ref('bronze_store') }}
),

joined_query AS
(
Select 
    sales_id,
    returns.store_sk,
    products.product_sk,
    return_reason,
    refund_amount,
    store_name,
    country
From    returns
Join products
    On returns.product_sk = products.product_sk
Join stores
    On returns.store_sk = stores.store_sk
)

SELECT 
    store_name,
    return_reason,
    SUM(refund_amount) AS total_refund_amount
FROM joined_query
GROUP BY 
    store_name,
    return_reason
Order BY
    total_refund_amount DESC