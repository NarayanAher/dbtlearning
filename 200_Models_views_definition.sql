WITH raw_listings AS ( SELECT
*
FROM AIRBNB.RAW.RAW_LISTINGS
)
SELECT
id AS listing_id, 
name AS listing_name, 
listing_url, 
room_type, 
minimum_nights, 
host_id,
price AS price_str, 
created_at, 
updated_at
FROM
    raw_listings

--

WITH raw_reviews AS (
    SELECT 
    *
    FROM
        AIRBNB.RAW.RAW_REVIEWS
)
SELECT
    LISTING_ID, 
    DATE AS REVIEW_DATE, 
    REVIEWER_NAME, 
    COMMENTS AS REVIEW_TEXT, 
    SENTIMENT AS REVIEW_SENTIMENT
FROM
    RAW_REVIEWS

---
WITH raw_hosts AS ( SELECT
*
FROM
       AIRBNB.RAW.RAW_HOSTS
)
SELECT
    id AS host_id,
    NAME AS host_name, 
    is_superhost, 
    created_at, 
    updated_at
FROM
    raw_hosts