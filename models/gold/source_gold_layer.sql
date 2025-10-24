With dedup_query as 
(
Select
*,
Row_Number() Over (Partition By id Order By update_date desc) as dedup
From
    {{ source('source', 'items') }}
)
Select
id,
item_name, 
category,
update_date
From
dedup_query
Where dedup = 1