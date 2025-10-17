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
(5, 'Stand-up Comedy Night', 6),
(6, 'Gaming Expo 2025', 12),
(7, 'Food & Wine Festival', 20),
(8, 'Art Exhibition', 30),
(9, 'Blockchain Meetup', 25),
(10, 'UX Design Workshop', 10),
(11, 'Photography Masterclass', 8),
(12, 'Cybersecurity Summit', 18),
(13, 'Movie Premiere: The Next Big Thing', 40),
(14, 'Charity Gala Dinner', 50),
(15, 'Marathon 2025 Registration', 100);

INSERT INTO bookings (id, events_id, user_id, created_at) VALUES
(1, 1, 'user123', '2025-10-08 12:00:00'),
(2, 1, 'user456', '2025-10-08 12:05:00'),
(3, 2, 'alice', '2025-10-08 12:10:00'),
(4, 3, 'bob', '2025-10-08 12:15:00'),
(5, 4, 'charlie', '2025-10-08 12:20:00'),
(6, 5, 'david', '2025-10-08 12:25:00'),
(7, 6, 'eva', '2025-10-08 12:30:00'),
(8, 7, 'frank', '2025-10-08 12:35:00'),
(9, 8, 'grace', '2025-10-08 12:40:00'),
(10, 9, 'hannah', '2025-10-08 12:45:00'),
(11, 10, 'ian', '2025-10-08 12:50:00'),
(12, 11, 'julia', '2025-10-08 12:55:00'),
(13, 12, 'kevin', '2025-10-08 13:00:00'),
(14, 13, 'linda', '2025-10-08 13:05:00'),
(15, 14, 'michael', '2025-10-08 13:10:00');