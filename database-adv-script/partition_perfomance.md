# Partitioning Performance Report

## Initial Setup
The `bookings` table was growing large, causing slower query performance when filtering by date ranges (`start_date` column).

## Partitioning Approach
We created a new table `bookings_partitioned` using **RANGE partitioning** on the `start_date` column:
- `bookings_2023` → for rows in year 2023  
- `bookings_2024` → for rows in year 2024  
- `bookings_future` → for rows in year 2025 and beyond  

## Queries Tested
A sample query was executed to fetch bookings within the year 2024:

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
