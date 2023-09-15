{{ dbt_utils.import }}

{% macro pivot_by_indicators(indicators) %}

{# Pivots the data given a list of indicators based on indicator_code.
Output column will include country_code, year, and the indicators chosen.  #}

select
  country_code,
  name as country_name,
  region as country_region,
  year,
  {{ dbt_utils.pivot(
      'indicator_name_cleaned',
      dbt_utils.get_column_values(
        ref("staging_education"),
        'indicator_name_cleaned',
        where = filter_for_indicators(indicators)

      ),
    then_value = 'value'
  ) }}
from {{ ref("staging_education") }}
where {{ filter_for_indicators(indicators) }}
group by country_code, name, region, year
order by country_code, year

{% endmacro %}


{% macro filter_for_indicators(indicators) %}

{# Searches across list of indicators for exact matches. #}

    (
        {% for indicator in indicators %}
            indicator_code = '{{ indicator }}' {% if not loop.last %} OR {% endif %}
        {% endfor %}
    )
{% endmacro %}
