ALTER TABLE Studnet ADD FOREIGN KEY(advisor_name) REFERENCES Advisor(advisor_name);

ALTER TABLE SingleRoome ADD FOREIGN KEY(hall_name) REFERENCES Hall(hall_name);

ALTER TABLE Leases ADD FOREIGN KEY(stu_name) REFERENCES Student(stu_name);

ALTER TABLE Invoice ADD FOREIGN KEY(stu_name) REFERENCES Student(stu_name);
ALTER TABLE Invoice ADD FOREIGN KEY(stu_id) REFERENCES Student(stu_id);

ALTER TABLE Relative ADD FOREIGN KEY(stu_id) REFERENCES Student(stu_id);
ALTER TABLE Relative ADD FOREIGN KEY(stu_name) REFERENCES Student(stu_name);
