{{ config(materialized='table') }}

{#
Generate table for expenditure. The following are the definitions:
 SE.XPD.PRIM.PC.ZS - Government expenditure per primary student as % of GDP per capita (%)
 SE.XPD.PRIM.ZS - Expenditure on primary as % of government expenditure on education (%)
 SE.XPD.SECO.PC.ZS - Government expenditure per secondary student as % of GDP per capita (%)
 SE.XPD.SECO.ZS - Expenditure on secondary as % of government expenditure on education (%)
 SE.XPD.TERT.PC.ZS - Government expenditure per tertiary student as % of GDP per capita (%)
 SE.XPD.TERT.ZS - Expenditure on tertiary as % of government expenditure on education (%)
 SE.XPD.TOTL.GD.ZS - Government expenditure on education as % of GDP (%)
#}

{% set indicators = [
    "SE.XPD.PRIM.PC.ZS",
    "SE.XPD.PRIM.ZS",
    "SE.XPD.SECO.PC.ZS",
    "SE.XPD.SECO.ZS",
    "SE.XPD.TERT.PC.ZS",
    "SE.XPD.TERT.ZS",
    "SE.XPD.TOTL.GD.ZS"]%}

{{ pivot_by_indicators(indicators) }}
