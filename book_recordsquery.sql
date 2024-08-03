create table book_records(
	record_id serial primary key,
	user_id int,
	genre varchar(100),
	book_id int,
	quantity int,
	price int,
	record_date date
)

select * from book_records

insert into book_records(user_id,genre,book_id,quantity,price,record_date)values
(1, 'Fiction', 101, 2, 19.99, '2024-01-01'),
(2, 'Non-Fiction', 202, 1, 9.99, '2024-01-01'),
(3, 'Children', 303, 5, 4.99, '2024-01-02'),
(4, 'Fiction', 102, 1, 14.99, '2024-01-02'),
(5, 'Non-Fiction', 203, 2, 19.99, '2024-01-03'),
(1, 'Fiction', 101, 1, 19.99, '2024-01-04'),
(2, 'Children', 304, 3, 6.99, '2024-01-05'),
(3, 'Non-Fiction', 204, 4, 8.99, '2024-01-05'),
(4, 'Fiction', 103, 1, 29.99, '2024-01-06'),
(5, 'Children', 305, 2, 7.99, '2024-01-07')

SELECT COUNT(DISTINCT record_id) FROM book_records

SELECT COUNT(DISTINCT genre) FROM book_records

SELECT COUNT(DISTINCT quantity) FROM book_records

SELECT DISTINCT quantity FROM book_records

SELECT SUM(price) FROM book_records WHERE quantity =5 

SELECT SUM(price) FROM book_records WHERE genre ='Fiction'	

SELECT SUM(price) FROM book_records WHERE book_id = 304

SELECT genre,sum(price*quantity) AS total_sales from book_records
GROUP BY genre
ORDER BY total_sales

SELECT genre,sum(price*quantity) AS total_sales from book_records
GROUP BY genre
ORDER BY total_sales desc

SELECT user_id, AVG(price * quantity) AS average_sales FROM book_records
GROUP BY user_id
ORDER BY average_sales DESC

SELECT quantity, SUM(price) FROM book_records
GROUP BY quantity

SELECT genre, SUM(quantity) FROM book_records
GROUP BY genre
ORDER BY SUM(quantity) DESC

SELECT SUM(quantity) FROM book_records
GROUP BY genre
ORDER BY SUM(quantity) DESC

SELECT genre, SUM(quantity) FROM book_records
WHERE price > 9
GROUP BY genre
HAVING SUM(quantity) > 3

SELECT quantity FROM book_records
ORDER BY quantity ASC

SELECT quantity FROM book_records
ORDER BY quantity DESC

SELECT record_date FROM book_records
ORDER BY record_date ASC

SELECT record_date FROM book_records
ORDER BY record_date DESC

SELECT COUNT(price), SUM(price), MIN(price), MAX(price), AVG(price) FROM book_records

SELECT book_id, SUM(quantity) AS total_quantity FROM book_records
WHERE record_date BETWEEN '2024-01-01' AND '2024-01-05'
GROUP BY book_id
ORDER BY total_quantity DESC

SELECT user_id, SUM(price * quantity) AS total_sales FROM book_records
WHERE genre IN ('Fiction', 'Non-Fiction')
GROUP BY user_id
ORDER BY total_sales DESC

SELECT genre, SUM(quantity) AS total_quantity FROM book_records
GROUP BY genre
HAVING SUM(quantity) > 3

SELECT user_id, SUM(price * quantity) AS total_sales FROM book_records
GROUP BY user_id
HAVING COUNT(record_id) <3
ORDER BY total_sales DESC

