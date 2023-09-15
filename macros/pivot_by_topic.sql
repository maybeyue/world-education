{{ dbt_utils.import }}

{% macro pivot_by_topic(topic_name) %}

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
        where = filter_topic(topic_name),
    ),
    then_value = 'value'
  ) }}
from {{ ref("staging_education") }}
where topic = '{{ topic_name }}'
group by country_code, year, name, region
order by country_code, year

{% endmacro %}


{% macro filter_topic(topic_name) %}

topic = '{{ topic_name }}'

{% endmacro %}