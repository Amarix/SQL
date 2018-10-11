USE PRINTS;

#1 List all customer along with their address, city, state and zip 
SELECT customer_name,
customer_add,
customer_city,
customer_state,
customer_zip
FROM Customers;

#2 List all customers and their phone numbers that live in GA 
SELECT customer_name, customer_phone
FROM Customers
WHERE customer_state = "GA";

#3 List all customers along with their zip codes that live in NC or SC
SELECT customer_name, customer_zip
FROM Customers
WHERE customer_state = "NC" OR "SC";

#4 List all titles that have been sold along with the artist, order date and ship date
SELECT title, artist, order_date, ship_date
FROM Items, Orders;

#5 List all item id, title, artist, unit price, and on hand in ascending order by price
SELECT item_id, title, artist, unit_price, on_hand
FROM Items
ORDER BY unit_price ASC;

#6 List all item id, title, artist, unit price, and on hand for all items with a unit price that is more than $100.00
SELECT item_id, title, artist, unit_price, on_hand
FROM Items
WHERE unit_price > 100;

#7 List all item id, title, artist, unit price, and on hand for all items where there are more than 300 on hand
SELECT item_id, title, artist, unit_price, on_hand
FROM Items
WHERE on_hand > 300;

#8 List all titles along with their unit price and retail price (retail price is unit price doubled)
SELECT title, unit_price, unit_price*2 AS retail_price
FROM Items;

#9 List all customers that have placed an order in 2014 along with their phone numbers
SELECT customer_name, customer_phone
FROM Customers, Orders
WHERE YEAR(order_date) = 2014 
AND Customers.customer_id = Orders.customer_id
GROUP BY orders.order_id;

#10 List all artists with the number of their prints that have been sold
SELECT artist, SUM(order_qty) AS prints_sold
FROM Items, Orderline
WHERE Items.item_id = Orderline.item_id;

#11 List all titles that have a unit price between $40.00 and $100.00.
SELECT title
FROM Items
WHERE unit_price BETWEEN 40 AND 100;

#12 List all customers, title, artist, quantity ordered
SELECT customer_name, title, artist, order_qty
FROM Items, Customers, Orders, Orderline
WHERE Customers.customer_id = Orders.customer_id AND
Orders.order_id = Orderline.order_id AND
Items.item_id = Orderline.item_id
GROUP BY Customers.customer_id, artist, artist;

#13 List all customers along with the total revenue received from that customer (revenue would be total retail price)
SELECT customer_name, SUM((unit_price*2)*order_qty) AS total_revenue
FROM Customers, Orderline, Orders, Items
WHERE Customers.customer_id = Orders.customer_id AND
Orders.order_id = Orderline.order_id AND
Items.item_id = Orderline.item_id
GROUP BY Customers.customer_id;

#14 List each state and the number of customers from that state
SELECT customer_state, COUNT(customer_id) AS customers_from_state
FROM Customers
GROUP BY customer_state;