# AirBnB Database Normalization

## Objective
Ensure the database design is normalized to Third Normal Form (3NF) to eliminate redundancy and maintain data integrity.

## Normalization Steps

### 1. First Normal Form (1NF)
- All tables have atomic columns (no lists or arrays).  
- Each row is uniquely identified by a primary key (e.g., `user_id`, `property_id`, `booking_id`).

### 2. Second Normal Form (2NF)
- All non-key attributes depend on the full primary key.  
- No partial dependencies exist, since all tables use single-column primary keys.

### 3. Third Normal Form (3NF)
- All non-key attributes depend only on the primary key.  
- No transitive dependencies exist in any table.  

## Table Analysis

- **User**: All columns depend on `user_id`. ✅  
- **Property**: Attributes depend on `property_id`; `host_id` correctly references `User`. ✅  
- **Booking**: Attributes depend on `booking_id`; FKs (`property_id`, `user_id`) maintain referential integrity. ✅  
- **Payment**: Attributes depend on `payment_id`; FK references `Booking`. ✅  
- **Review**: Attributes depend on `review_id`; FKs reference `Property` and `User`. ✅  
- **Message**: Attributes depend on `message_id`; sender and recipient FKs reference `User`. ✅  

## Conclusion
- All tables (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) are already in **3NF**.  
- No structural changes are required.
