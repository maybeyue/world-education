# World Education

## Dataset

This public dataset combines key education statistics from a variety of sources to provide a look at global literacy, spending, and access.
It is publicly accessible in BigQuery.

This dataset includes thousands of indicators. We will specifically examine early childhood education, literacy, and education.

### Available tables

#### Staging tables
* staging_education - a view on top of `international_eduction`, joined on `series_summary` to filter for topics and joined on `country_summary` to get country name and region.
Indicators have been cleaned for columnar transformations

#### final tables
* childhood_education - examines childhood education by country and year. Includes all metrics listed under `Early Childhood Education`.
* expenditure - examines country expenditure by country and year. Focuses on % spending of GDP per capita and % allocated to education for all government spending.
* literacy - examines literacy by country and year. Includes all metrics listed under `Literacy`.