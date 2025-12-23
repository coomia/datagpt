INSERT INTO olist.customers
SELECT * FROM file('olist_customers_dataset.csv', 'CSVWithNames');

INSERT INTO olist.orders
SELECT * FROM file('olist_orders_dataset.csv', 'CSVWithNames');

INSERT INTO olist.order_items
SELECT * FROM file('olist_order_items_dataset.csv', 'CSVWithNames');

INSERT INTO olist.order_payments
SELECT * FROM file('olist_order_payments_dataset.csv', 'CSVWithNames');

INSERT INTO olist.order_reviews
SELECT * FROM file('olist_order_reviews_dataset.csv', 'CSVWithNames');

INSERT INTO olist.products
SELECT * FROM file('olist_products_dataset.csv', 'CSVWithNames');

INSERT INTO olist.sellers
SELECT * FROM file('olist_sellers_dataset.csv', 'CSVWithNames');

INSERT INTO olist.geolocation
SELECT * FROM file('olist_geolocation_dataset.csv', 'CSVWithNames');

INSERT INTO olist.product_category_name_translation
SELECT * FROM file('product_category_name_translation.csv', 'CSVWithNames');