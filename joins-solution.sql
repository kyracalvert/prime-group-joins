-- 1. Get all customers and their addresses.
SELECT * FROM "addresses" JOIN "customers" ON "customers"."id" = "addresses"."customer_id";

-- 2. Get all orders and their line items.
SELECT * FROM "line_items" JOIN "orders" ON "orders"."id" = "line_items"."order_id";

-- 3. Which warehouses have cheetos?
SELECT * FROM "warehouse_product" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
WHERE "description" ILIKE 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT * FROM "warehouse_product" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
WHERE "description" ILIKE 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "first_name", COUNT("customers"."id")
FROM "orders" 
JOIN "addresses" ON "addresses"."id" = "orders"."address_id"
JOIN "customers" ON "customers"."id" = "addresses"."customer_id"
GROUP BY "customers"."first_name";

-- 6. How many customers do we have?
SELECT COUNT(*) FROM "customers";

-- 7. How many products do we carry?
SELECT COUNT(*) FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" WHERE "description" ILIKE 'diet pepsi';

--Stretch Goals:
-- 9. (Stretch) How much was the total cost for each order?

-- 10. (Stretch) How much has each customer spent in total?

-- 11. (Stretch) How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
