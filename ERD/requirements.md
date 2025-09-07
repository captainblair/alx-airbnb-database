# AirBnB Database ERD Requirements

## Entities and Attributes

### User
- **user_id** (PK, UUID, Indexed)
- **first_name** (VARCHAR, NOT NULL)
- **last_name** (VARCHAR, NOT NULL)
- **email** (VARCHAR, UNIQUE, NOT NULL)
- **password_hash** (VARCHAR, NOT NULL)
- **phone_number** (VARCHAR, NULL)
- **role** (ENUM: guest, host, admin, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Property
- **property_id** (PK, UUID, Indexed)
- **host_id** (FK → User.user_id)
- **name** (VARCHAR, NOT NULL)
- **description** (TEXT, NOT NULL)
- **location** (VARCHAR, NOT NULL)
- **pricepernight** (DECIMAL, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- **updated_at** (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### Booking
- **booking_id** (PK, UUID, Indexed)
- **property_id** (FK → Property.property_id)
- **user_id** (FK → User.user_id)
- **start_date** (DATE, NOT NULL)
- **end_date** (DATE, NOT NULL)
- **total_price** (DECIMAL, NOT NULL)
- **status** (ENUM: pending, confirmed, canceled, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Payment
- **payment_id** (PK, UUID, Indexed)
- **booking_id** (FK → Booking.booking_id)
- **amount** (DECIMAL, NOT NULL)
- **payment_date** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- **payment_method** (ENUM: credit_card, paypal, stripe, NOT NULL)

### Review
- **review_id** (PK, UUID, Indexed)
- **property_id** (FK → Property.property_id)
- **user_id** (FK → User.user_id)
- **rating** (INTEGER, NOT NULL, CHECK: rating >= 1 AND rating <= 5)
- **comment** (TEXT, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Message
- **message_id** (PK, UUID, Indexed)
- **sender_id** (FK → User.user_id)
- **recipient_id** (FK → User.user_id)
- **message_body** (TEXT, NOT NULL)
- **sent_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## Relationships

- **User (1) → Booking (M)**: A user can have multiple bookings.  
- **Property (1) → Booking (M)**: A property can be booked multiple times.  
- **Booking (1) → Payment (1)**: Each booking has one payment.  
- **User (1) → Property (M)**: A host (user) can list multiple properties.  
- **User (1) → Review (M)**: A user can leave multiple reviews.  
- **Property (1) → Review (M)**: A property can have multiple reviews.  
- **User (sender) (1) → Message (M)**: A user can send multiple messages.  
- **User (recipient) (1) → Message (M)**: A user can receive multiple messages.  

---

## Constraints

- **User Table**
  - `email` must be unique.
  - Required fields cannot be NULL.  

- **Property Table**
  - `host_id` must reference a valid User.
  - Required fields cannot be NULL.  

- **Booking Table**
  - `property_id` and `user_id` must reference valid entries.
  - `status` must be one of: pending, confirmed, canceled.  

- **Payment Table**
  - `booking_id` must reference a valid Booking.  

- **Review Table**
  - `rating` must be between 1 and 5.
  - `property_id` and `user_id` must reference valid entries.  

- **Message Table**
  - `sender_id` and `recipient_id` must reference valid Users.  

---

## Indexing

- Primary keys are automatically indexed.  
- Additional indexes:
  - `email` in the User table.  
  - `property_id` in Property and Booking tables.  
  - `booking_id` in Booking and Payment tables.
