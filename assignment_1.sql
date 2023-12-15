-- creating CUSTOMERS table
create table CUSTOMERS(CustomerID int not null identity(1,1) primary key, FirstName varchar(30),LastName varchar(30),
Email varchar(30),Phone varchar(14),Address varchar(50));

-- creating PRODUCTS table
create table PRODUCTS(ProductID int not null identity(1,1) primary key, ProductName varchar(30),Description varchar(50),
Price int);

-- creating ORDERS table
create table ORDERS(OrderID int not null identity(1,1) primary key,CustomerID int,OrderDate date,TotalAmount int,
foreign key(CustomerID) references CUSTOMERS(CustomerID) on delete cascade);

-- creating OrderDetails table
create table OrderDetails(OrderDetailID int not null identity(1,1) primary key,OrderID int,ProductID int,Quantity int,
Foreign key(OrderID) references ORDERS(OrderID) on delete cascade, Foreign key(ProductID) references PRODUCTS(ProductID) on delete cascade);

-- creating INVENTORY table
create table Inventory(InventoryID int not null identity(1,1) primary key,ProductID int,QuantityInStock int,
LastStockUpdate date,foreign key(ProductID) references PRODUCTS(ProductID) on delete cascade);
 
-- Inserting data
insert into CUSTOMERS values ('Aarav', 'Kumar', 'aarav.kumar@gmail.com', '9876543210', '123 Main Street, Mumbai');
insert into CUSTOMERS values ('Abhishek', 'Sahni', 'abhishek@gmail.com', '8765432109', '456 Park Avenue, Delhi');
insert into CUSTOMERS values ('Harshal', 'Bhilkar', 'hpbhilkar@gmail.com', '7654321098', '789 Hilltop Road, Bangalore');
insert into CUSTOMERS values ('Satyam', 'Sharma', 'satyams@gmail.com', '6543210987', '101 River View, Chennai');
insert into CUSTOMERS values ('Urjit', 'Kathane', 'urjitk@gmail.com', '5432109876', '234 Green Lane, Kolkata');
insert into CUSTOMERS values ('Hardik', 'Patle', 'patleh@gmail.com', '4321098765', '567 Blue Street, Hyderabad');
insert into CUSTOMERS values ('Rohan', 'Joshi', 'rohan.joshi@gmail.com', '3210987654', '890 Sunrise Avenue, Pune');
insert into CUSTOMERS values ('Harshal', 'Bodhe', 'harshalb@gmail.com', '2109876543', '345 Sunset Road, Ahmedabad');
insert into CUSTOMERS values ('Jyoti', 'Pal', 'jyotip@gmail.com', '1098765432', '678 Moonlight Lane, Jaipur');
insert into CUSTOMERS values ('Ananya', 'Bose', 'ananya.bose@gmail.com', '9876543210', '987 Star Avenue, Lucknow');

select * from CUSTOMERS

insert into PRODUCTS values('Asus Zenbook','Laptop',52000)
insert into PRODUCTS values('Samsung S21','Mobile',44000)
insert into PRODUCTS values('Godrej EON','Refridgerator',15000)
insert into PRODUCTS values('Nikon Coolpix','Camera',36000)
insert into PRODUCTS values('Canon Lasorjet','Printer',25000)
insert into PRODUCTS values('Lenovo Ideapad','Laptop',48000)
insert into PRODUCTS values('Sony Bravia','Television',41000)
insert into PRODUCTS values('Samsung RV','Laptop',46000)
insert into PRODUCTS values('Realme Narzo','Mobile',24000)
insert into PRODUCTS values('Redmi Note12','Mobile',21000)

select * from products

insert into ORDERS values(2,'2023-11-11',36000)
insert into ORDERS values(3,'2023-11-6',51000)
insert into ORDERS values(2,'2023-10-5',46000)
insert into ORDERS values(2,'2023-9-23',71000)
insert into ORDERS values(7,'2023-8-16',25000)
insert into ORDERS values(9,'2023-7-28',45000)
insert into ORDERS values(4,'2023-7-7',21000)
insert into ORDERS values(9,'2023-6-4',16000)
insert into ORDERS values(6,'2023-4-21',32000)
insert into ORDERS values(2,'2023-10-30',26000)

select * from orders

insert into OrderDetails values(1,3,1)
insert into OrderDetails values(2,5,1)
insert into OrderDetails values(3,8,2)
insert into OrderDetails values(9,1,1)
insert into OrderDetails values(5,6,2)
insert into OrderDetails values(7,3,2)
insert into OrderDetails values(4,8,1)
insert into OrderDetails values(6,7,1)
insert into OrderDetails values(9,6,1)
insert into OrderDetails values(7,2,2)

select * from OrderDetails

insert into Inventory values(4,42,'2023-11-20')
insert into Inventory values(9,25,'2023-11-15')
insert into Inventory values(3,83,'2023-11-21')
insert into Inventory values(7,17,'2023-11-4')
insert into Inventory values(1,105,'2023-11-10')
insert into Inventory values(5,224,'2023-11-1')
insert into Inventory values(6,175,'2023-11-19')
insert into Inventory values(5,86,'2023-11-26')
insert into Inventory values(2,44,'2023-10-30')
insert into Inventory values(9,162,'2023-10-25')

select * from inventory

-- Q1 Write an SQL query to retrieve the names and emails of all customers. 
select FirstName,LastName, Email from CUSTOMERS

-- Q2 Write an SQL query to list all orders with their order dates and corresponding customer names.
select c.FirstName, o.OrderDate from CUSTOMERS c,ORDERS o order by o.OrderDate, FirstName

-- Q3 Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address
insert into CUSTOMERS values('Bhushan','Satpute','bhushans@gmail.com','9856589555','Narkhed, Nagpur')

-- Q4 Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
update PRODUCTS set price=price*1.1

-- Q5 Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
declare @order_id int
 set @order_id=10
delete from ORDERS where OrderID=@order_id;

-- Q6 Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
insert into ORDERS values(4,'2023-11-20',27000);

-- Q7 Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.
declare @email varchar(30); 
set @email = 'work54@gmail.com';
declare @addr varchar(50);
set @addr = 'Hinjewadi, Pune';

update CUSTOMERS set Email = @email, Address = @addr where CustomerID = 4;


-- Q8 Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.
update ORDERS set TotalAmount = (select SUM(price * quantity) from OrderDetails join PRODUCTS on OrderDetails.ProductID=PRODUCTS.ProductID
where OrderDetails.ProductID=ORDERS.Product_ID)

-- Q9 Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
declare @customerID int;
set @customerID=10;
delete from ORDERS where OrderID=@customerID;

-- Q10 Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.
insert into PRODUCTS values('Microtek','Invertor',24000)

-- Q11 Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
alter table ORDERS add Status varchar(20)
update ORDERS set Status='Shipped' where OrderID=1

-- Q12 Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.
alter table CUSTOMERS add TotalOrders int
update CUSTOMERS set TotalOrders = (select count(OrderID) from ORDERS where CUSTOMERS.CustomerID = ORDERS.CustomerID)


-- Q1 Write an SQL query to find out which customers have not placed any orders.
select C.FirstName, C.LastName from Customers C LEFT JOIN Orders O ON C.CustomerID = O.CustomerID where O.CustomerID IS NULL

select CUSTOMERS.FirstName,Customer.LastName from CUSTOMERS where CUSTOMERS.CustomerID not in 
(select distinct(ORDERS.CustomerID) from ORDERS)

-- Q2 Write an SQL query to find the total number of products available for sale. 
select Count(ProductID) as TotalProducts from PRODUCTS

-- Q3 Write an SQL query to calculate the total revenue generated by TechShop. 
select sum(TotalAmount) as TotalRevenue from ORDERS where CustomerID IN (SELECT CustomerID FROM CUSTOMERS)

-- Q4 Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.
declare @category varchar(20)
set @category='Electronics'
select avg(OrderDetails.Quantity) as AverageQuantity from Category join Products on Category.CategoryID = Products.CategoryID
join OrderDetails on Products.ProductID = OrderDetails.ProductID where Category.CategoryName = @category;

-- Q5 Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
select FirstName ,(select sum(Quantity * Price) from Orders, OrderDetails, Products where Orders.CustomerID = Customers.CustomerID 
and Orders.OrderID = OrderDetails.OrderID and OrderDetails.ProductID = Products.ProductID) as TotalRevenue from Customers 
where CustomerID = 6;

-- Q6  Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.
select top 3 FirstName, (select count(OrderID) from ORDERS where CUSTOMERS.CustomerID = ORDERS.CustomerID) AS TotalOrders 
from CUSTOMERS order by TotalOrders desc;

-- Q7 Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.
select Category.CategoryName, sum(OrderDetails.Quantity) as TotalQuantity from Category join Products 
on Category.CategoryID = Products.CategoryID join OrderDetails on Products.ProductID = OrderDetails.ProductID
group by Category.CategoryName order by TotalQuantity desc;

--Q9 Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.
select CUSTOMERS.FirstName, avg(OrderDetails.Quantity * Products.Price) as AverageOrderPrice
from CUSTOMERS join Orders on CUSTOMERS.CustomerID = ORDERS.CustomerID join OrderDetails on ORDERS.OrderID = OrderDetails.OrderID 
join Products on OrderDetails.ProductID = Products.ProductID group by CUSTOMERS.FirstName

--Q 10  Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count
select FirstName, (select count(OrderID) from ORDERS where CUSTOMERS.CustomerID = ORDERS.CustomerID) AS TotalOrders from CUSTOMERS;


Create table Category (CategoryID int not null primary key identity,CategoryName varchar(30))
insert into Category values('Electronics');
insert into Category values('Appliances');
insert into Category values('Camera');
insert into Category values('Toys');

alter table PRODUCTS add CategoryID int, foreign key(CategoryID) references Category(CategoryID) on delete cascade;

update PRODUCTS set CategoryID=1 where ProductID=10


-- Q1 Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.
select CUSTOMERS.FirstName,PRODUCTS.ProductName from Orders  join Customers on Orders.CustomerID = Customers.CustomerID
join OrderDetails on Orders.OrderID = OrderDetails.OrderID  join Products on OrderDetails.ProductID = Products.ProductID;

-- Q2 Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.
select (PRODUCTS.ProductName), (PRODUCTS.Price*OrderDetails.Quantity) as Revenue from OrderDetails join PRODUCTS on 
OrderDetails.ProductID=PRODUCTS.ProductID join Category on Category.CategoryID=PRODUCTS.CategoryID where Category.CategoryName
='Electronics'

-- Q3 Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.
select FirstName, LastName from Customers where CustomerID in (select distinct(CustomerID) from ORDERS) 

-- Q4 Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered.
-- Include the product name and the total quantity ordered. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
-- categories.
select top 2 Products.ProductName,Category.CategoryName, count(OrderDetails.Quantity) as [Count] from Products join OrderDetails on 
Products.ProductID = OrderDetails.ProductID join Category on Category.CategoryID=PRODUCTS.CategoryID
group by Products.ProductName,Category.CategoryName order by [Count] desc;

-- Q5 Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
select PRODUCTS.ProductName,Category.CategoryName from PRODUCTS inner join Category on PRODUCTS.CategoryID=Category.CategoryID

-- Q6 Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.
select CUSTOMERS.FirstName, avg(OrderDetails.Quantity * Products.Price) as AverageOrderPrice
from CUSTOMERS join Orders on CUSTOMERS.CustomerID = ORDERS.CustomerID join OrderDetails on ORDERS.OrderID = OrderDetails.OrderID 
join Products on OrderDetails.ProductID = Products.ProductID group by CUSTOMERS.FirstName

-- Q7 Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
select top 2 FirstName,LastName,ProductName,(Price*quantity) as revenue from CUSTOMERS inner join ORDERS on CUSTOMERS.CustomerID=ORDERS.CustomerID inner join
OrderDetails on OrderDetails.OrderID=ORDERS.OrderID join PRODUCTS on OrderDetails.OrderDetailID=PRODUCTS.ProductID order by revenue desc

-- Q8 Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
select Products.ProductName,Category.CategoryName, count(OrderDetails.OrderId) as count from Products
JOIN OrderDetails on Products.ProductID = OrderDetails.ProductID join Category on Category.CategoryID=PRODUCTS.CategoryID
where Category.CategoryName = 'Electronics' group by Products.ProductName, Category.CategoryName;

-- Q9  Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.
select FirstName from CUSTOMERS join ORDERS on CUSTOMERS.CustomerID=ORDERS.OrderID join OrderDetails on OrderDetails.OrderID=
ORDERS.OrderID join PRODUCTS on PRODUCTS.ProductID=OrderDetails.ProductID join Category on Category.CategoryID=PRODUCTS.CategoryID
where Category.CategoryName='Electronics' and PRODUCTS.Description='Laptop'

-- Q10 Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.
declare @StartDate date;
declare @EndDate date;
set @StartDate = '2023-10-14'; 
set @EndDate = '2023-11-24';  

select sum(TotalAmount) as TotalRevenue from Orders where OrderDate between @StartDate and @EndDate;

select * from CUSTOMERS
select * from ORDERS
select * from OrderDetails
select * from PRODUCTS
select * from Category


   
