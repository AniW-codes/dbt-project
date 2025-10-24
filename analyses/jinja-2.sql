{% set incremental_load = 1 %}
{% set last_load = 3%}      --last load has date key 3


{% set col_list = ["sales_id","date_sk","gross_amount","quantity"]%}

Select
    
    {% for i in col_list %}
        {{ i }}{% if not loop.last %}, {% else %}  {% endif %}
    {% endfor %}

From
    {{ ref('bronze_sales') }}

{% if incremental_load == 1 %}  --if incremental load is 0, load all data (full load)
                        
   where date_sk > {{ last_load }} 

{% endif %}