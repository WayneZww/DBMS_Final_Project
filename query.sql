--(a) Present a report listing the Manager’s name and telephone number for each hall of residence.
SELECT staff_name AS StaffName, staff.phone 
FROM staff INNER join domitory 
ON staff.staff_id = domitory.staff_id AND dom_category='Hall';
-- right

--(b) Present a report listing the names and matriculation numbers of students with the details of their lease agreements. 
SELECT stu_name AS StudentName, leases.stu_id AS StudentID, 
leases.lease_num AS LeaseNumber, leases.dur_time AS DurationTime, 
leases.place_num AS PlaceNumber, leases.room_num AS RoomNumber, 
leases.dateFrom AS DateFrom, leases.dateTo AS DateTo
FROM student INNER JOIN leases 
ON Student.stu_id = leases.stu_id ;
--right

--(c) Display the details of lease agreements that include the Summer Semester. 
SELECT * FROM leases
WHERE dur_time LIKE '%3';
--right

--(d) Display the details of the total rent paid by a given student.
SELECT student.stu_id, stu_name, invoice.payment
FROM student natural JOIN  leases natural join invoice
where student.stu_id = '2015001001';
--right

--(e) Present a report on students that have not paid their invoices by a given date. 
SELECT stu_id AS ID, stu_name AS name, invoice.payment, invoice.payment_due
FROM student natural JOIN  leases natural join invoice
WHERE payment_due < current_date;
SELECT stu_id AS ID, stu_name AS name, invoice.payment, invoice.payment_due
FROM student natural JOIN  leases natural join invoice
WHERE payment_due < '2017-06-22';
--right

--(f) Display the details of ﬂat inspections where the property was found to be in an unsatisfactory condition. 
SELECT * FROM flat_inspection
WHERE satisfactory = 'no';
--right

--(g) Present a report of the names and matriculation numbers of students with their room number and place number in a particular hall of residence. 
SELECT stu_name AS StudentName, student.stu_id AS MatriculationNumbers, 
leases.room_num AS RoomNumber
FROM student INNER JOIN leases 
ON Student.stu_id = leases.stu_id AND leases.room_num LIKE 'SH%';
--right

--(h) Present a report listing the details of all students currently on the waiting list for accommodation, that is, not placed. 
SELECT * FROM student
WHERE condition = 'waiting';
--right

--(i) Display the total number of students in each student category.
SELECT stu_category,
count(stu_id) FROM student GROUP BY stu_category;
--right

--(j) Present a report of the names and matriculation numbers for all students who have not supplied details of their next-of-kin. 
SELECT student.stu_id AS ID, stu_name AS Name
FROM student WHERE NOT EXISTS(SELECT stu_id FROM relative WHERE stu_id = student.stu_id);
--right

--(k) Display the name and internal telephone number of the Advisor of Studies for a particular student. 
SELECT Advisor.advisor_name AS AdvisorName, intern_phone AS InternPhone,
Student.stu_name AS StudentName
FROM Advisor INNER join Student 
ON Advisor.advisor_name = student.advisor_name;
--right

--(l) Display the minimum, maximum, and average monthly rent for rooms in halls of residence. 
SELECT max(to_number(month_rent,'99G999D9S')), min(to_number(month_rent,'99G999D9S')), avg(to_number(month_rent,'99G999D9S'))
FROM room WHERE room_num LIKE 'SH%';
--right

--(m) Display the total number of places in each hall of residence. 
SELECT room_num,
count(place_num) FROM room GROUP BY room_num;
--right

--(n) Display the staff number, name, age, and current location of all members of the accommodation staff who are over 60 years old today.
SELECT staff_id AS StaffNumber, staff_name AS StaffName, 
EXTRACT(year from age(current_date,birthday)) AS age, address_street AS street, address_city AS city
FROM staff
WHERE EXTRACT(year from age(current_date,birthday)) >60;
--right


            <td>
                <%
                    out.print(rs.getString(1));
                %>
            </td>
            <td>
                <%
                    out.print(rs.getString(2));
                %>
            </td>
            <td>
                <%
                    out.print(rs.getString(3));
                %>
            </td>
            <td>
                <%
                    out.print(rs.getString(4));
                %>
            </td>
            <td>
                <%
                    out.print(rs.getString(5));
                %>
            </td>