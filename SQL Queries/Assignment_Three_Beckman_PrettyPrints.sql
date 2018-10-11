USE prints;
# 1. Create a view named Under_100. It consists of the item_id, title, artist, unit_price and order_qty for every print with a unit_price under 100 dollars.

CREATE VIEW Under_100
AS SELECT items.item_id, title, artist, unit_price, order_qty
FROM items, orderline
WHERE unit_price < 100 AND items.item_id = orderline.item_id;

# 2. Create a view named Allen. It consists of the customer_id, customer_name, customer_phone, title, and artist of each print ordered.

CREATE VIEW Allen
AS SELECT customers.customer_id, customer_name, customer_phone, title, artist, orders.order_id
FROM items, orders, orderline, customers
WHERE items.item_id = orderline.item_id AND orders.order_id = orderline.order_id AND customers.customer_id = orders.customer_id AND orderline.order_id = orders.order_id
GROUP BY orders.order_id;

# 3. Create a view named orders. It consists of the item_id, title, artist, unit_price and order_qty for every print ordered in the range of 2014-01-01 and 2014-02-28.

CREATE VIEW Orders_View
AS SELECT items.item_id, title, artist, unit_price, order_qty, order_date
FROM orders, orderline, items
WHERE items.item_id = orderline.item_id 
AND orders.order_id = orderline.order_id
AND order_date BETWEEN "2014-01-01" and "2014-02-28";

# 4. Create a view named zip_27. It consists of the customer_name, customer_phone, title, artist and date_shipped of each print ordered by a customer whose zip code begins with 27.

CREATE VIEW zip_27
AS SELECT customer_name, customer_phone, title, artist, ship_date
FROM customers, items, orders, orderline
WHERE LEFT(customers.customer_zip, 2) = 27
AND customers.customer_id = orders.customer_id
AND orderline.item_id = items.item_id
AND orderline.order_id = orders.order_id;

# 5. Create the following indexes. Use the indicated index name. 
# a. Create an index named customer_id on the customer_id field in the customers table. 
# b. Create an index named name on the customer_name field in the customers table. 
# c. Create an index named shipped on the customer_id and ship_date in the orders table. 

CREATE INDEX customer_id
ON customers (customer_id);

CREATE INDEX name
ON customers (customer_name);

CREATE INDEX shipped
ON orders (customer_id, ship_date);

# 6. Drop the name index.

ALTER TABLE customers
DROP INDEX name;

# 7. Specify the integrity constraint that the unit_price of any print must be more than $35.

ALTER TABLE items
ADD CONSTRAINT price_check CHECK (unit_price>35);

# 8. Create the following foreign keys within the prints database.
# a. customer_id is a foreign key in the orders table. 
# b. Item_id is a foreign key in the orderline table.

ALTER TABLE orders
ADD CONSTRAINT foreignKey_customer_id 
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE orderline
ADD CONSTRAINT forignKey_item_id
FOREIGN KEY (item_id)
REFERENCES items(item_id);

# 9. Add to the items table a new character field named type that is one character in length.

ALTER TABLE items
ADD type CHAR(1);

# 10. Change the type field in the items table to M for the print titled Skies Above.

UPDATE items
SET items.type = 'M'
WHERE items.item_id = 700
AND items.title = "Skies Above";

# 11. Change the length of the artist field in the items table to 30. 

UPDATE items
SET items.artist = CHAR(30)
WHERE items.item_id <> 0;

# 12. What command would you use to delete the orders table from the prints database? (Do not delete the orders table.)

#DROP TABLE orders;