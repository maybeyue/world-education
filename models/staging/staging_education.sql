    select edu.*,
        series.topic,
        country.table_name as name,
        country.region as region,
        replace(edu.indicator_code, '.', '_') indicator_code_cleaned,
        regexp_replace(
            replace(
                lower(edu.indicator_name), ' ', '_'
            ),
            '[^a-zA-Z0-9_]',
            ''
        ) indicator_name_cleaned
    from {{ source('world_bank_intl_education', 'international_education') }} edu
    join {{ source('world_bank_intl_education', 'series_summary') }} series
        on series.series_code = edu.indicator_code
    left join {{ source('world_bank_intl_education', 'country_summary') }} country
        on country.country_code = edu.country_code