# SQL-Library-Management-System_Project-2
## Project Overview

### Project Title: Library Management System

#### Level: Intermediate

##### Database: library_project_2

This project demonstrates the implementation of a Library Management System using SQL. It includes creating and managing tables, performing CRUD operations, and executing advanced SQL queries. The goal is to showcase skills in database design, manipulation, and querying.

<img width="1200" height="627" alt="image" src="https://github.com/user-attachments/assets/07d3ff68-106c-4d20-ac73-299918c6d498" />

# Objectives
1.Set up the Library Management System Database: Create and populate the database with tables for branches, employees, members, books, issued status, and return status.

2.CRUD Operations: Perform Create, Read, Update, and Delete operations on the data.

3.CTAS (Create Table As Select): Utilize CTAS to create new tables based on query results.

4.Advanced SQL Queries: Develop complex queries to analyze and retrieve specific data.

# Project Structure

1. Database Setup

   <img width="1101" height="631" alt="image" src="https://github.com/user-attachments/assets/cf3089ed-f78c-4350-b31b-094fffb4d63f" />

   - Database Creation: Created a database named library_project_2.
     
 - Table Creation: Created tables for branches, employees, members, books, issued status, and return status. Each table includes relevant columns and relationships.

``` sql
-- Library System Management SQL Project

-- CREATE DATABASE library;

-- Create table "Branch"
DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
            branch_id VARCHAR(10) PRIMARY KEY,
            manager_id VARCHAR(10),
            branch_address VARCHAR(30),
            contact_no VARCHAR(15)
);


-- Create table "Employee"
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
            emp_id VARCHAR(10) PRIMARY KEY,
            emp_name VARCHAR(30),
            position VARCHAR(30),
            salary DECIMAL(10,2),
            branch_id VARCHAR(10)
);


-- Create table "Members"
DROP TABLE IF EXISTS members;
CREATE TABLE members
(
            member_id VARCHAR(10) PRIMARY KEY,
            member_name VARCHAR(30),
            member_address VARCHAR(30),
            reg_date DATE
);



-- Create table "Books"
DROP TABLE IF EXISTS books;
CREATE TABLE books
(
            isbn VARCHAR(50) PRIMARY KEY,
            book_title VARCHAR(80),
            category VARCHAR(30),
            rental_price DECIMAL(10,2),
            status VARCHAR(10),
            author VARCHAR(30),
            publisher VARCHAR(30)
);



-- Create table "IssueStatus"
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
            issued_id VARCHAR(10) PRIMARY KEY,
            issued_member_id VARCHAR(30),
            issued_book_name VARCHAR(80),
            issued_date DATE,
            issued_book_isbn VARCHAR(50),
            issued_emp_id VARCHAR(10)
          
);



-- Create table "ReturnStatus"
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
            return_id VARCHAR(10) PRIMARY KEY,
            issued_id VARCHAR(30),
            return_book_name VARCHAR(80),
            return_date DATE,
            return_book_isbn VARCHAR(50)
);


-- Foreign key
alter table issued_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_employees
foreign key (issued_emp_id)
references employees(emp_id);


alter table employees
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);

alter table return_status
add constraint fk_issued_status
foreign key (issued_id)
references issued_status(issued_id);

 ```
Task 2: **Update an Existing Member's Address
``` sql
UPDATE members
SET member_address = '125 Oak St'
WHERE member_id = 'C103';
```



