{%- set var_name = "SET" -%}

{{ var_name }}

{% set StoneGate = ["Tank and Paddle", "Marshmallow Roast", "Campfire Stories", "WhiteCross Tap", "Abbey Tap"] %}

{% for i in StoneGate %}
    {% if i != "Marshmallow Roast" %}
        - {{ i }}
    
    {% else %}
        - (I dont like {{  i }})
    
    {% endif %}

{% endfor %}