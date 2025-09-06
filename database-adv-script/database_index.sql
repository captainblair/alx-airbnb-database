-- Indexes on Users table
CREATE INDEX idx_users_id ON users(id);

-- Indexes on Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Indexes on Properties table
CREATE INDEX idx_properties_id ON properties(id);

-- Indexes on Reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
