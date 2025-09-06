# Database Performance Monitoring Report

This document summarizes the monitoring and refinement of frequently used queries in the `alx-airbnb-database` to improve performance.

## Monitored Queries
1. Fetch all bookings with user and property details.
2. Fetch properties along with average ratings and reviews.
3. Fetch users who made more than 3 bookings.

## Monitoring Approach
- Used **EXPLAIN ANALYZE** to measure query execution times.
- Used **SHOW PROFILE** to identify time spent on parsing, optimizing, and execution.

### Example
```sql
EXPLAIN ANALYZE
SELECT b.id AS booking_id, u.name, p.name AS property_name, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date BETWEEN '2024-01-01' AND '2024-12-31';
