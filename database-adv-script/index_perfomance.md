# Index Optimization

This task demonstrates how indexes can improve query performance.

## Identified High-Usage Columns
- **users.id** → Frequently used in `JOIN` with bookings.
- **bookings.user_id** → Used in `JOIN` with users.
- **bookings.property_id** → Used in `JOIN` with properties.
- **properties.id** → Frequently used in `JOIN` with bookings and reviews.
- **reviews.property_id** → Used in `JOIN` with properties.

## Create Index Statements
```sql
-- On users table
CREATE INDEX idx_users_id ON users(id);

-- On bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- On properties table
CREATE INDEX idx_properties_id ON properties(id);

-- On reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
