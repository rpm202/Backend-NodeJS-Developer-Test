CREATE DATABASE IF NOT EXISTS event_booking;
USE event_booking;

CREATE TABLE events (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    total_seats INT UNSIGNED NOT NULL
);

CREATE TABLE bookings (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    events_id INT UNSIGNED NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (events_id) REFERENCES events(id) ON DELETE CASCADE
);

INSERT INTO events (id, name, total_seats) VALUES
(1, 'Music Festival 2025', 5),
(2, 'Tech Conference', 10),
(3, 'Startup Pitch Night', 8),
(4, 'AI Hackathon 2025', 15),
(5, 'Stand-up Comedy Night', 6);

INSERT INTO bookings (id, events_id, user_id, created_at) VALUES
(1, 1, 'user123', '2025-10-08 12:00:00'),
(2, 1, 'user456', '2025-10-08 12:05:00'),
(3, 2, 'alice', '2025-10-08 12:10:00'),
(4, 3, 'bob', '2025-10-08 12:15:00'),
(5, 4, 'charlie', '2025-10-08 12:20:00');