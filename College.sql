CREATE DATABASE CollegeDB

CREATE TABLE Advisor (
    advisor_name VARCHAR(12) NOT NULL,
    position VARCHAR(15) NOT NULL,
    depar_name VARCHAR(15) , 
    intern_phone VARCHAR(15), 
    room_num VARCHAR(8)
);

CREATE TABLE Student (
    stu_id VARCHAR(9) PRIMARY KEY UNIQUE NOT NULL,
    stu_name VARCHAR(12) NOT NULL,
    stu_category VARCHAR(15) NOT NULL,
    stu_sex VARCHAR(2) NOT NULL,
    birthday date NOT NULL,
    phone VARCHAR(15),
    postcode VARCHAR(6),
    address_street VARCHAR(100),
    address_city VARCHAR(100),
    email VARCHAR(20) NOT NULL,
    nationality VARCHAR(20),
    smoker VARCHAR(4), 
    special_need VARCHAR(200),
    condition VARCHAR(10),
    course VARCHAR(20),
    advisor_name VARCHAR(12) NOT NULL
);

ALTER TABLE Student ADD CONSTRAINT stu_check_stu_category CHECK (stu_category in ('1st year undergraduate', '2nd year undergraduate','3rd year undergraduate',
'4th year undergraduate','graduate','postgraduate'));
ALTER TABLE Student ADD CONSTRAINT stu_check_smoker CHECK (smoker in ('yes', 'no'));
ALTER TABLE Student ADD CONSTRAINT stu_check_condition CHECK (condition in ('arranged', 'waiting'));

CREATE TABLE Staff (
    staff_id VARCHAR(9) PRIMARY KEY UNIQUE NOT NULL,
    staff_name VARCHAR(12) NOT NULL,
    staff_category VARCHAR(15) NOT NULL,
    staff_sex VARCHAR(2) NOT NULL,
    birthday date NOT NULL,
    phone VARCHAR(15),
    postcode VARCHAR(6),
    address_street VARCHAR(100),
    address_city VARCHAR(100),
    email VARCHAR(20) NOT NULL
);
ALTER TABLE Staff ADD CONSTRAINT staff_check_staff_category CHECK(staff_category in ('Hall Manager', 'Administrative Assistant', 'Cleaner'));

CREATE TABLE Hall (
    hall_name VARCHAR(12) NOT NULL PRIMARY KEY,
    domitory_num VARCHAR(12) NOT NULL PRIMARY KEY,
    phone VARCHAR(15),
    address VARCHAR(100) NOT NULL,
    manager_name VARCHAR(12) NOT NULL
);

CREATE TABLE SingleRoome (
    hall_name VARCHAR(12) NOT NULL,
    room_num VARCHAR(8),
    place_num VARCHAR(8),
    month_rent VARCHAR(4),
    condition VARCHAR(10),
);
ALTER TABLE SingleRoom ADD CONSTRAINT SingleRoom_check_condition CHECK(condition in ('used', 'unused'));

CREATE TABLE Flat (
    domitory_num VARCHAR(12) NOT NULL PRIMARY KEY,
    flat_name VARCHAR(12) NOT NULL PRIMARY KEY,
    address VARCHAR(100) NOT NULL,
    staff_name VARCHAR(12) NOT NULL,
    avalible_bedroom VARCHAR(1) NOT NULL
);

CREATE TABLE BedRoom (
    room_num VARCHAR(8),
    place_num VARCHAR(8),
    month_rent VARCHAR(4),
    condition VARCHAR(10),
);
ALTER TABLE BedRoom ADD CONSTRAINT BedRoom_check_condition CHECK(condition in ('used', 'unused'));

CREATE TABLE Leases (
    lease_num VARCHAR(15) NOT NULL PRIMARY KEY,
    dur_time VARCHAR(12) NOT NULL,
    stu_name VARCHAR(12) NOT NULL,
    matriculation_num VARCHAR(9) NOT NULL,
    place_num VARCHAR(8),
    room_num VARCHAR(8),
    address VARCHAR(100) NOT NULL,
    dateFrom DATE,
    dateTo DATE
);

CREATE TABLE Invoice (
    Invoice_num VARCHAR(20) NOT NULL PRIMARY KEY,
    lease_num VARCHAR(15)  NOT NULL,
    semester VARCHAR(12),
    payment_due DATE,
    stu_name VARCHAR(12) NOT NULL,
    stu_id VARCHAR(9) NOT NULL,
    place_num VARCHAR(8),
    room_num VARCHAR(8),
    address VARCHAR(100),
    payment VARCHAR(8), 
    pay_date DATE, 
    pay_method varchar(10)
);
ALTER TABLE Invoice ADD CONSTRAINT invoice_check_pay_method CHECK (pay_method in ('cheque', 'cash', 'Visa'));

CREATE TABLE Course(
   course_id VARCHAR(6) PRIMARY KEY NOT NULL,
   course_name VARCHAR(20) NOT NULL,
   director VARCHAR(4),
   intern_phone VARCHAR(9),
   email VARCHAR(20) NOT NULL,
   room_num VARCHAR(8)
 );

CREATE TABLE Flat_Inspection (
    staff_name VARCHAR(12) NOT NULL,
    FOREIGN KEY(staff_name) REFERENCES Staff,
    ins_date DATE,
    satisfactory VARCHAR(5),
    comments VARCHAR(200),
);
ALTER TABLE Flat_Inspection ADD CONSTRAINT inspec_check_satisfactory CHECK(satisfactory in ('yes', 'no'));

CREATE TABLE Relative (
    rel_name VARCHAR(12) PRIMARY KEY UNIQUE NOT NULL,
    stu_id VARCHAR(9) NOT NULL,
    stu_name VARCHAR(12) NOT NULL,
    relationship VARCHAR(12),
    postcode VARCHAR(6),
    address_street VARCHAR(100),
    address_city VARCHAR(100),
    phone VARCHAR(15) NOT NULL
);









