{% test generic_non_negative(model,column_name) %}   --Is a macro jinja function

Select
*
from 
    {{ model }}
where 
    {{ column_name }} < 0
{% endtest %}