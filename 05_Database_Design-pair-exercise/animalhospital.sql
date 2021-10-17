-- CREATE DATABASE animalhospital;

DROP TABLE IF EXISTS owner_address;
DROP TABLE IF EXISTS pet_procedure;
DROP TABLE IF EXISTS visit;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS owner;
DROP TABLE IF EXISTS procedure;

CREATE TABLE owner (
        owner_id int primary key,
        owner_first_name varchar(45) not null,
        owner_last_name varchar(45) not null 
);

CREATE TABLE address (
        address_id int primary key,
        address varchar(64) not null,
        city varchar(64) not null,
        district varchar(64) not null,
        postal_code varchar(16) not null,
        country_code char(3)      
);

CREATE TABLE owner_address (
        owner_id bigint,
        address_id bigint,
        
        constraint fk_owner_id foreign key (owner_id) references owner(owner_id),
        constraint fk_address_id foreign key (address_id) references address(address_id),
        constraint pk_owner_address primary key (owner_id, address_id)
);

CREATE TABLE pet (
        pet_id int primary key,
        pet_first_name varchar(45) not null,
        pet_last_name varchar(45),
        pet_type varchar(45) not null,
        pet_date_of_birth date not null,
        owner_id int not null,
        
        constraint fk_owner_id foreign key (owner_id) references owner(owner_id)
);       

CREATE TABLE visit (
        visit_id int primary key,
        visit_date date not null,
        pet_id int,
        
        constraint fk_pet_id foreign key (pet_id) references pet(pet_id)
);

CREATE TABLE procedure (
        procedure_id int primary key,
        procedure_name varchar(100) not null,
        procedure_cost int not null
);

CREATE TABLE pet_procedure (
        pet_id bigint,
        procedure_id bigint,
        
        constraint fk_pet_id foreign key (pet_id) references pet(pet_id),
        constraint fk_procedure_id foreign key (procedure_id) references procedure(procedure_id),
        constraint pk_pet_procedure primary key (pet_id, procedure_id)
);

CREATE TABLE invoice (
        invoice_id int primary key
);                    