# Index Performance

This task demonstrates how indexes improve query performance.

## Identified High-Usage Columns
- `users.id` → frequently used in JOIN with `bookings`
- `bookings.user_id` → used in JOIN with `users`
- `bookings.property_id` → used in JOIN with `properties`
- `properties.id` → frequently used in JOINs
- `reviews.property_id` → used in JOIN with `properties`

---



## Measuring Performance

We measured performance using `EXPLAIN ANALYZE` before and after creating indexes.

### Before Indexes
```sql
EXPLAIN ANALYZE SELECT u.name, b.check_in, p.title
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE p.id = 10;


Sample Output (before indexes):

id	select_type	table	type	possible_keys	key	rows	Extra
1	SIMPLE	p	ALL	NULL	NULL	5000	Using where
1	SIMPLE	b	ALL	NULL	NULL	20000	
1	SIMPLE	u	ALL	NULL	NULL	10000	

Sample Output (after indexes):

id	select_type	table	type	possible_keys	key	rows	Extra
1	SIMPLE	p	const	PRIMARY	PRIMARY	1	Using index
1	SIMPLE	b	ref	idx_bookings_property_id	idx_bookings_property_id	12	Using where
1	SIMPLE	u	eq_ref	PRIMARY, idx_users_id	PRIMARY	1