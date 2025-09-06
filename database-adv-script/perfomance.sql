-- Initial complex query (before optimization)
EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       u.name AS user_name,
       u.email,
       p.name AS property_name,
       p.location,
       pay.amount,
       pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

-- Optimized query (after removing redundancy + indexing)
-- Add useful indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Optimized version using explicit SELECT and avoiding extra columns
EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       u.name,
       p.name AS property_name,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
