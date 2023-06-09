{{ config(materialized = 'table', 
partition_by= {
    'field': 'pickup_datetime', 
    'data_type': 'timestamp',
    'granularity': 'day'
    },
      cluster_by=["pustation_id","dostation_id"]) }} 

WITH tfldata AS (
    SELECT
        *
    FROM
        {{ ref('stg_tfl_rides') }}
)

SELECT 
    *
FROM tfldata

WHERE EXTRACT(YEAR FROM pickup_datetime)=2022 AND EXTRACT(YEAR FROM dropoff_datetime)=2022