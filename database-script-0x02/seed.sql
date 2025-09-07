-- AirBnB Sample Data (Simple Version)

-- ==========================
-- Users
-- ==========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashedpass1', '0712345678', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashedpass2', '0723456789', 'host'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Lee', 'charlie@example.com', 'hashedpass3', NULL, 'admin');

-- ==========================
-- Properties
-- ==========================
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Cozy Cottage', 'Small cozy cottage', 'Nairobi', 50.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', 'Urban Apartment', 'Modern apartment in city center', 'Nairobi', 80.00);

-- ==========================
-- Bookings
-- ==========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-09-10', '2025-09-15', 250.00, 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '11111111-1111-1111-1111-111111111111', '2025-10-01', '2025-10-05', 400.00, 'pending');

-- ==========================
-- Payments
-- ==========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 250.00, 'credit_card'),
('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 400.00, 'paypal');

-- ==========================
-- Reviews
-- ==========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('ddddddd1-dddd-dddd-dddd-ddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay!'),
('ddddddd2-dddd-dddd-dddd-ddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '11111111-1111-1111-1111-111111111111', 4, 'Great location.');

-- ==========================
-- Messages
-- ==========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, I have a question.'),
('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Sure Alice, what is it?');
