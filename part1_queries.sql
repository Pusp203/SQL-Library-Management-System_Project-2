select * from books;
select * from branch;
select * from employees;
select * from issued_status;
select * from return_status;
select * from members;

-- Project TASK


-- ### 2. CRUD Operations


-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

	insert into books 
	(isbn,book_title,category,rental_price,status,author,publisher)
	values
	('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

-- Task 2: Update an Existing Member's Address
	
	update members
	set member_address = '12588888 Main St'
	where member_id='C101';

-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS107' from the issued_status table.
	
	select * from issued_status;
	delete from issued_status
	where issued_id='IS106';

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.
	select * from issued_status;
	select issued_book_name
	from issued_status
	where issued_emp_id = 'E101';


-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.
	select * from issued_status;
	select issued_emp_id,
	count(*)
	from issued_status
	group by 1
	having count(*) >1 ;

 

-- CTAS
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

	CREATE TABLE book_cnts
	AS    
	SELECT 
	    b.isbn,
	    b.book_title,
	    COUNT(ist.issued_id) as no_issued
	FROM books as b
	JOIN
	issued_status as ist
	ON ist.issued_book_isbn = b.isbn
	GROUP BY 1, 2;
	
	
	SELECT * FROM
	book_cnts;

-- ### 4. Data Analysis & Findings

-- Task 7. Retrieve All Books in a Specific Category:

	SELECT * FROM books
	WHERE category = 'Classic';

    
-- Task 8: Find Total Rental Income by Category:
	SELECT
	    b.category,
	    SUM(b.rental_price),
	    COUNT(*)
	FROM books as b
	JOIN
	issued_status as ist
	ON ist.issued_book_isbn = b.isbn
	GROUP BY 1






-- Task 9. **List Members Who Registered in the Last 180 Days**:
	SELECT * FROM members
	WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days'
	    
	
	INSERT INTO members(member_id, member_name, member_address, reg_date)
	VALUES
	('C118', 'sam', '145 Main St', '2024-06-01'),
	('C119', 'john', '133 Main St', '2024-05-01');

-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:

	SELECT 
	    e1.*,
	    b.manager_id,
	    e2.emp_name as manager
	FROM employees as e1
	JOIN  
	branch as b
	ON b.branch_id = e1.branch_id
	JOIN
	employees as e2
	ON b.manager_id = e2.emp_id;


-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold

	CREATE TABLE books_price_greater_than_seven
	AS    
	(SELECT * FROM Books
	WHERE rental_price > 7)
	
	SELECT * 
	FROM books_price_greater_than_seven;

-- Task 12: Retrieve the List of Books Not Yet Returned
	SELECT 
	    DISTINCT ist.issued_book_name
	FROM issued_status as ist
	LEFT JOIN
	return_status as rs
	ON ist.issued_id = rs.issued_id
	WHERE rs.return_id IS NULL;

    
