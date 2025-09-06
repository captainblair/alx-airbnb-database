# Index Performance

This task demonstrates how indexes improve query performance.

## Identified High-Usage Columns
- users.id → frequently used in JOIN with bookings
- bookings.user_id → used in JOIN with users
- bookings.property_id → used in JOIN with properties
- properties.id → frequently used in JOINs
- reviews.property_id → used in JOIN with properties

## Measuring Performance

### Before Indexes
```sql
EXPLAIN ANALYZE SELECT u.name, COUNT(b.id)
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.id;

