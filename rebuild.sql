CREATE TABLE Room (
    dom_name VARCHAR(12) NOT NULL,
    room_num VARCHAR(8) NOT NULL,
    place_num VARCHAR(8),
    month_rent VARCHAR(4),
    condition VARCHAR(10)
);
ALTER TABLE Room ADD CONSTRAINT Room_check_condition CHECK(condition in ('used', 'unused'));

CREATE TABLE Leases (
    lease_num VARCHAR(15) PRIMARY KEY UNIQUE NOT NULL,
    dur_time VARCHAR(30) NOT NULL,
    stu_id VARCHAR(10) NOT NULL,
    place_num VARCHAR(8),
    room_num VARCHAR(8),
    dateFrom DATE,
    dateTo DATE
);

CREATE TABLE Flat_Inspection (
    staff_id VARCHAR(12) NOT NULL,
    ins_date DATE,
    satisfactory VARCHAR(5),
    comments VARCHAR(200),
    dom_name VARCHAR(15)
);
ALTER TABLE Flat_Inspection ADD CONSTRAINT inspec_check_satisfactory CHECK(satisfactory in ('yes', 'no'));

CREATE TABLE Relative (
    rel_name VARCHAR(12) PRIMARY KEY UNIQUE NOT NULL,
    stu_id VARCHAR(10) NOT NULL,
    relationship VARCHAR(12),
    postcode VARCHAR(6),
    address_street VARCHAR(100),
    address_city VARCHAR(100),
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE Account (
   staff_id VARCHAR(9) NOT NULL,
   password VARCHAR(20) NOT NULL
);










