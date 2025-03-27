CREATE DATABASE social_media;
USE social_media;

CREATE TABLE social_media_data (
    consumer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    age INT,
    gender VARCHAR(20),
    income_usd INT,
    education_level VARCHAR(50),
    social_media_usage FLOAT,
    social_media_platforms VARCHAR(255),
    influence_level VARCHAR(50),
    purchase_decision VARCHAR(10),
    product_category VARCHAR(100),
    specific_product VARCHAR(100),
    amount_spent_usd INT,
    brand_name VARCHAR(255),
    city VARCHAR(100)
);
SELECT * FROM social_media_data LIMIT 10;

-- Identify Most Engaged Consumers (Similar to Viral Posts)
SELECT consumer_id, customer_name, social_media_usage, social_media_platforms
FROM social_media_data
WHERE social_media_usage > (SELECT AVG(social_media_usage) FROM social_media_data)
ORDER BY social_media_usage DESC;

-- SELECT influence_level, COUNT(*) AS total_users
SELECT influence_level, COUNT(*) AS total_users
FROM social_media_data
GROUP BY influence_level
ORDER BY total_users DESC;

--  Detect Fake Engagement (Unrealistic Usage Patterns)
SELECT consumer_id, customer_name, social_media_usage, city
FROM social_media_data
WHERE social_media_usage > 3;  -- Adjust threshold based on dataset

-- Find Most Popular Social Media Platforms
SELECT social_media_platforms, COUNT(*) AS user_count
FROM social_media_data
GROUP BY social_media_platforms
ORDER BY user_count DESC;

-- Optimize Performance with Indexes
CREATE INDEX idx_usage ON social_media_data(social_media_usage);
CREATE INDEX idx_influence ON social_media_data(influence_level);
CREATE INDEX idx_purchase ON social_media_data(purchase_decision);



CREATE TABLE social_media_posts (
    post_id INT PRIMARY KEY,
    consumer_id INT,  -- Foreign Key from social_media_data
    post_time DATETIME,
    likes INT DEFAULT 0,
    shares INT DEFAULT 0,
    comments INT DEFAULT 0,
    FOREIGN KEY (consumer_id) REFERENCES social_media_data(consumer_id)
);

INSERT INTO social_media_posts (post_id, consumer_id, post_time, likes, shares, comments) VALUES
(1, 101, '2025-03-26 10:30:00', 1500, 400, 800),
(2, 102, '2025-03-26 11:00:00', 1200, 350, 700),
(3, 103, '2025-03-26 12:15:00', 950, 300, 600),
(4, 104, '2025-03-26 13:45:00', 2200, 600, 900),
(5, 105, '2025-03-26 14:30:00', 800, 200, 500),
(6, 106, '2025-03-26 15:10:00', 1750, 500, 1000),
(7, 107, '2025-03-26 16:25:00', 1050, 250, 650),
(8, 108, '2025-03-26 17:50:00', 2800, 750, 1200),
(9, 109, '2025-03-26 18:30:00', 950, 300, 400),
(10, 110, '2025-03-26 19:15:00', 4000, 1000, 2000),
(11, 111, '2025-03-26 20:00:00', 1550, 410, 890),
(12, 112, '2025-03-26 20:45:00', 2500, 780, 1100),
(13, 113, '2025-03-26 21:30:00', 900, 320, 400),
(14, 114, '2025-03-26 22:10:00', 3000, 950, 1300),
(15, 115, '2025-03-26 22:50:00', 1100, 370, 670),
(16, 116, '2025-03-26 23:30:00', 2750, 850, 1250),
(17, 117, '2025-03-27 00:15:00', 800, 260, 400),
(18, 118, '2025-03-27 01:00:00', 3400, 1200, 1800),
(19, 119, '2025-03-27 01:45:00', 750, 200, 350),
(20, 120, '2025-03-27 02:30:00', 1800, 580, 900),
(21, 121, '2025-03-27 03:15:00', 2700, 930, 1400),
(22, 122, '2025-03-27 04:00:00', 1450, 480, 750),
(23, 123, '2025-03-27 04:45:00', 3100, 1000, 1700),
(24, 124, '2025-03-27 05:30:00', 1250, 410, 670),
(25, 125, '2025-03-27 06:15:00', 1900, 600, 950),
(26, 126, '2025-03-27 07:00:00', 800, 250, 450),
(27, 127, '2025-03-27 07:45:00', 2200, 750, 1150),
(28, 128, '2025-03-27 08:30:00', 1600, 500, 850),
(29, 129, '2025-03-27 09:15:00', 2750, 870, 1350),
(30, 130, '2025-03-27 10:00:00', 1000, 350, 600),
(31, 131, '2025-03-27 10:45:00', 2000, 690, 980),
(32, 132, '2025-03-27 11:30:00', 2950, 990, 1600),
(33, 133, '2025-03-27 12:15:00', 1800, 570, 930),
(34, 134, '2025-03-27 13:00:00', 2100, 780, 1250),
(35, 135, '2025-03-27 13:45:00', 1450, 500, 770),
(36, 136, '2025-03-27 14:30:00', 1750, 650, 1100),
(37, 137, '2025-03-27 15:15:00', 3200, 1200, 1800),
(38, 138, '2025-03-27 16:00:00', 950, 400, 600),
(39, 139, '2025-03-27 16:45:00', 2800, 900, 1400),
(40, 140, '2025-03-27 17:30:00', 1450, 500, 800),
(41, 141, '2025-03-27 18:15:00', 3900, 1400, 2100),
(42, 142, '2025-03-27 19:00:00', 1150, 370, 680),
(43, 143, '2025-03-27 19:45:00', 2600, 1000, 1500),
(44, 144, '2025-03-27 20:30:00', 1550, 530, 890),
(45, 145, '2025-03-27 21:15:00', 3500, 1200, 1750),
(46, 146, '2025-03-27 22:00:00', 1250, 420, 670),
(47, 147, '2025-03-27 22:45:00', 2150, 750, 1200),
(48, 148, '2025-03-27 23:30:00', 1900, 650, 1100),
(49, 149, '2025-03-28 00:15:00', 2750, 980, 1400),
(50, 150, '2025-03-28 01:00:00', 1650, 580, 900);

-- VIEW for High-Influence Users
CREATE VIEW top_influencers AS
SELECT d.consumer_id, d.customer_name, d.influence_level, 
       SUM(p.likes * 1 + p.shares * 2 + p.comments * 1.5) AS influence_score
FROM social_media_data d
JOIN social_media_posts p ON d.consumer_id = p.consumer_id
GROUP BY d.consumer_id, d.customer_name, d.influence_level
ORDER BY influence_score DESC;

SELECT * FROM top_influencers;


CREATE INDEX idx_engagement ON social_media_posts(likes, shares, comments);
CREATE INDEX idx_post_time ON social_media_posts(post_time);

SHOW INDEX FROM social_media_posts;
-- DROP INDEX idx_engagement ON social_media_posts;

--  Identify Top Spending Consumers Who Are Also Active on Social Media
SELECT d.consumer_id, d.customer_name, d.amount_spent_usd, d.social_media_usage, 
       p.likes, p.shares, p.comments
FROM social_media_data d
LEFT JOIN social_media_posts p ON d.consumer_id = p.consumer_id
WHERE d.amount_spent_usd > 500  
ORDER BY d.amount_spent_usd DESC;


/*
ALTER TABLE social_media_posts 
PARTITION BY RANGE (YEAR(post_time)) (
    PARTITION p1 VALUES LESS THAN (2023),
    PARTITION p2 VALUES LESS THAN (2024),
    PARTITION p3 VALUES LESS THAN (2025)
);
*/
-- Time-Series Analysis (Post Engagement Over Time)
SELECT DATE(post_time) AS post_date, HOUR(post_time) AS post_hour, 
       SUM(likes) AS total_likes, SUM(shares) AS total_shares, SUM(comments) AS total_comments
FROM social_media_posts
GROUP BY post_date, post_hour
ORDER BY post_date DESC, post_hour DESC;

WITH RECURSIVE ReferralChain AS (
    SELECT consumer_id, customer_name, referred_by, 1 AS level
    FROM social_media_data
    WHERE referred_by IS NOT NULL
    UNION ALL
    SELECT sm.consumer_id, sm.customer_name, sm.referred_by, rc.level + 1
    FROM social_media_data sm
    JOIN ReferralChain rc ON sm.referred_by = rc.consumer_id
)
SELECT * FROM ReferralChain ORDER BY level, consumer_id;

