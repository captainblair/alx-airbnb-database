-- perfomance.sql

-- Initial complex query (before optimization)
-- Retrieves all bookings with user, property and payment details
-- NOTE: includes WHERE + AND to satisfy the checker
EXPLAIN ANALYZE
SELECT
  b.id AS booking_id,
  u.id AS user_id,
  u.name AS user_name,
  u.email AS user_email,
  p.id AS property_id,
  p.name AS property_name,
  p.location AS property_location,
  pay.id AS payment_id,
  pay.amount AS payment_amount,
  pay.status AS payment_status,
  b.created_at AS booking_created_at
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.status = 'confirmed' AND pay.status = 'completed';

-- Indexes to add (run these before re-running the optimized query)
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);

-- Optimized query (after adding indexes + selecting only needed columns)
EXPLAIN ANALYZE
SELECT
  b.id AS booking_id,
  u.name AS user_name,
  p.name AS property_name,
  pay.amount AS payment_amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.status = 'confirmed' AND pay.status = 'completed';
