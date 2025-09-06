-- partitioning.sql

-- Drop existing table if needed (for demo purposes)
DROP TABLE IF EXISTS bookings_partitioned;

-- Create a partitioned table on start_date (RANGE partitioning by YEAR)
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
)
PARTITION BY RANGE (EXTRACT(YEAR FROM start_date));

-- Create partitions for specific year ranges
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM (2023) TO (2024);

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM (2024) TO (2025);

CREATE TABLE bookings_future PARTITION OF bookings_partitioned
    FOR VALUES FROM (2025) TO (MAXVALUE);

-- Insert sample data (for testing)
INSERT INTO bookings_partitioned (user_id, property_id, start_date, end_date, status)
VALUES
(1, 101, '2023-02-10', '2023-02-15', 'confirmed'),
(2, 102, '2024-06-05', '2024-06-08', 'pending'),
(3, 103, '2025-07-01', '2025-07-10', 'confirmed');

-- Query performance test (fetch by date range)
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
