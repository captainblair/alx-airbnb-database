CREATE TABLE `users` (
  `user_id` UUID PRIMARY KEY COMMENT 'Primary Key, Indexed',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone_number` varchar(255),
  `role` enum(guest,host,admin) NOT NULL,
  `created_at` timestamp DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `properties` (
  `property_id` UUID PRIMARY KEY COMMENT 'Primary Key, Indexed',
  `host_id` UUID,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `pricepernight` decimal NOT NULL,
  `created_at` timestamp DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` timestamp COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `bookings` (
  `booking_id` UUID PRIMARY KEY COMMENT 'Primary Key, Indexed',
  `property_id` UUID,
  `user_id` UUID,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_price` decimal NOT NULL,
  `status` enum(pending,confirmed,canceled) NOT NULL,
  `created_at` timestamp DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `payments` (
  `payment_id` UUID PRIMARY KEY COMMENT 'Primary Key, Indexed',
  `booking_id` UUID,
  `amount` decimal NOT NULL,
  `payment_date` timestamp DEFAULT (CURRENT_TIMESTAMP),
  `payment_method` enum(credit_card,paypal,stripe) NOT NULL
);

CREATE TABLE `reviews` (
  `review_id` UUID PRIMARY KEY COMMENT 'Primary Key, Indexed',
  `property_id` UUID,
  `user_id` UUID,
  `rating` int NOT NULL COMMENT 'CHECK: rating >= 1 AND rating <= 5',
  `comment` text NOT NULL,
  `created_at` timestamp DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `messages` (
  `message_id` UUID PRIMARY KEY COMMENT 'Primary Key, Indexed',
  `sender_id` UUID,
  `recipient_id` UUID,
  `message_body` text NOT NULL,
  `sent_at` timestamp DEFAULT (CURRENT_TIMESTAMP)
);

ALTER TABLE `properties` ADD FOREIGN KEY (`host_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `payments` ADD FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `messages` ADD FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `messages` ADD FOREIGN KEY (`recipient_id`) REFERENCES `users` (`user_id`);
