-- Create a schema named Travego

create database Travego;
use Travego;

-- Create Passsenger table

create table Passenger(
Passenger_ID int,
Passenger_name varchar(20),
Category varchar (20),
Gender varchar(20),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20)
);

-- Create Price table

create table Price(
id int,
Bus_Type varchar(20),
Distance int,
Price int
);

-- Insert values into Passenger Table

insert into Passenger
values
(1, "Sejal","AC", "F","Bengaluru", "Chennai",350, "Sleeper"),
(2, "Anmol" ,"Non-AC", "M" ,"Mumbai","Hyderabad",700,"Sitting"),
(3,"Pallavi","AC","F","Panaji","Bengaluru", 600,"Sleeper"),
(4, "Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper"),
(5,"Udit","Non-AC", "M", "Trivandrum","Panaji",1000,"Sleeper"),
(6,"Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting"),
(7,"Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper"),
(8,"Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting"),
(9,"Piyush","AC","M","Pune","Nagpur",700,"Sitting")
;

-- Insert values into Price table
  
insert into Price 
values
(1,"Sleeper",350, 770),
(2,"Sleeper",500,1100),
(3,"Sleeper",600,1320),
(4,"Sleeper",700,1540),
(5,"Sleeper",1000,2200),
(6,"Sleeper",1200,2640),
(7,"Sleeper",1500, 2700),
(8,"Sitting",500,620),
(9,"Sitting",600,744),
(10,"Sitting",700,868),
(11,"Sitting",1000,1240),
(12,"Sitting",1200,1488),
(13,"Sitting",1500,1860)
;

select * from passenger;
select * from price;

-- How many female passengers traveled a minimum distance of 600KMs?

select count(*)as total from passenger 
where gender="F" and Distance>600;

-- Display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus

select * from passenger 
where bus_type="sleeper" and Distance>500;

-- Select passenger names whose names start with the character'S'.

select Passenger_name from passenger 
where passenger_name like"S%";

-- Calculate the price charged for each passenger,displaying the Passengername,BoardingCity,DestinationCity,Bustype,and Price in the output.

select pa.Passenger_name, pa.Boarding_City,
pa.Destination_City,pa.Bus_type,pr.Price
from passenger as pa
inner join price as pr
on pa.distance=pr.distance;

-- What are the passenger names and the ticket price for those who traveled 1000KMs Sitting in a bus?

select pa.Passenger_name
from passenger as pa 
inner join price as pr
on pa.distance=pr.distance
where pa.distance=1000 and pa.bus_type="Sitting"; 

-- What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
 
select * from passenger as pa
inner join price as pr
on pa.distance=pr.distance
where pa.passenger_name="Pallavi";

-- Alter the column category with the value "Non-AC" where the Bus_Type is sleeper

update passenger
set category="Non-AC"
where bus_type="Sleeper";
select * from passenger;

-- Delete an entry from the table where the passenger name is Piyush and commit this change in the database

delete from passenger
where passenger_name="Piyush";
commit;

-- Truncate the table passenger and comment on the number of rows in the table

truncate table passenger;

-- Delete the table passenger from the database.

drop table passenger;




