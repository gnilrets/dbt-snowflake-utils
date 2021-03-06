{% macro drop_schema(schema_name, database=target.database) %}

  {% if schema_name %}

    {{ log("Dropping schema " ~ database ~ "." ~ schema_name ~ "...", info=True) }}

    {% call statement('drop_schema', fetch_result=True, auto_begin=False) -%}
        DROP SCHEMA {{ database }}.{{ schema_name }}
    {%- endcall %}

    {%- set result = load_result('drop_schema') -%}
    {{ log(result['data'][0][0], info=True)}}

  {% else %}
    
    {{ exceptions.raise_compiler_error("Invalid arguments. Missing schema name") }}

  {% endif %}

{% endmacro %}