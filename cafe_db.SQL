create table branches(
b_code nvarchar2(10) not null,
B_name nvarchar2(10) null,
constraint branches_pk primary key (b_code)
);
create table directors(
d_code nvarchar2(10) not null,
d_name nvarchar2(50)null,
d_surname nvarchar2(50) null,
d_birthdate date null,
d_salary number(8,2) null,
b_code nvarchar2(10) null,
constraint directors_pk primary key(d_code)
);
create table employees(
e_code nvarchar2(10) not null,
e_name nvarchar2(50) null,
e_surname nvarchar2(50) null,
e_birthdate date null,
b_code nvarchar2(10) null,
constraint employees_pk primary key (e_code)
);
create table employees_info(
e_code nvarchar2(10) not null,
e_salary number(8,2) null,
e_address nvarchar2(200) not null,
e_phone nvarchar2(11) null,
constraint employees_info_pk primary key (e_code)
);
create table customers(
c_code nvarchar2(10) not null,
c_name nvarchar2(50) null,
c_surname nvarchar2(50) null,
c_phone nvarchar2(11) null,
e_code nvarchar2(10) null,
constraint customer_pk primary key (c_code)
);
create table products(
p_code nvarchar2(10) not null,
p_name nvarchar2(10) null,
p_quantity int null,
b_code nvarchar2(10) null,
constraint products_pk primary key (p_code)
);
alter table directors add constraint directors_fk foreign key(b_code)
references branches(b_code);

alter table employees add constraint employees_fk foreign key(b_code)
references branches(b_code);

alter table employees_info add constraint employees_info_fk foreign key(e_code)
references employees_info(e_code);

alter table customers add constraint customers_fk foreign key(e_code)
references employees(e_code);

alter table products add constraint products_fk foreign key(b_code)
references branches(b_code);

alter table products
drop constraint products_fk;
commit;
alter table employees add constraint chk_employees_birthdate check
(e_birthdate between to_date('01-01-1990','dd-mm-yyyy')
 and to_date('01-01-2000','dd-mm-yyyy'));
 
insert into employees values('b003','ahmad','mohammad'
,to_date('01-01-1989','dd-mm-yyyy'),'a001');

insert into branches values('a001','new york');

alter table employees drop constraint chk_employees_birthdate;
INSERT INTO BRANCHES VALUES('FATIH1','FATIH1');
INSERT INTO BRANCHES VALUES('FATIH2','FATIH2');
select * from BRANCHES;
INSERT INTO DIRECTORS VALUES('D160000001','HASAN','SIDAWI',to_date('1989.05.01','yyyy.mm.dd'),6000,'FATIH1');
INSERT INTO DIRECTORS VALUES('D160000002','OMAR','ALBAHRA',to_date('1990.02.01','yyyy.mm.dd'),6000,'FATIH2');

INSERT INTO EMPLOYEES VALUES('E170000001','MAJED','BAWARSHI',to_date('1995.08.01','yyyy.mm.dd'),'FATIH1');
INSERT INTO EMPLOYEES VALUES('E170000002','OMAR','ALBAHRA',to_date('1994.06.01','yyyy.mm.dd'),'FATIH2');

INSERT INTO EMPLOYEES_INFO VALUES('E170000001',550,'FATIH GURPINAR MAH','05536789964');
INSERT INTO EMPLOYEES_INFO VALUES('E170000002',850,'FATIH CAMI MAH','05536789564');

INSERT INTO CUSTOMERS VALUES('C160000001','AHMET','INAN',05565946416,'E170000001');
INSERT INTO CUSTOMERS VALUES('C150000002','MOHAMMED','ALAJLOUNI',05565946465,'E170000002');

INSERT INTO PRODUCTS VALUES('C160000001','AUSTRALIAN',60,'FATIH1');
INSERT INTO PRODUCTS VALUES('C160000002','BRAZILIAN',90,'FATIH2');

alter table branches drop column B_name;
delete from branches where b_name='FATIH';

create table customers_backup(
c_code nvarchar2(10) not null,
c_name nvarchar2(50) null,
c_surname nvarchar2(50) null,
c_phone nvarchar2(11) null,
e_code nvarchar2(10) null
);

insert into customers_backup select * from customers;

insert into customers_backup(c_code,c_name,c_surname) select c_code,c_name,c_surname from customers;

update branches set B_name='fatih3' where upper(b_code)=upper('fatih1');

insert into employees (select 'E170000003',e_name,e_surname,e_birthdate,b_code 
from employees where e_code='E170000001');

update customers set e_code='E170000003' where e_code='E170000001';
update employees_info set e_code='E170000003' where e_code='E170000001';

delete from employees where e_code='E170000001';

