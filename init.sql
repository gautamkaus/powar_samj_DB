-- Database initialization script for Powar application

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS powar_db;
USE powar_db; 

-- Create master tables
CREATE TABLE IF NOT EXISTS `master_state` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `state_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `master_dist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `master_state_id` bigint NOT NULL,
  `dist_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`master_state_id`) REFERENCES `master_state`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `master_tahsil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `master_dist_id` bigint NOT NULL,
  `tahsil_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`master_dist_id`) REFERENCES `master_dist`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `master_profession` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_type` enum('PRIVATE','GOVERNMENT','SELF_EMPLOYED','BUSINESS') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create user tables
CREATE TABLE IF NOT EXISTS `Users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile_no` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('ADMIN','USER','MODERATOR') COLLATE utf8mb4_general_ci DEFAULT 'USER',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_id` (`email_id`),
  UNIQUE KEY `mobile_no` (`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `middle_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `profile_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` enum('MALE','FEMALE','OTHER') COLLATE utf8mb4_general_ci NOT NULL,
  `state_id` bigint DEFAULT NULL,
  `district_id` bigint DEFAULT NULL,
  `tahsil_id` bigint DEFAULT NULL,
  `address_line` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_general_ci,
  `profession_id` bigint DEFAULT NULL,
  `business_description` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY (`state_id`) REFERENCES `master_state`(`id`),
  FOREIGN KEY (`district_id`) REFERENCES `master_dist`(`id`),
  FOREIGN KEY (`tahsil_id`) REFERENCES `master_tahsil`(`id`),
  FOREIGN KEY (`profession_id`) REFERENCES `master_profession`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert sample data
INSERT IGNORE INTO `master_state` (`state_name`) VALUES 
('Maharashtra'), ('Delhi'), ('Karnataka'), ('Tamil Nadu');

INSERT IGNORE INTO `master_dist` (`master_state_id`, `dist_name`) VALUES 
(1, 'Mumbai'), (1, 'Pune'), (1, 'Nagpur'),
(2, 'New Delhi'), (2, 'Central Delhi'), (2, 'South Delhi'),
(3, 'Bangalore'), (3, 'Mysore'), (3, 'Mangalore'),
(4, 'Chennai'), (4, 'Coimbatore'), (4, 'Madurai');

INSERT IGNORE INTO `master_tahsil` (`master_dist_id`, `tahsil_name`) VALUES 
(1, 'Mumbai City'), (1, 'Mumbai Suburban'),
(2, 'Pune City'), (2, 'Pune Rural'),
(3, 'Nagpur City'), (3, 'Nagpur Rural'),
(4, 'New Delhi Central'), (4, 'New Delhi South'),
(5, 'Central Delhi North'), (5, 'Central Delhi South'),
(6, 'South Delhi East'), (6, 'South Delhi West'),
(7, 'Bangalore Urban'), (7, 'Bangalore Rural'),
(8, 'Mysore City'), (8, 'Mysore Rural'),
(9, 'Mangalore City'), (9, 'Mangalore Rural'),
(10, 'Chennai Central'), (10, 'Chennai North'),
(11, 'Coimbatore City'), (11, 'Coimbatore Rural'),
(12, 'Madurai City'), (12, 'Madurai Rural');

INSERT IGNORE INTO `master_profession` (`employee_type`) VALUES 
('PRIVATE'), ('GOVERNMENT'), ('SELF_EMPLOYED'), ('BUSINESS');
