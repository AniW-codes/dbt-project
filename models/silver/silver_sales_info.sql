wITH sales AS
(
    Select 
        sales_id,
        product_sk,
        customer_sk,  
        discount_amount,
        net_amount,
        payment_method,
        {{ multiply ('unit_price','quantity')}} as calculated_gross_amount
    From
    {{ ref('bronze_sales') }}
),
products AS
(
    Select
        product_sk,
        category
    From
    {{ ref('bronze_product') }}
),
customers AS
(
    Select
        customer_sk,
        gender,
        loyalty_tier
    From
    {{ ref('bronze_customer') }}
),

joined_query AS
(
Select 
    sales_id,
    calculated_gross_amount,
    discount_amount,
    net_amount,
    gender,
    loyalty_tier,
    payment_method,
    category
    From
    sales
Join
    products
    On sales.product_sk = products.product_sk
Join
    customers
    On sales.customer_sk = customers.customer_sk
)

Select
    category,
    gender,
    SUM(net_amount) AS total_net_amount
From
    joined_query
Group By
    category,
    gender
Order By
    total_net_amount DESC