-- Подключиться к БД Northwind и сделать следующие изменения:
-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
-- 1. Add a restriction on the unit_price field of the products table (the price must be greater than 0)
ALTER TABLE products
ADD CONSTRAINT chk_unitprice_greater_than_zero CHECK (unit_price > 0)

-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
-- 2. Add a restriction that the discontinued field of the products table can only contain values 0 or 1
ALTER TABLE products
ADD CONSTRAINT chk_discontinued_one_zero CHECK (discontinued IN (0,1))

-- 3. Create a new table containing all discontinued products (discontinued = 1)
CREATE TABLE discontinued_products
(
	product_id int,
	product_name varchar(40),
	unit_price real,

    CONSTRAINT pk_disc_prod_id PRIMARY KEY (product_id),

    CONSTRAINT fk_disc_product_id
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
)
INSERT INTO discontinued_products (product_id, product_name, unit_price)
SELECT product_id, product_name, unit_price FROM products WHERE discontinued = 1;

-- 4. Remove discontinued items from products (discontinued = 1)
-- Item 4 may require removing the constraint
-- associated with foreign_key.
-- Consider how this can be resolved so that the link to the order_details table still remains.
ALTER TABLE discontinued_products DROP CONSTRAINT fk_disc_product_id;
DELETE FROM products WHERE discontinued = 1;