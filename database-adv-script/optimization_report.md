# Query Optimization Report

## Objective
Refactor a complex query that retrieves booking, user, property, and payment details to improve performance.

---

## Initial Query
```sql
SELECT b.id, u.name, u.email, p.name, p.location, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
