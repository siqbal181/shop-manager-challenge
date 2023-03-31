TRUNCATE TABLE items, orders items_orders RESTART IDENTITY; -- replace with your own table name.

INSERT INTO items (name, price, quantity) VALUES ('Coffee Machine', 75, 30);
INSERT INTO items (name, price, quantity) VALUES ('Kettle', 45, 15);
INSERT INTO items (name, price, quantity) VALUES ('Laptop', 270, 30);
INSERT INTO items (name, price, quantity) VALUES ('Toaster', 50, 32);
INSERT INTO items (name, price, quantity) VALUES ('Cushions', 12, 60);

INSERT INTO orders (customer_name, item_id, date) VALUES ('Karen', 1, '2023-03-12');
INSERT INTO orders (customer_name, item_id, date) VALUES ('Karen', 2, '2023-03-12');
INSERT INTO orders (customer_name, item_id, date) VALUES ('Libby', 1, '2023-03-13');
INSERT INTO orders (customer_name, item_id, date) VALUES ('Rob', 3, '2023-03-14');
INSERT INTO orders (customer_name, item_id, date) VALUES ('Tina', 4, '2023-03-14');
INSERT INTO orders (customer_name, item_id, date) VALUES ('Tina', 5, '2023-03-14');

INSERT INTO items_orders (order_id, item_id) VALUES (1, 1);
INSERT INTO items_orders (order_id, item_id) VALUES (2, 2);
INSERT INTO items_orders (order_id, item_id) VALUES (4, 3);
INSERT INTO items_orders (order_id, item_id) VALUES (5, 4);
INSERT INTO items_orders (order_id, item_id) VALUES (6, 5);

