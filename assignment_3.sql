create table [User]
 (UserID INT identity PRIMARY KEY,
 Name VARCHAR(255),
 Email VARCHAR(255) UNIQUE,
 Password VARCHAR(255),
 ContactNumber VARCHAR(20),
 Address TEXT
)

create table Courier
 (CourierID INT identity PRIMARY KEY,
 SenderName VARCHAR(255),
 SenderAddress TEXT,
 ReceiverName VARCHAR(255),
 ReceiverAddress TEXT,
 Weight DECIMAL(5, 2),
 Status VARCHAR(50),
 TrackingNumber VARCHAR(20) UNIQUE,
 DeliveryDate DATE);

 create table CourierServices
(ServiceID INT identity PRIMARY KEY,
 ServiceName VARCHAR(100),
 Cost DECIMAL(8, 2));

 create table Employee 
 (EmployeeID INT identity PRIMARY KEY,
 Name VARCHAR(255),
 Email VARCHAR(255) UNIQUE,
 ContactNumber VARCHAR(20),
 Role VARCHAR(50),
 Salary DECIMAL(10, 2)); create table Location 
(LocationID INT identity PRIMARY KEY,
 LocationName VARCHAR(100),
 Address TEXT);

 create table Payments 
 (PaymentID INT identity PRIMARY KEY,
 CourierID INT,
 LocationId INT,
 Amount DECIMAL(10, 2),
 PaymentDate DATE,
 FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
 FOREIGN KEY (LocationID) REFERENCES Location(LocationID));

insert into [User] (Name, Email, Password, ContactNumber, Address) values
('Rajesh Kumar', 'sharma23@gmail.com', 'password123', '9876543210', 'Delhi, Delhi'),
('Priya Sharma', 'priya@gmail.com', 'securepass', '8765432109', 'Mumbai, Maharashtra'),
('Amit Patel', 'amit@gmail.com', 'pass123', '7654321098', 'Ahmedabad, Gujarat'),
('Sonia Singh', 'sonia@gmail.com', 'userpass', '6543210987', 'Jaipur, Rajasthan'),
('Vijay Verma', 'vijay@gmail.com', 'mypassword', '5432109876', 'Chennai, Tamil Nadu'),
('Ananya Das', 'ananya@gmail.com', 'anypass', '4321098765', 'Kolkata, West Bengal'),
('Rajat Bansal', 'rajat@gmail.com', 'secure123', '3210987654', 'Bangalore, Karnataka'),
('Neha Reddy', 'neha@gmail.com', 'nehapass', '2109876543', 'Hyderabad, Telangana'),
('Sandeep Mishra', 'sandeep@gmail.com', 'pass456', '1098765432', 'Pune, Maharashtra'),
('Pooja Gupta', 'pooja@gmail.com', 'poojapass', '9876543211', 'Lucknow, Uttar Pradesh');

insert into Courier (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status,
TrackingNumber, DeliveryDate)values
('Amit Sharma', '12A, Main Street, Delhi', 'Raj Singh', '34B, Park Avenue, Mumbai', 2.5, 'In Transit', 'TRK123456', '2023-12-10'),
('Neha Verma', '45C, MG Road, Bangalore', 'Sonia Gupta', '78D, Green Park, Chennai', 5.25, 'Delivered', 'TRK789012', '2023-11-08'),
('Rajat Bansal', '56X, Ashok Nagar, Kolkata', 'Ananya Das', '90Y, Jubilee Hills, Hyderabad', 3.2, 'In Transit', 'TRK345678', '2023-12-4'),
('Pooja Mishra', '23E, MG Road, Pune', 'Vijay Verma', '67F, Whitefield, Bangalore', 4.25, 'In Transit', 'TRK901234', '2023-12-14'),
('Sandeep Gupta', '89P, Park Street, Mumbai', 'Priya Sharma', '45H, Hitech City, Hyderabad', 1.5, 'Delivered', 'TRK567890', '2023-11-07'),
('Ankit Kapoor', '34M, Lajpat Nagar, Delhi', 'Sonia Reddy', '12N, Banjara Hills, Hyderabad', 2.8, 'In Transit', 'TRK234567', '2023-12-10'),
('Priyanka Singh', '67R, Koramangala, Bangalore', 'Rahul Verma', '23S, Adyar, Chennai', 2.3, 'In Transit', 'TRK890123', '2023-12-04'),
('Rahul Bansal', '78Z, Salt Lake, Kolkata', 'Kavita Gupta', '56U, Malad, Mumbai', 1.0, 'Delivered', 'TRK456789', '2023-10-06'),
('Deepika Reddy', '12L, Jubilee Hills, Hyderabad', 'Amit Patel', '78W, Andheri, Mumbai', 3.5, 'In Transit', 'TRK123890', '2023-12-25'),
('Kunal Verma', '45Q, Gachibowli, Hyderabad', 'Nisha Kapoor', '67V, Kandivali, Mumbai', 7.0, 'In Transit', 'TRK789234', '2023-12-11');

insert into CourierServices (ServiceName, Cost) values
('Standard Delivery', 50.00),
('Express Delivery', 80.00),
('Overnight Delivery', 120.00),
('International Standard', 150.00),
('International Express', 200.00),
('Same Day Delivery', 100.00),
('Economy Shipping', 40.00),
('Two-Day Shipping', 60.00),
('Next Day Air', 90.00),
('Priority Mail', 70.00);

insert into Employee (Name, Email, ContactNumber, Role, Salary) values
('Anita Sharma', 'anita@gmail.com', '9876543210', 'Courier Handler', 50000.00),
('Raj Kumar', 'raj@gmail.com', '8765432109', 'Delivery Driver', 55000.00),
('Suman Kapoor', 'suman@gmail.com', '7654321098', 'Customer Service Representative', 48000.00),
('Vivek Singh', 'vivek@gmail.com', '6543210987', 'Courier Handler', 52000.00),
('Preeti Verma', 'preeti@gmail.com', '5432109876', 'Delivery Driver', 58000.00),
('Neha Gupta', 'neha@gmail.com', '4321098765', 'Customer Service Representative', 50000.00),
('Amit Patel', 'amit@gmail.com', '3210987654', 'Courier Handler', 51000.00),
('Kavita Reddy', 'kavita@gmail.com', '2109876543', 'Delivery Driver', 56000.00),
('Rahul Bansal', 'rahul@gmail.com', '1098765432', 'Customer Service Representative', 49000.00),
('Sonia Mishra', 'sonia@gmail.com', '9876543211', 'Courier Handler', 53000.00);

insert into Location (LocationName, Address) values
('Amit Electronics', '34A, Nehru Nagar, Delhi'),
('Sharma Enterprises', '67B, MG Road, Mumbai'),
('Green Heights', '12C, Satellite Colony, Bangalore'),
('Rajat Appartment', '45D, Park Street, Kolkata'),
('Verma Textiles', '23E, Jubilee Hills, Hyderabad'),
('Das Square', '56F, Lajpat Nagar, Delhi'),
('Gupta Hardware', '78G, Karol Bagh, Delhi'),
('Reddy Bakery', '90H, Kondapur, Hyderabad'),
('Patel Colony', '34I, Malad West, Mumbai'),
('Mishra Fashion', '67J, Koramangala, Bangalore');

insert into Payments (CourierID, LocationID, Amount, PaymentDate) values
(1, 1, 75.00, '2023-11-30'),
(2, 3, 45.00, '2023-11-08'),
(3, 5, 120.00, '2023-11-28'),
(4, 7, 50.00, '2023-12-14'),
(5, 9, 80.00, '2023-11-02'),
(6, 2, 90.00, '2023-12-10'),
(7, 4, 110.00, '2023-11-08'),
(8, 6, 48.00, '2023-10-06'),
(9, 8, 35.00, '2023-11-30'),
(10, 10, 85.00, '2023-12-05');

select * from [User]
select * from Courier
select * from CourierServices
select * from Employee
select * from Location
select * from Payments

alter table CourierServices add employee_Id int, foreign key(employee_Id) references Employee(EmployeeId)
on delete cascade;
update CourierServices set employee_Id=1 where ServiceId=1;
update CourierServices set employee_Id=3 where ServiceId=2;
update CourierServices set employee_Id=6 where ServiceId=3;
update CourierServices set employee_Id=2 where ServiceId=4;
update CourierServices set employee_Id=3 where ServiceId=5;
update CourierServices set employee_Id=8 where ServiceId=6;
update CourierServices set employee_Id=7 where ServiceId=7;
update CourierServices set employee_Id=4 where ServiceId=8;
update CourierServices set employee_Id=2 where ServiceId=9;
update CourierServices set employee_Id=1 where ServiceId=10;

create table orders(orderId int identity primary key,userId int,courierId int,courierServiceId int,
foreign key(userId) references [User](userId),foreign key(courierId) references courier(courierId),
foreign key(courierServiceId) references CourierServices(serviceID))

insert into orders values(1,1,2);
insert into orders values(2,3,2);
insert into orders values(3,4,3);
insert into orders values(5,2,1);
insert into orders values(4,5,4);
insert into orders values(2,2,6);
insert into orders values(9,5,8);
insert into orders values(1,9,7);
insert into orders values(3,5,9);
insert into orders values(6,2,4);
select * from orders



--1. List all customers:
select * from [User]

--2. List all orders for a specific customer:
select * from Courier where ReceiverName='Vijay Verma'

--3. List all couriers:
select * from Courier

--4. List all packages for a specific order:
select * from Courier where CourierID = 2;

--5. List all deliveries for a specific courier:
select * from Courier where CourierID = 2;

--6. List all undelivered packages:
Update Courier set Status='Undelivered' where CourierID=8
select * from Courier where Status='Undelivered'

--7. List all packages that are scheduled for delivery today:select * from Courier where DeliveryDate=convert(date,getdate())--8. List all packages with a specific status:
select * from Courier where Status='Delivered'

--9. Calculate the total number of packages for each courier.
select CourierServices.ServiceName, count(Orders.courierId) from CourierServices join orders on
orders.courierServiceId=CourierServices.ServiceID group by CourierServices.ServiceName

--10. Find the average delivery time for each courier


--11. List all packages with a specific weight range:
select * from Courier where Weight between 3 and 6

--12. Retrieve employees whose names contain 'John'
Update Employee set Name='John Sharma' where EmployeeID=1
select * from Employee where name like 'John%'

--13. Retrieve all courier records with payments greater than $50select * from Courier where CourierID in (select Payments.CourierID from Payments where Payments.Amount<50)--14. Find the total number of couriers handled by each employee.
select Employee.Name, count(CourierServices.employee_Id) from Employee join CourierServices on 
Employee.EmployeeID=CourierServices.employee_Id group by Employee.Name

--15. Calculate the total revenue generated by each location
select LocationID,(select Location.LocationName from location where Location.LocationID=Payments.LocationId)
, sum(Amount) as TotalRevenue from Payments group by LocationID;


--16. Find the total number of couriers delivered to each location.
select Location.LocationName, count(Courier.CourierID)as total_courier from Location join Payments on 
Location.LocationID=Payments.LocationId join Courier on Courier.CourierID=Payments.PaymentID 
group by Location.LocationName

--17. Find the courier with the highest average delivery time:


--18. Find Locations with Total Payments Less Than a Certain Amount
select * from Location,Payments where Location.LocationID=Payments.LocationId and Payments.Amount<50

--19. Calculate Total Payments per Location
select Location.LocationName, Amount from Payments join Location on Location.LocationID=Payments.LocationId ;

--20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X):
update Payments set Amount=1050 where LocationId=5

select * from Courier join Payments on Courier.CourierID=Payments.CourierID join Location on 
Location.LocationID=Payments.LocationId where Payments.Amount>1000 and Location.LocationName='Verma Textiles';


--21. Retrieve couriers who have received payments totaling more than $1000 after a certain 
--date (PaymentDate > 'YYYY-MM-DD'):
select * from Courier join Payments on Payments.CourierID=Courier.CourierID where Payments.Amount>1000
and Payments.PaymentDate>'2023-10-28'

--22. Retrieve locations where the total amount received is more than $5000 before a certain 
--date (PaymentDate > 'YYYY-MM-DD')
update Payments set Amount=5500 where LocationId=7

select * from Location join Payments on Payments.LocationId=Location.LocationID where Payments.Amount>5000
and Payments.PaymentDate>'2023-10-28'


--23. Retrieve Payments with Courier Information
select * from Courier join Payments on Courier.CourierID=Payments.CourierID

--24. Retrieve Payments with Location Information
select * from Location join Payments on Location.LocationID=Payments.LocationId

--25. Retrieve Payments with Courier and Location Information
select * from Courier join Payments on Courier.CourierID=Payments.CourierID join Location on 
Payments.LocationId=Location.LocationID

--26. List all payments with courier details
select * from Courier join Payments on Courier.CourierID=Payments.CourierID

--27. Total payments received for each courier
select * from Courier join Payments on Courier.CourierID=Payments.CourierID

--28. List payments made on a specific date
select * from Payments where PaymentDate = '2023-11-28'

--29. Get Courier Information for Each Payment
select * from Courier join Payments on Courier.CourierID=Payments.CourierID

--30. Get Payment Details with Location
select * from Courier join Payments on Courier.CourierID=Payments.CourierID join Location on 
Payments.LocationId=Location.LocationID

--31. Calculating Total Payments for Each Courier
select * from Courier join Payments on Courier.CourierID=Payments.CourierID

--32. List Payments Within a Date Range
select * from Payments where PaymentDate between '2023-11-15' and '2023-12-10' 

--33. Retrieve a list of all users and their corresponding courier records, including cases 
--where there are no matches on either side
select [User].*, Courier.* from [User] join orders on [User].userId=orders.userId join
Courier on orders.courierId=Courier.CourierID

--34. Retrieve a list of all couriers and their corresponding services, including cases where 
--there are no matches on either side
select Courier.*, CourierServices.* from Courier join orders on Courier.CourierID=orders.courierId join
CourierServices on orders.courierServiceId=CourierServices.ServiceID

--35. Retrieve a list of all employees and their corresponding payments, including cases 
--where there are no matches on either side
select Employee.Name, Payments.* from employee join CourierServices on Employee.EmployeeID=CourierServices.employee_Id
join orders on CourierServices.ServiceID=orders.courierServiceId join Courier on Courier.CourierID=
orders.courierId join Payments on Courier.CourierID=Payments.CourierID

--36. List all users and all courier services, showing all possible combinations.
select [User].*, CourierServices.* from [User] join orders on [User].UserID=orders.userId join
CourierServices on CourierServices.ServiceID=orders.courierServiceId

--37. List all employees and all locations, showing all possible combinations:
select Employee.Name, Location.LocationName from Employee join CourierServices on 
Employee.EmployeeID=CourierServices.employee_Id join orders on CourierServices.ServiceID=orders.courierServiceId
join Courier on Courier.CourierID=orders.courierId join Payments on Payments.CourierID=Courier.CourierID
join Location on Location.LocationID=Payments.LocationId

--38. Retrieve a list of couriers and their corresponding sender information (if available)
select CourierID,SenderName,SenderAddress from Courier;

--39. Retrieve a list of couriers and their corresponding receiver information (if available):
select CourierID,ReceiverName,ReceiverAddress from Courier;

--40. Retrieve a list of couriers along with the courier service details (if available):
select Courier.*,CourierServices.* from Courier join orders on Courier.CourierID=orders.courierId
join CourierServices on CourierServices.ServiceID=orders.courierServiceId

--41. Retrieve a list of employees and the number of couriers assigned to each employee:
select Employee.Name, count(CourierServices.employee_Id) from Employee join CourierServices on 
Employee.EmployeeID=CourierServices.employee_Id group by Employee.Name

--42. Retrieve a list of locations and the total payment amount received at each location:
select Location.*, Payments.Amount from Location join Payments on Location.LocationID=Payments.LocationId

--43. Retrieve all couriers sent by the same sender (based on SenderName).
update Courier set SenderName='Rahul Bansal', SenderAddress='78Z, Salt Lake, Kolkata' where CourierID=3

select * from Courier where SenderName in (select SenderName from Courier group by 
SenderName having count(SenderName)>1)

--44. List all employees who share the same role.
select * from Employee where Role='Delivery Driver'

--45. Retrieve all payments made for couriers sent from the same location.
select * from Courier where cast(SenderAddress as varchar) in 
(select cast(SenderAddress as varchar) from Courier group by cast(SenderAddress as varchar) having 
count(cast(SenderAddress as varchar))>1)

--46. Retrieve all couriers sent from the same location (based on SenderAddress).
select * from Courier where cast(SenderAddress as varchar) in 
(select cast(SenderAddress as varchar) from Courier group by cast(SenderAddress as varchar) having 
count(cast(SenderAddress as varchar))>1)

--47. List employees and the number of couriers they have delivered:
select Employee.Name, count(CourierServices.employee_Id) from Employee join CourierServices on 
Employee.EmployeeID=CourierServices.employee_Id group by Employee.Name

--48. Find couriers that were paid an amount greater than the cost of their respective courier services


--49. Find couriers that have a weight greater than the average weight of all couriers
select * from Courier where Weight>(select avg(Weight) from Courier)

--50. Find the names of all employees who have a salary greater than the average salary
select Name from Employee where Salary>(select avg(salary) from Employee);

--51. Find the total cost of all courier services where the cost is less than the maximum cost
select sum(Cost) from CourierServices where Cost < (select max(Cost) from CourierServices);

--52. Find all couriers that have been paid for
select Courier.* from Courier join Payments on Courier.CourierID = Payments.CourierID;

--53. Find the locations where the maximum payment amount was made
select Location.* from Location join Payments on Location.LocationID=Payments.LocationId where
Payments.Amount=(select max(amount) from Payments)

--54.  Find all couriers whose weight is greater than the weight of all couriers sent by a 
--specific sender (e.g., 'SenderName'):
select top 1 Courier.* from Courier where SenderName='Rahul Bansal' order by Weight desc

