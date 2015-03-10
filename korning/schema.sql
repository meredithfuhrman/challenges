-- DEFINE YOUR DATABASE SCHEMA HERE
DROP TABLE IF EXISTS invoice_frequencies CASCADE;
DROP TABLE IF EXISTS sales_dates CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS invoices CASCADE;

CREATE TABLE products (
  id serial primary key,
  product varchar(255)
);

CREATE TABLE customers (
  id serial primary key,
  account_no varchar(50),
  customer varchar(255)
);

CREATE TABLE employees (
  id serial primary key,
  employee varchar(255),
  email varchar(255)
);

CREATE TABLE invoices (
  id serial PRIMARY KEY,
  invoice_no integer,
  sale_amount money,
  units_sold integer,
  invoice_frequency varchar(255),
  sale_date date,
  customer_id integer references customers(id),
  employee_id integer references employees(id),
  product_id integer references products(id)
  );

ALTER DATABASE korning SET datestyle TO "ISO, MDY";
