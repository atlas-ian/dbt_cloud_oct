{% macro modtab(ts_col='updated_at', refresh_hours=12) %}
    {% if is_incremental() %}
        {% if modtab(ts_col, refresh_hours) %}
            -- full load
        {% else %}
            where {{ ts_col }} > (select max({{ ts_col }}) from {{ this }})
        {% endif %}
    {% endif %}
{% endmacro %}
