
WITH src_listings AS (
    SELECT 
        * 
    FROM {{ ref('src_listings')}}
)
SELECT
 listing_id,
 listing_name,
 room_type,
 CASE
    WHEN minimum_nights = 0 THEN 1
     ELSE minimum_nights
 END AS minimum_nights,
 host_id,
 REPLACE(
    price_str,
    '$'
    ) :: NUMBER(
            10,
             2
            ) AS price,
 created_at,
 updated_at
FROM
 src_listings

 -----------

WITH src_hosts AS (
    SELECT
    * 
    FROM
    {{ ref('src_hosts') }}
) SELECT
    host_id,
    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts