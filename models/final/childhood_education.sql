{{ config(materialized='table') }}

{# Generate table for early childhood education #}

{{ pivot_by_topic('Early Childhood Education') }}