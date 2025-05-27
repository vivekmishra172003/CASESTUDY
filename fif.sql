check
-- Create databases for each service
CREATE DATABASE userdb;
CREATE DATABASE dealdb;
CREATE DATABASE coupondb;

-- Verify databases are created
SHOW DATABASES;


USE userdb;

CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO users (name, email, password) VALUES 
('John Doe', 'john@example.com', '$2a$10$rVbEhEihWF5rwNh9MgWRwekBlEHa7GCWA37PYX8sGa2LV.6CEJF8G'),
('Jane Smith', 'jane@example.com', '$2a$10$rVbEhEihWF5rwNh9MgWRwekBlEHa7GCWA37PYX8sGa2LV.6CEJF8G');
-- Password for both users is: password123
USE userdb;

CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO users (name, email, password) VALUES 
('John Doe', 'john@example.com', '$2a$10$rVbEhEihWF5rwNh9MgWRwekBlEHa7GCWA37PYX8sGa2LV.6CEJF8G'),
('Jane Smith', 'jane@example.com', '$2a$10$rVbEhEihWF5rwNh9MgWRwekBlEHa7GCWA37PYX8sGa2LV.6CEJF8G');
-- Password for both users is: password123



USE dealdb;

CREATE TABLE deals (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    original_price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample deals
INSERT INTO deals (title, description, original_price, category) VALUES
('Large Pizza Special', 'Delicious large pizza with 3 toppings', 25.00, 'Food'),
('Premium Haircut', 'Professional haircut and styling', 45.00, 'Beauty'),
('Coffee & Pastry Combo', 'Fresh coffee with choice of pastry', 12.00, 'Food'),
('Gym Membership Monthly', '1 month gym membership with trainer session', 80.00, 'Fitness');


USE coupondb;

CREATE TABLE coupons (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) UNIQUE NOT NULL,
    discount_percentage INT NOT NULL,
    max_uses_per_user INT DEFAULT 1,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_coupon_usage (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    coupon_id BIGINT NOT NULL,
    times_used INT DEFAULT 0,
    last_used_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (coupon_id) REFERENCES coupons(id)
);

-- Insert sample coupons
INSERT INTO coupons (code, discount_percentage, max_uses_per_user, is_active) VALUES
('WELCOME10', 10, 1, TRUE),
('SAVE20', 20, 1, TRUE),
('STUDENT15', 15, 2, TRUE),
('FIRST25', 25, 1, TRUE);