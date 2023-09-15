{{ config(materialized='table') }}

{# Generate data regarding Literacy. #}

{{ pivot_by_topic('Literacy') }}