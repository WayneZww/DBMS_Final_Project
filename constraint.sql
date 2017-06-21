ALTER TABLE Student ADD FOREIGN KEY(advisor_name) REFERENCES Advisor(advisor_name);

ALTER TABLE Relative ADD FOREIGN KEY(stu_id) REFERENCES Student(stu_id);

ALTER TABLE Room ADD FOREIGN KEY(dom_name) REFERENCES Domitory(dom_name);

ALTER TABLE Domitory ADD FOREIGN KEY(staff_id) REFERENCES Staff(staff_id);

ALTER TABLE flat_inspection ADD FOREIGN KEY(staff_id) REFERENCES Staff(staff_id);

ALTER TABLE account ADD FOREIGN KEY(staff_id) REFERENCES Staff(staff_id);

ALTER TABLE Leases ADD FOREIGN KEY(stu_id) REFERENCES Student(stu_id);

ALTER TABLE Invoice ADD FOREIGN KEY(lease_num) REFERENCES  Leases(lease_num);







