/*
  create at least 3 tables: restaurant (menu, location, customer, order, price)
  write sql queries at least 3 queries
  - with clause
  - subquery
  - aggregate function & group by */


create table staff (
  staff_id int,
  firstname text,
  lastname text,
  birthdate date
);

insert into staff (staff_id, firstname, lastname, birthdate)
  values (1, 'Kade', 'Sunicha', '1999-06-22'),
  (2, 'Aom', 'Pong', '1997-12-12'),
  (3, 'Jane', 'Wong', '1997-05-20'),
  (4, 'Pooh', 'Smith', '1998-11-21'),
  (5, 'Aomsin', 'Pitcha', '1997-12-12');

create table menu (
  menu_id int,
  menu_name text,
  price int
);

insert into menu (menu_id, menu_name, price)
  values (1, 'Pizza', 200),
  (2, 'Hamburger', 100),
  (3, 'Noodles', 50),
  (4, 'Fried rice', 100),
  (5, 'Fried chicken', 90),
  (6, 'Beef Steak', 450),
  (7, 'Salad', 150),
  (8, 'French fries', 120);

create table location
  (
  location_id text,
  province text,
  branch_location text
  );

insert into location 
  (
  location_id, province, branch_location
  )
  values ('01', 'Bangkok', 'Ekkamai'),
         ('02', 'Bangkok', 'Siam Paragon'),
         ('03', 'Chiang Mai', 'Mueang'),
         ('04', 'Kanchanaburi', 'Sai Yok');

create table customer
  (
    customer_id integer,
    purchase_date date,
    order_id text,
    location_id text,
    name text,
    phone varchar(10),
    amount float
  );

insert into customer 
  (
   customer_id,
   purchase_date, 
   order_id,
   location_id,
   name, 
   phone, 
   amount
  )
values (1, '2024-01-05', 000001, '02', 'Loukkade', '08 1234 5678', 200),
       (2, '2024-01-05', 000002, '01', 'Jane', '08 9876 5432', 100),
       (3, '2024-01-05', 000003, '03', 'Aommy', '08 8765 4321', 500),
       (4, '2024-01-05', 000004, '04', 'Pluly', '09 8765 4321', 700);
  
  
.mode table
.header on 

select * from location;

select * from staff;

select * from customer;

-- aggregate function
select COUNT(*), 
  sum(amount) as total_amount
from customer
where location_id IN ('01', '02');


--subquery function
select
  firstname,
  lastname 
from staff;


select 
  firstname,
  lastname,
  birthdate
from 
  (select * 
  from staff
  where birthdate 
  between '1998-01-01' 
  AND '1999-12-31');
