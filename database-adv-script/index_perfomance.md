# Index Performance

This task demonstrates how indexes improve query performance.

## Identified High-Usage Columns
- `users.id` → frequently used in JOIN with `bookings`
- `bookings.user_id` → used in JOIN with `users`
- `bookings.property_id` → used in JOIN with `properties`
- `properties.id` → frequently used in JOINs
- `reviews.property_id` → used in JOIN with `properties`

## Measuring Performance

### Before Indexes
```sql
EXPLAIN SELECT u.name, b.check_in, p.title
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE p.id = 10;
