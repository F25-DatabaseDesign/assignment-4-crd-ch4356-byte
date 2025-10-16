/* 
  United Helpers Database - Assignment 4
  Course: CSCI UA.0060 (Spring 2025)
  Student: Chen Jun Hsu
  Date Created: 2025-10-15
*/

-- Create and use database
DROP DATABASE IF EXISTS unitedhelpers;
CREATE DATABASE unitedhelpers;
USE unitedhelpers;

-- -------------------------
-- Lookup / helper tables
-- -------------------------

-- Table: task_type
CREATE TABLE task_type (
  taskTypeId INT NOT NULL AUTO_INCREMENT,
  taskTypeName VARCHAR(50) NOT NULL,
  PRIMARY KEY (taskTypeId)
) ENGINE=InnoDB;

-- Table: task_status
CREATE TABLE task_status (
  taskStatusId INT NOT NULL AUTO_INCREMENT,
  taskStatusName VARCHAR(50) NOT NULL,
  PRIMARY KEY (taskStatusId)
) ENGINE=InnoDB;

-- Table: package_type
CREATE TABLE package_type (
  packageTypeId INT NOT NULL AUTO_INCREMENT,
  packageTypeName VARCHAR(100) NOT NULL,
  PRIMARY KEY (packageTypeId)
) ENGINE=InnoDB;

-- Table: packing_list
-- This table stores packing instructions for tasks 
CREATE TABLE packing_list (
  packingListId INT NOT NULL AUTO_INCREMENT,
  packingListName VARCHAR(100) NOT NULL,
  packingListDescription TEXT,
  PRIMARY KEY (packingListId)
) ENGINE=InnoDB;

-- -------------------------
-- Core entity tables
-- -------------------------

-- Table: volunteer
-- Addresses are NYC-based because
-- United Helpers in this assignment is modeled as a NYC nonprofit.
CREATE TABLE volunteer (
  volunteerId INT NOT NULL AUTO_INCREMENT,
  volunteerName VARCHAR(100) NOT NULL,
  volunteerAddress VARCHAR(200),
  volunteerTelephone VARCHAR(20),
  PRIMARY KEY (volunteerId)
) ENGINE=InnoDB;

-- Table: task
-- packingListId is nullable because not every task is a packing task.
CREATE TABLE task (
  taskCode INT NOT NULL AUTO_INCREMENT,
  packingListId INT,  -- NULL for non-packing tasks
  taskTypeId INT NOT NULL,
  taskStatusId INT NOT NULL,
  taskDescription TEXT NOT NULL,
  PRIMARY KEY (taskCode),
  FOREIGN KEY (packingListId) REFERENCES packing_list(packingListId),
  FOREIGN KEY (taskTypeId) REFERENCES task_type(taskTypeId),
  FOREIGN KEY (taskStatusId) REFERENCES task_status(taskStatusId)
) ENGINE=InnoDB;

-- Table: assignment
-- Tracks which volunteers work on which tasks and the start/end times.
CREATE TABLE assignment (
  volunteerId INT NOT NULL,
  taskCode INT NOT NULL,
  startDateTime DATETIME NOT NULL,
  endDateTime DATETIME,  -- NULL if task not completed yet
  PRIMARY KEY (volunteerId, taskCode),
  FOREIGN KEY (volunteerId) REFERENCES volunteer(volunteerId),
  FOREIGN KEY (taskCode) REFERENCES task(taskCode)
) ENGINE=InnoDB;

-- Table: package
-- Only packing tasks produce package rows.
CREATE TABLE package (
  packageId INT NOT NULL AUTO_INCREMENT,
  taskCode INT NOT NULL,
  packageTypeId INT NOT NULL,
  packageCreateDate DATE NOT NULL,
  packageWeight DECIMAL(10,2),
  PRIMARY KEY (packageId),
  FOREIGN KEY (taskCode) REFERENCES task(taskCode),
  FOREIGN KEY (packageTypeId) REFERENCES package_type(packageTypeId)
) ENGINE=InnoDB;

-- Table: item
CREATE TABLE item (
  itemId INT NOT NULL AUTO_INCREMENT,
  itemDescription VARCHAR(200) NOT NULL,
  itemValue DECIMAL(10,2),
  quantityOnHand INT NOT NULL,
  PRIMARY KEY (itemId)
) ENGINE=InnoDB;

-- Table: package_contents
-- Junction table: which items and how many are in each package
CREATE TABLE package_contents (
  itemId INT NOT NULL,
  packageId INT NOT NULL,
  itemQuantity INT NOT NULL,
  PRIMARY KEY (itemId, packageId),
  FOREIGN KEY (itemId) REFERENCES item(itemId),
  FOREIGN KEY (packageId) REFERENCES package(packageId)
) ENGINE=InnoDB;

-- -------------------------
-- Insert seed data
-- (lookup tables first)
-- -------------------------

-- Insert data into task_type
INSERT INTO task_type (taskTypeName) VALUES
('packing'),
('recurring'),
('administrative'),
('logistics');

-- Insert data into task_status  
INSERT INTO task_status (taskStatusName) VALUES
('open'),
('in progress'),
('completed'),
('ongoing');

-- Insert data into package_type
INSERT INTO package_type (packageTypeName) VALUES
('basic medical'),
('child-care'),
('food'),
('hygiene'),
('clothing');

-- Insert data into packing_list
INSERT INTO packing_list (packingListName, packingListDescription) VALUES
('Hurricane Relief Medical', 'Prepare 1000 basic medical packages with bandages, antiseptic, pain relievers, and basic first aid supplies'),
('Flood Relief Food Packages', 'Assemble 2000 food packages containing canned goods, rice, pasta, and bottled water. No perishable items'),
('Child Care Essentials', 'Create 500 child-care packages with diapers, baby wipes, formula, toys, and childrens clothing'),
('Winter Emergency Hygiene', 'Pack 800 hygiene packages with soap, toothpaste, toothbrushes, shampoo, and towels');

-- Insert data into volunteer
INSERT INTO volunteer (volunteerName, volunteerAddress, volunteerTelephone) VALUES
('Sarah Johnson', '123 Main Street, New York, NY 10001', '212-555-3421'),
('Michael Chen', '456 Oak Ave, Brooklyn, NY 11201', '718-555-9876'),
('Emily Roger', '789 Elm St., Queens, NY 11354', '347-555-2234'),
('David Williams', '321 Pine Road, Manhattan, NY 10002', '212-555-8901'),
('Jessica Martin', '654 maple drive, Bronx, NY 10451', '718-555-4567'),
('James Thompson', '987 Cedar Lane, Staten Island, NY 10301', '718-555-3210'),
('Maria Garcia', '147 Birch St, Brooklyn, NY 11215', '347-555-6789'),
('Robert Jun', '258 Walnut Avenue, Queens, NY 11377', '718-555-1122'),
('Jennifer Lee', '369 Spruce Court, Manhattan, NY 10003', '212-555-9988'),
('Chris Taylor', '741 Ash Blvd, Bronx, NY 10463', '718-555-7766'),
('Amanda White', '852 Hickory Place, Brooklyn, NY 11220', '347-555-4433'),
('Daniel Harris', '963 Poplar Street, Queens, NY 11365', '718-555-2211');

-- Insert data into task
INSERT INTO task (packingListId, taskTypeId, taskStatusId, taskDescription) VALUES
(1, 1, 3, 'Pack medical supplies for hurricane victims in Florida'),
(2, 1, 2, 'Assemble food packages for flood relief in Louisiana'),
(3, 1, 1, 'Prepare child-care packages for families displaced by wildfires'),
(4, 1, 3, 'Create hygiene kits for winter storm victims'),
(NULL, 2, 4, 'Answer incoming phone calls from donors and volunteers'),
(NULL, 2, 4, 'Sort and organize donated items in warehouse'),
(NULL, 3, 2, 'Update volunteer database with new contact information'),
(NULL, 3, 1, 'Prepare monthly donation reports for board meeting'),
(NULL, 4, 2, 'Coordinate transportation of supplies to disaster area'),
(NULL, 4, 1, 'Arrange storage for incoming donations'),
(2, 1, 2, 'Pack additional food boxes for expanding relief effort'),
(1, 1, 2, 'Assemble more medical kits due to high demand');

-- Insert data into assignment
-- At least two volunteers are assigned to multiple tasks as required
INSERT INTO assignment (volunteerId, taskCode, startDateTime, endDateTime) VALUES
(1, 1, '2025-01-15 09:00:00', '2025-01-15 17:00:00'),
(1, 2, '2025-01-16 09:00:00', NULL),
(1, 5, '2025-01-17 14:00:00', NULL),
(2, 2, '2025-01-16 09:00:00', NULL),
(2, 6, '2025-01-14 10:00:00', NULL),
(3, 1, '2025-01-15 09:00:00', '2025-01-15 17:00:00'),
(3, 3, '2025-01-18 08:00:00', NULL),
(4, 4, '2025-01-13 09:00:00', '2025-01-13 16:00:00'),
(4, 7, '2025-01-19 10:00:00', NULL),
(5, 5, '2025-01-10 09:00:00', NULL),
(6, 6, '2025-01-14 10:00:00', NULL),
(7, 8, '2025-01-20 09:00:00', NULL),
(8, 9, '2025-01-17 08:00:00', NULL),
(9, 4, '2025-01-13 09:00:00', '2025-01-13 16:00:00'),
(10, 11, '2025-01-21 09:00:00', NULL),
(11, 12, '2025-01-22 10:00:00', NULL);

-- Insert data into package
INSERT INTO package (taskCode, packageTypeId, packageCreateDate, packageWeight) VALUES
(1, 1, '2025-01-15', 5.50),
(1, 1, '2025-01-15', 5.75),
(1, 1, '2025-01-15', 5),
(1, 1, '2025-01-15', 6.00),
(1, 1, '2025-01-15', 5.8),
(2, 3, '2025-01-16', 12.5),
(2, 3, '2025-01-16', 13),
(2, 3, '2025-01-16', 12.75),
(2, 3, '2025-01-16', 12.25),
(4, 4, '2025-01-13', 4.50),
(4, 4, '2025-01-13', 4.75),
(4, 4, '2025-01-13', 4.6),
(11, 3, '2025-01-21', 13.2),
(11, 3, '2025-01-21', 12.90),
(12, 1, '2025-01-22', 5.60);

-- Insert data into item
INSERT INTO item (itemDescription, itemValue, quantityOnHand) VALUES
('Adhesive bandages box', 3.50, 500),
('Antiseptic wipes pack', 2.75, 350),
('Pain reliever bottle', 5.00, 250),
('Gauze pads box', 4.25, 300),
('Medical tape roll', 2.50, 400),
('Canned vegetables', 1.50, 1000),
('Rice 2lb bag', 3, 800),
('Pasta box', 2.25, 900),
('Bottled water pack', 4.00, 1200),
('Canned beans', 1.75, 950),
('Bar soap', 1.25, 600),
('Toothpaste tube', 2, 450),
('Toothbrush', 1.00, 500),
('Shampoo bottle', 3.5, 350),
('Hand towel', 4.00, 400);

-- Insert data into package_contents
INSERT INTO package_contents (itemId, packageId, itemQuantity) VALUES
(1, 1, 10),
(2, 1, 5),
(3, 1, 2),
(4, 1, 8),
(1, 2, 12),
(2, 2, 6),
(3, 2, 2),
(5, 2, 3),
(1, 3, 10),
(3, 3, 2),
(4, 3, 8),
(2, 4, 8),
(4, 4, 10),
(1, 5, 15),
(5, 5, 5),
(6, 6, 6),
(7, 6, 2),
(8, 6, 3),
(9, 6, 12),
(6, 7, 5),
(7, 7, 2),
(9, 7, 12),
(10, 7, 4),
(7, 8, 3),
(8, 8, 4),
(9, 8, 10),
(6, 9, 8),
(10, 9, 6),
(11, 10, 3),
(12, 10, 2),
(13, 10, 2),
(14, 10, 1),
(11, 11, 3),
(12, 11, 2),
(13, 11, 2),
(14, 11, 1),
(15, 11, 1),
(11, 12, 4),
(13, 12, 4),
(15, 12, 2),
(6, 13, 6),
(7, 13, 2),
(8, 13, 3),
(9, 13, 10),
(6, 14, 7),
(10, 14, 5),
(1, 15, 8),
(2, 15, 4),
(3, 15, 2),
(4, 15, 6);

-- End of SQL dump
