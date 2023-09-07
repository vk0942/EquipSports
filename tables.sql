create database fddel;
use fddel;
create table admin (
    username varchar(100),
    password varchar(100),
    name varchar(200),
    email varchar(200),
    primary key (username)
);

create table users (
    username varchar(200),
    password varchar(100),
    mobno bigint,
    name varchar(200),
    email varchar(200),
    primary key (username)
);

create table managers (
	username varchar(100),
    password varchar(100),
    mobno bigint,
    resname varchar(200),
    email varchar(200),
    latitude decimal(8,6),
    longitude decimal(9,6),
    verification varchar(100)
);

alter table managers
add primary key (username);

create table items (
	managerid varchar(100),
    resname varchar(200),
    item varchar(100),
    price bigint,
    itemid bigint,
    image varchar(100),
    primary key (itemid),
    foreign key (managerid)
    references managers(username)
);

create table orders (
    orderid bigint,
    resname varchar(200),
    username varchar(200),
    item varchar(200),
    orderdate date,
    price bigint,
    staus varchar(100),
    quantity bigint,
    itemid bigint,
    address varchar(300),
    primary key (orderid),
    foreign key (username) references users(username),
    foreign key (itemid) references items(itemid)
);

create table rating (
	username varchar(100),
    managerid varchar(100),
    itemid bigint,
    rating int,
    orderid bigint,
    foreign key (orderid) references orders(orderid)
);