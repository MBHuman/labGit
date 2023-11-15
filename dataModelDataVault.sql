-- Создание хаба "Customers"
CREATE TABLE Hub_Customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    valid_from TIMESTAMPTZ NOT NULL,
    valid_to TIMESTAMPTZ NOT NULL
);

-- Создание хаба "Products"
CREATE TABLE Hub_Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    valid_from TIMESTAMPTZ NOT NULL,
    valid_to TIMESTAMPTZ NOT NULL
);

-- Создание связи "Sales" для отслеживания продаж
CREATE TABLE Link_Sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Hub_Customers(customer_id),
    product_id INT REFERENCES Hub_Products(product_id),
    sale_date TIMESTAMPTZ NOT NULL,
    valid_from TIMESTAMPTZ NOT NULL,
    valid_to TIMESTAMPTZ NOT NULL
);

-- Создание спутника для хаба "Customers"
CREATE TABLE Satellite_Customers (
    satellite_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Hub_Customers(customer_id),
    attribute_name VARCHAR(255) NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    load_date TIMESTAMPTZ NOT NULL,
    record_source VARCHAR(50) NOT NULL
);

-- Создание спутника для хаба "Products"
CREATE TABLE Satellite_Products (
    satellite_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES Hub_Products(product_id),
    attribute_name VARCHAR(255) NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    load_date TIMESTAMPTZ NOT NULL,
    record_source VARCHAR(50) NOT NULL
);
