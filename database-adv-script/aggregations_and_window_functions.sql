-- 1. Aggregation with GROUP BY:
-- Find the total number of bookings made by each user
SELECT 
  u.id AS user_id,
  u.name AS user_name,
  COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;

-- 2a. Window function using RANK:
-- Rank properties based on the total number of bookings they have received
SELECT 
  property_id,
  property_name,
  total_bookings,
  RANK() OVER (ORDER BY total_bookings DESC) AS property_rank
FROM (
  SELECT p.id AS property_id, p.name AS property_name,
         COUNT(b.id) AS total_bookings
  FROM properties p
  LEFT JOIN bookings b ON p.id = b.property_id
  GROUP BY p.id, p.name
) AS aggregated_props
ORDER BY property_rank;

-- 2b. Window function using ROW_NUMBER:
-- Provide a deterministic row number ranking of properties by total bookings
SELECT
  property_id,
  property_name,
  total_bookings,
  ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num
FROM (
  SELECT p.id AS property_id, p.name AS property_name,
         COUNT(b.id) AS total_bookings
  FROM properties p
  LEFT JOIN bookings b ON p.id = b.property_id
  GROUP BY p.id, p.name
) AS aggregated_props_by_rownum
ORDER BY row_num;
