-- AirBnB Sample Data

-- ==========================
-- Users
-- ==========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'Alice', 'Johnson', 'alice@example.com', 'hashedpassword1', '0712345678', 'guest'),
(UUID(), 'Bob', 'Smith', 'bob@example.com', 'hashedpassword2', '0723456789', 'host'),
(UUID(), 'Charlie', 'Lee', 'charlie@example.com', 'hashedpassword3', NULL, 'admin');

-- ==========================
-- Properties
-- ==========================
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM users WHERE email='bob@example.com'), 'Cozy Cottage', 'A small cozy cottage in the hills', 'Nairobi', 50.00),
(UUID(), (SELECT user_id FROM users WHERE email='bob@example.com'), 'Urban Apartment', 'Modern apartment in city center', 'Nairobi', 80.00);

-- ==========================
-- Bookings
-- ==========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(UUID(), (SELECT property_id FROM properties WHERE name='Cozy Cottage'), (SELECT user_id FROM users WHERE email='alice@example.com'), '2025-09-10', '2025-09-15', 250.00, 'confirmed'),
(UUID(), (SELECT property_id FROM properties WHERE name='Urban Apartment'), (SELECT user_id FROM users WHERE email='alice@example.com'), '2025-10-01', '2025-10-05', 400.00, 'pending');

-- ==========================
-- Payments
-- ==========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
(UUID(), (SELECT booking_id FROM bookings WHERE total_price=250.00), 250.00, 'credit_card');

-- ==========================
-- Reviews
-- ==========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(), (SELECT property_id FROM properties WHERE name='Cozy Cottage'), (SELECT user_id FROM users WHERE email='alice@example.com'), 5, 'Amazing stay, very cozy!'),
(UUID(), (SELECT property_id FROM properties WHERE name='Urban Apartment'), (SELECT user_id FROM users WHERE email='alice@example.com'), 4, 'Great location, comfortable apartment.');

-- ==========================
-- Messages
-- ==========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
(UUID(), (SELECT user_id FROM users WHERE email='alice@example.com'), (SELECT user_id FROM users WHERE email='bob@example.com'), 'Hi Bob, I have a question about the cottage.'),
(UUID(), (SELECT user_id FROM users WHERE email='bob@example.com'), (SELECT user_id FROM users WHERE email='alice@example.com'), 'Hello Alice, sure, what would you like to know?');
