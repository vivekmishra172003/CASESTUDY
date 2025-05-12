CREATE DATABASE user_service_db;
CREATE DATABASE deals_service_db;
CREATE DATABASE coupon_service_db;


USE user_service_db;

CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


USE deals_service_db;

CREATE TABLE deals (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    merchant_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    original_price DECIMAL(10,2) NOT NULL,
    discounted_price DECIMAL(10,2) NOT NULL,
    discount_percentage DECIMAL(5,2),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);


USE coupon_service_db;

CREATE TABLE coupons (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    discount_type ENUM('PERCENTAGE', 'FIXED_AMOUNT') NOT NULL,
    discount_value DECIMAL(10,2) NOT NULL,
    min_purchase_amount DECIMAL(10,2) DEFAULT 0.00,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE user_coupons (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    coupon_id BIGINT NOT NULL,
    is_used BOOLEAN DEFAULT FALSE,
    used_date TIMESTAMP
);



USE user_service_db;

INSERT INTO users (username, email, password, name) VALUES
('john_doe', 'john@example.com', 'password123', 'John Doe'),
('jane_smith', 'jane@example.com', 'password456', 'Jane Smith');


USE deals_service_db;

INSERT INTO deals (title, description, merchant_name, category, original_price, discounted_price, discount_percentage, start_date, end_date, is_active) VALUES
('50% Off Nike Shoes', 'Get 50% off on selected Nike shoes', 'Nike', 'Fashion', 100.00, 50.00, 50.00, '2025-01-01', '2025-12-31', true),
('Buy 1 Get 1 Free Pizza', 'Buy one pizza and get one free', 'Pizza Hut', 'Food', 20.00, 10.00, 50.00, '2025-01-01', '2025-12-31', true),
('30% Off Electronics', 'Get 30% off on all electronics', 'Best Buy', 'Electronics', 1000.00, 700.00, 30.00, '2025-01-01', '2025-12-31', true);


USE coupon_service_db;

INSERT INTO coupons (code, description, discount_type, discount_value, min_purchase_amount, start_date, end_date, is_active) VALUES
('WELCOME10', '10% off on your first purchase', 'PERCENTAGE', 10.00, 0.00, '2025-01-01', '2025-12-31', true),
('FLAT20', 'Flat $20 off on purchase above $100', 'FIXED_AMOUNT', 20.00, 100.00, '2025-01-01', '2025-12-31', true),
('SUMMER25', '25% off on summer collection', 'PERCENTAGE', 25.00, 50.00, '2025-01-01', '2025-12-31', true);

INSERT INTO user_coupons (user_id, coupon_id, is_used) VALUES
(1, 1, false),
(1, 2, false),
(2, 3, false);





