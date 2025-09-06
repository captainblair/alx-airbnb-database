# Partitioning Performance Report

This document shows the partitioning approach applied to the `bookings` table and the observed performance improvement when querying by date ranges.

## Problem
The `bookings` table grows large and queries filtering by `start_date` were performing full-table scans and taking too long.

## Partitioning Approach
We implemented **RANGE partitioning** on the `start_date` column (partitioning by year) and created year-based partitions.

## SQL used to create partitioned table and partitions
```sql
-- partitioning.sql (summary)
DROP TABLE IF EXISTS bookings_partitioned;

CREATE TABLE bookings_partitioned (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW()
)
PARTITION BY RANGE (EXTRACT(YEAR FROM start_date));

CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
  FOR VALUES FROM (2023) TO (2024);

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
  FOR VALUES FROM (2024) TO (2025);

CREATE TABLE bookings_future PARTITION OF bookings_partitioned
  FOR VALUES FROM (2025) TO (MAXVALUE);
