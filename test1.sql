USE [Info PVT(LTD)] ;

-- Driver Table
CREATE TABLE Driver (
    DriverID VARCHAR(10) PRIMARY KEY,  
    Name VARCHAR(100),
    NIC VARCHAR(12) UNIQUE,
    PhoneNumber VARCHAR(15),
    VehicleTagNumber VARCHAR(15) UNIQUE
);

-- Vehicle Table
CREATE TABLE Vehicle (
    VehicleTagNumber VARCHAR(15) PRIMARY KEY,
    VehicleType VARCHAR(50),
    VehicleColor VARCHAR(30),
    DriverID VARCHAR(10),  
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID)
);

-- User Table
CREATE TABLE [User] (
    UserID VARCHAR(10) PRIMARY KEY,  
    Name VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    UserName VARCHAR(50) UNIQUE,
    Address VARCHAR(255),
    Password VARCHAR(100)
);

-- Ride Table
CREATE TABLE Ride (
    RideID VARCHAR(10) PRIMARY KEY,  
    DriverID VARCHAR(10),
    UserID VARCHAR(10),
    PickupLocation VARCHAR(100),
    DropLocation VARCHAR(100),
    RideDate DATETIME,
    VehicleType VARCHAR(50),
    RideStatus VARCHAR(20),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

-- Payment Table
CREATE TABLE Payment (
    PaymentID VARCHAR(10) PRIMARY KEY,  
    RideID VARCHAR(10),
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentType VARCHAR(20), 
    FOREIGN KEY (RideID) REFERENCES Ride(RideID)
);

-- Review Table
CREATE TABLE Review (
    ReviewID VARCHAR(10) PRIMARY KEY,
	RideID VARCHAR(10),
    DriverID VARCHAR(10),
    UserID VARCHAR(10),
    StarRating INT CHECK (StarRating BETWEEN 1 AND 5),
    ReviewDescription TEXT,
    FOREIGN KEY (RideID) REFERENCES Ride(RideID),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);


--Data for Driver Table

INSERT INTO Driver (DriverID, Name, NIC, PhoneNumber, VehicleTagNumber) VALUES
('D1', 'Kamal Perera', '960123456V', '0712345678', 'ABC-1234'),
('D2', 'Saman Kumara', '950234567V', '0723456789', 'DEF-5678'),
('D3', 'Nimali Fernando', '960345678V', '0734567890', 'GHI-9012'),
('D4', 'Priyantha Silva', '950456789V', '0745678901', 'JKL-3456'),
('D5', 'Anusha Bandara', '960567890V', '0756789012', 'MNO-7890'),
('D6', 'Sunil Rajapaksha', '950678901V', '0767890123', 'PQR-1235'),
('D7', 'Tharindu Wijesinghe', '960789012V', '0778901234', 'STU-5679'),
('D8', 'Chamari Perera', '950890123V', '0789012345', 'VWX-9013'),
('D9', 'Ruwan Dissanayake', '960901234V', '0790123456', 'YZA-2345'),
('D10', 'Ishara Gamage', '950012345V', '0701234567', 'BCD-6789'),
('D11', 'Buddhika Senanayake', '960123457V', '0712345679', 'EFG-0123'),
('D12', 'Kavindi Rathnayake', '950234568V', '0723456790', 'HIJ-4567'),
('D13', 'Sahan Jayasinghe', '960345679V', '0734567901', 'KLM-8901'),
('D14', 'Lakshitha Abeysinghe', '950456780V', '0745678012', 'NOP-2345'),
('D15', 'Dilini Perera', '960567891V', '0756789123', 'QRS-6789');

--data for vehicle Table

INSERT INTO Vehicle VALUES 
('ABC-1234', 'Sedan', 'Black', 'D1'),
('DEF-5678', 'SUV', 'White', 'D2'),
('GHI-9012', 'Hatchback', 'Red', 'D3'),
('JKL-3456', 'Coupe', 'Blue', 'D4'),
('MNO-7890', 'Convertible', 'Green', 'D5'),
('PQR-1235', 'Wagon', 'Yellow', 'D6'),
('STU-5679', 'Pickup', 'Silver', 'D7'),
('VWX-9013', 'Minivan', 'Purple', 'D8'),
('YZA-2345', 'Crossover', 'Orange', 'D9'),
('BCD-6789', 'Sports Car', 'Pink', 'D10'),
('EFG-0123', 'Truck', 'Brown', 'D11'),
('HIJ-4567', 'Roadster', 'Grey', 'D12'),
('KLM-8901', 'Luxury Sedan', 'Gold', 'D13'),
('NDP-2345' , 'Minivan' , 'Black' , 'D14'),
('QRS-6789' , 'van' , 'Black' , 'D14');


-- Data for User table

INSERT INTO [User] (UserID, Name, PhoneNumber, Email, UserName, Address, Password) VALUES
('U1', 'Aravinda De Silva', '0712345678', 'aravinda.desilva@example.com', 'aravinda123', 'Colombo, Sri Lanka', 'password1'),
('U2', 'Kavitha Rajapaksha', '0723456789', 'kavitha.rajapaksha@example.com', 'kavitha123', 'Kandy, Sri Lanka', 'password2'),
('U3', 'Pradeep Weerasinghe', '0734567890', 'pradeep.weerasinghe@example.com', 'pradeep123', 'Galle, Sri Lanka', 'password3'),
('U4', 'Ruwani Fernando', '0745678901', 'ruwani.fernando@example.com', 'ruwani123', 'Negombo, Sri Lanka', 'password4'),
('U5', 'Sashika Perera', '0756789012', 'sashika.perera@example.com', 'sashika123', 'Matara, Sri Lanka', 'password5'),
('U6', 'Dilhan Jayawardena', '0767890123', 'dilhan.jayawardena@example.com', 'dilhan123', 'Jaffna, Sri Lanka', 'password6'),
('U7', 'Manori Niroshani', '0778901234', 'manori.niroshani@example.com', 'manori123', 'Colombo, Sri Lanka', 'password7'),
('U8', 'Chathurika Seneviratne', '0789012345', 'chathurika.seneviratne@example.com', 'chathurika123', 'Kandy, Sri Lanka', 'password8'),
('U9', 'Anjula Liyanage', '0790123456', 'anjula.liyanage@example.com', 'anjula123', 'Galle, Sri Lanka', 'password9'),
('U10', 'Shanika Rathnayake', '0701234567', 'shanika.rathnayake@example.com', 'shanika123', 'Negombo, Sri Lanka', 'password10'),
('U11', 'Vishantha Perera', '0712345679', 'vishantha.perera@example.com', 'vishantha123', 'Matara, Sri Lanka', 'password11'),
('U12', 'Nadeesha Gunawardena', '0723456790', 'nadeesha.gunawardena@example.com', 'nadeesha123', 'Jaffna, Sri Lanka', 'password12'),
('U13', 'Nimesh Perera', '0734567901', 'nimesh.perera@example.com', 'nimesh123', 'Colombo, Sri Lanka', 'password13'),
('U14', 'Ranjani Silva', '0745678012', 'ranjani.silva@example.com', 'ranjani123', 'Kandy, Sri Lanka', 'password14'),
('U15', 'Janaka Fernando', '0756789123', 'janaka.fernando@example.com', 'janaka123', 'Galle, Sri Lanka', 'password15');


--Ride Table data

INSERT INTO Ride (RideID, DriverID, UserID, PickupLocation, DropLocation, RideDate, VehicleType, RideStatus) VALUES
('R1', 'D1', 'U1', 'Colombo', 'Kandy', '2025-03-21 08:00:00', 'Sedan', 'Completed'),
('R2', 'D2', 'U2', 'Galle', 'Matara', '2025-03-21 09:15:00', 'SUV', 'Completed'),
('R3', 'D3', 'U3', 'Negombo', 'Colombo', '2025-03-21 10:30:00', 'Hatchback', 'Cancelled'),
('R4', 'D4', 'U4', 'Kandy', 'Galle', '2025-03-21 11:00:00', 'Convertible', 'In Progress'),
('R5', 'D5', 'U5', 'Colombo', 'Negombo', '2025-03-21 12:00:00', 'Wagon', 'Completed'),
('R6', 'D6', 'U6', 'Jaffna', 'Colombo', '2025-03-21 13:30:00', 'Pickup', 'Completed'),
('R7', 'D7', 'U7', 'Matara', 'Galle', '2025-03-21 14:15:00', 'Minivan', 'In Progress'),
('R8', 'D8', 'U8', 'Kandy', 'Jaffna', '2025-03-21 15:00:00', 'Crossover', 'Pending'),
('R9', 'D9', 'U9', 'Galle', 'Matara', '2025-03-21 16:30:00', 'Sports Car', 'Completed'),
('R10', 'D10', 'U10', 'Negombo', 'Colombo', '2025-03-21 17:00:00', 'Truck', 'Cancelled'),
('R11', 'D11', 'U11', 'Kandy', 'Galle', '2025-03-21 18:15:00', 'Roadster', 'In Progress'),
('R12', 'D12', 'U12', 'Jaffna', 'Colombo', '2025-03-21 19:00:00', 'Luxury Sedan', 'Pending'),
('R13', 'D13', 'U13', 'Colombo', 'Matara', '2025-03-21 20:30:00', 'Sedan', 'Completed'),
('R14', 'D14', 'U14', 'Galle', 'Negombo', '2025-03-21 21:00:00', 'SUV', 'In Progress'),
('R15', 'D15', 'U15', 'Kandy', 'Colombo', '2025-03-21 22:00:00', 'Convertible', 'Completed');


--Payment data

INSERT INTO Payment (PaymentID, RideID, Amount, PaymentDate, PaymentType) VALUES
('PAY1', 'R1', 1500.00, '2025-03-21', 'Cash'),
('PAY2', 'R2', 2000.00, '2025-03-21', 'Card'),
('PAY3', 'R3', 1200.00, '2025-03-21', 'Cash'),
('PAY4', 'R4', 3000.00, '2025-03-21', 'Points'),
('PAY5', 'R5', 1800.00, '2025-03-21', 'Card'),
('PAY6', 'R6', 2500.00, '2025-03-21', 'Cash'),
('PAY7', 'R7', 2200.00, '2025-03-21', 'Card'),
('PAY8', 'R8', 3500.00, '2025-03-21', 'Points'),
('PAY9', 'R9', 4000.00, '2025-03-21', 'Cash'),
('PAY10', 'R10', 1600.00, '2025-03-21', 'Card'),
('PAY11', 'R11', 2700.00, '2025-03-21', 'Cash'),
('PAY12', 'R12', 3100.00, '2025-03-21', 'Card'),
('PAY13', 'R13', 1900.00, '2025-03-21', 'Points'),
('PAY14', 'R14', 2300.00, '2025-03-21', 'Cash'),
('PAY15', 'R15', 2800.00, '2025-03-21', 'Card');


-- Review Data

INSERT INTO Review (ReviewID, RideID, DriverID, UserID, StarRating, ReviewDescription) VALUES
('REV1', 'R1', 'D1', 'U1', 5, 'Excellent ride, smooth and comfortable. Highly recommended!'),
('REV2', 'R2', 'D2', 'U2', 4, 'Good ride, but the car could have been cleaner.'),
('REV3', 'R3', 'D3', 'U3', 3, 'Average experience, but the driver was friendly.'),
('REV4', 'R4', 'D4', 'U4', 2, 'The ride was delayed, and the driver was not very polite.'),
('REV5', 'R5', 'D5', 'U5', 5, 'Great ride, perfect timing, and a very friendly driver!'),
('REV6', 'R6', 'D6', 'U6', 4, 'The ride was comfortable, but the route was a bit longer than expected.'),
('REV7', 'R7', 'D7', 'U7', 5, 'Amazing experience! The driver was on time and the car was clean.'),
('REV8', 'R8', 'D8', 'U8', 3, 'Decent ride, but the driver could have been more engaging.'),
('REV9', 'R9', 'D9', 'U9', 1, 'The ride was uncomfortable and the driver seemed distracted.'),
('REV10', 'R10', 'D10', 'U10', 4, 'Good ride overall, but the air conditioning was a bit too cold.'),
('REV11', 'R11', 'D11', 'U11', 5, 'I had a wonderful ride! Driver was very courteous and professional.'),
('REV12', 'R12', 'D12', 'U12', 3, 'The car was a little old, but the driver was kind.'),
('REV13', 'R13', 'D13', 'U13', 4, 'Nice ride, but the music selection was a bit off for my taste.'),
('REV14', 'R14', 'D14', 'U14', 2, 'The driver was late, and the ride was uncomfortable due to traffic.'),
('REV15', 'R15', 'D15', 'U15', 5, 'Fantastic! The driver was punctual and the vehicle was very clean.');

SELECT * FROM Payment;

