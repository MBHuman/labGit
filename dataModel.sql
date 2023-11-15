-- Создание таблицы "Products" для хранения информации о товарах
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL
);

-- Создание таблицы "Suppliers" для хранения информации о поставщиках
CREATE TABLE Suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(100),
    contact_email VARCHAR(255)
);

-- Создание таблицы "Deliveries" для хранения информации о поставках товаров
CREATE TABLE Deliveries (
    delivery_id SERIAL PRIMARY KEY,
    delivery_date DATE NOT NULL,
    product_id INT REFERENCES Products(product_id),
    supplier_id INT REFERENCES Suppliers(supplier_id),
    quantity INT NOT NULL,
    total_cost DECIMAL(12, 2) NOT NULL
);
