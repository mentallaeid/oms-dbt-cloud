{{ 'Hello world' -}}

{# comment -#}

{#
multi
line
comment
-#}

{%- set var1 = 'Hello world' %}
{{ var1 }}

{%- set var2 -%}
    Hello world 2
{% endset %}
{{ var2 }}

{#- lists #}
{%- set var3 = ['Hello world', 'Hello world, again!'] %}
{{ var3[1] }}

{#- if conditions #}
{% set temprature = -3 -%}
{%- if temprature > 20 -%}
{{- 'It is hot' -}}
{%- elif temprature < 0 -%}
{{- 'It is freezing' -}}
{%- else -%}
{{- 'It is not hot' -}}
{%- endif -%}

{#- for loops #}
{% set names = ['id', 'quantity', 'unit_price'] -%}
SELECT
{% for name in names -%}
    {{ name -}}
    {%- if not loop.last -%}
    ,
    {%- endif %}
{% endfor -%}
FROM table

{# functions -#}
{{ ref("bronze_orders") }}

{% set now = modules.datetime.datetime.now() %}
{{ now }}

{% set date_today = modules.datetime.date.today() %}
{{ date_today }}

{% set columns = adapter. get_columns_in_relation(ref("bronze_orders")) %}
{% for col in columns %}
{{ col }}
{{ col.name }}
{% endfor %}
