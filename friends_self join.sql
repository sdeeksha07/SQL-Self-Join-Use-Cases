--creating table friends
create table friends
(firstname varchar(20),
lastname varchar(20))

--inserting values into friends table
insert into friends values('shipra','singh');
insert into friends values('anubhav','singh');
insert into friends values('aishwarya','singh');
insert into friends values  ('deeksha','singh');
insert into friends values ('gaurav','sonakiya');
insert into friends values ('rushabh','shakhalikar');
insert into friends values ('shaniv','tiwari');
insert into friends values ('parul','martin');
insert into friends values ('abhinav','Aggrawal');
insert into friends values ('Vibha','Barnwal');

--select * query
select * from friends

-- Creating a row_number to assign a serial number to eachone
with new_data AS
(select 
row_number() over (order by firstname) as s_no,
firstname||' '|| lastname as full_name from friends)
select * from new_data 

--creating the all possibilities of handshake using self join & cross join
with new_data AS
(select 
row_number() over (order by firstname) as s_no,
firstname||' '|| lastname as full_name from friends)

select table1.s_no,table1.full_name as first_person,table2.s_no,table2.full_name as second_person
from new_data as table1
cross join new_data as table2

--Applying condition to remove duplicate handshake
with new_data AS
(select 
row_number() over (order by firstname) as s_no,
firstname||' '|| lastname as full_name from friends)

select table1.s_no,table1.full_name as first_person,table2.s_no,table2.full_name as second_person
from new_data as table1
cross join new_data as table2 where table1.s_no < table2.s_no

--Counting # of Handshakes
with new_data AS
(select 
row_number() over (order by firstname) as s_no,
firstname||' '|| lastname as full_name from friends)

select count(*)
from new_data as table1
cross join new_data as table2 where table1.s_no < table2.s_no


--All handshakes except oneself
with new_data AS
(select 
row_number() over (order by firstname) as s_no,
firstname||' '|| lastname as full_name from friends)

select table1.s_no,table1.full_name as first_person,table2.s_no,table2.full_name as second_person
from new_data as table1
cross join new_data as table2 where table1.s_no <> table2.s_no

--counting total # of handshake
with new_data AS
(select 
row_number() over (order by firstname) as s_no,
firstname||' '|| lastname as full_name from friends)

select count(*)
from new_data as table1
cross join new_data as table2 where table1.s_no <> table2.s_no

