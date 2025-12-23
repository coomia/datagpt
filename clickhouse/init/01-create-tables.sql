CREATE DATABASE IF NOT EXISTS olist;

CREATE TABLE IF NOT EXISTS olist.customers (
    customer_id String,
    customer_unique_id String,
    customer_zip_code_prefix String,
    customer_city String,
    customer_state String
) ENGINE = MergeTree ORDER BY customer_id;

CREATE TABLE IF NOT EXISTS olist.orders (
    order_id String,
    customer_id String,
    order_status String,
    order_purchase_timestamp DateTime,
    order_approved_at Nullable(DateTime),
    order_delivered_carrier_date Nullable(DateTime),
    order_delivered_customer_date Nullable(DateTime),
    order_estimated_delivery_date DateTime
) ENGINE = MergeTree ORDER BY order_id;

CREATE TABLE IF NOT EXISTS olist.order_items (
    order_id String,
    order_item_id Int32,
    product_id String,
    seller_id String,
    shipping_limit_date DateTime,
    price Float64,
    freight_value Float64
) ENGINE = MergeTree ORDER BY (order_id, order_item_id);

CREATE TABLE IF NOT EXISTS olist.order_payments (
    order_id String,
    payment_sequential Int32,
    payment_type String,
    payment_installments Int32,
    payment_value Float64
) ENGINE = MergeTree ORDER BY order_id;

CREATE TABLE IF NOT EXISTS olist.order_reviews (
    review_id String,
    order_id String,
    review_score Int32,
    review_comment_title Nullable(String),
    review_comment_message Nullable(String),
    review_creation_date DateTime,
    review_answer_timestamp DateTime
) ENGINE = MergeTree ORDER BY review_id;

CREATE TABLE IF NOT EXISTS olist.products (
    product_id String,
    product_category_name String,
    product_name_lenght Nullable(Int32),
    product_description_lenght Nullable(Int32),
    product_photos_qty Nullable(Int32),
    product_weight_g Nullable(Float64),
    product_length_cm Nullable(Float64),
    product_height_cm Nullable(Float64),
    product_width_cm Nullable(Float64)
) ENGINE = MergeTree ORDER BY product_id;

CREATE TABLE IF NOT EXISTS olist.sellers (
    seller_id String,
    seller_zip_code_prefix String,
    seller_city String,
    seller_state String
) ENGINE = MergeTree ORDER BY seller_id;

CREATE TABLE IF NOT EXISTS olist.geolocation (
    geolocation_zip_code_prefix String,
    geolocation_lat Float64,
    geolocation_lng Float64,
    geolocation_city String,
    geolocation_state String
) ENGINE = MergeTree ORDER BY geolocation_zip_code_prefix;

CREATE TABLE IF NOT EXISTS olist.product_category_name_translation (
    product_category_name String,
    product_category_name_english String
) ENGINE = MergeTree ORDER BY product_category_name;