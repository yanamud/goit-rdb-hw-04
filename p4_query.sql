USE hw_3;

##### 4.1.########
# Визначте, скільки рядків отримано

SELECT count(tot.order_id) from (
SELECT 
	det.order_id,
    ord.date,
    det.quantity,
    det.product_id,
    prod.name as prod_name,
	cat.name as categories_name,
    cat.description,
    prod.unit,
    prod.price,
    supp.name as suppliers_name,
    supp.contact,
    supp.address,
    supp.city,
    supp.postal_code,
    supp.country,
    supp.phone as phone_suppliers,
    ord.customer_id,
    cust.name as customer_name,
    cust.contact as customer_contact,
    cust.address as customer_address,
    cust.city as customer_city,
    cust.postal_code as customer_postal_code,
    cust.country as customer_country,
    emp.*,
    ord.shipper_id,
    ship.name as shipper_name,
    ship.phone as shipper_phone
FROM orders as ord
INNER JOIN order_details as det
ON ord.id = det.order_id
INNER JOIN customers as cust
ON ord.customer_id = cust.id
INNER JOIN employees as emp
ON ord.employee_id = emp.employee_id
INNER JOIN shippers as ship
ON ord.shipper_id = ship.id
INNER JOIN products as prod
ON det.product_id = prod.id
INNER JOIN suppliers as supp
ON prod.supplier_id = supp.id
INNER JOIN categories as cat
ON prod.category_id = cat.id) as tot;

##### 4.2.########
# Змініть декілька операторів INNER на LEFT чи RIGHT.

SELECT count(tot.order_id) from (
	SELECT 
		det.order_id,
		ord.date,
		det.quantity,
		det.product_id,
		prod.name as prod_name,
		cat.name as categories_name,
		cat.description,
		prod.unit,
		prod.price,
		supp.name as suppliers_name,
		supp.contact,
		supp.address,
		supp.city,
		supp.postal_code,
		supp.country,
		supp.phone as phone_suppliers,
		ord.customer_id,
		cust.name as customer_name,
		cust.contact as customer_contact,
		cust.address as customer_address,
		cust.city as customer_city,
		cust.postal_code as customer_postal_code,
		cust.country as customer_country,
		emp.*,
		ord.shipper_id,
		ship.name as shipper_name,
		ship.phone as shipper_phone
	FROM orders as ord
	RIGHT JOIN order_details as det
	ON ord.id = det.order_id
	RIGHT JOIN customers as cust
	ON ord.customer_id = cust.id
	RIGHT JOIN employees as emp
	ON ord.employee_id = emp.employee_id
	INNER JOIN shippers as ship
	ON ord.shipper_id = ship.id
	INNER JOIN products as prod
	ON det.product_id = prod.id
	INNER JOIN suppliers as supp
	ON prod.supplier_id = supp.id
	INNER JOIN categories as cat
	ON prod.category_id = cat.id) as tot;
    
### Кількість записів після з'єднання з order_details
SELECT COUNT(*)
FROM orders AS ord
RIGHT JOIN order_details AS det ON ord.id = det.order_id;

# Кількість записів після з'єднання з customers
SELECT COUNT(*)
FROM orders AS ord
RIGHT JOIN order_details AS det ON ord.id = det.order_id
RIGHT JOIN customers AS cust ON ord.customer_id = cust.id;

# Кількість записів після з'єднання з employees
SELECT COUNT(*)
FROM orders AS ord
RIGHT JOIN order_details AS det ON ord.id = det.order_id
RIGHT JOIN customers AS cust ON ord.customer_id = cust.id
RIGHT JOIN employees AS emp ON ord.employee_id = emp.employee_id;

# Перевірка записів без відповідного employee
SELECT ord.*, cust.*, det.*
FROM orders AS ord
RIGHT JOIN order_details AS det ON ord.id = det.order_id
RIGHT JOIN customers AS cust ON ord.customer_id = cust.id
LEFT JOIN employees AS emp ON ord.employee_id = emp.employee_id
WHERE emp.employee_id IS NULL;

##### 4.3 / 4.4 / 4.5. / 4.6 / 4.7 ########
# Оберіть тільки ті рядки, де employee_id > 3 та ≤ 10.
# Згрупуйте за іменем категорії, порахуйте кількість рядків у групі, середню к-сть товару (quantity)
# Відфільтруйте рядки, де середня кількість товару більша за 21
# Відсортуйте рядки за спаданням кількості рядків.
# Виведіть на екран (оберіть) чотири рядки з пропущеним першим рядком.

SELECT categories_name, count(categories_name) as count_categ, avg(quantity) as avg_quantity from (
	SELECT 
		det.order_id,
		ord.date,
		det.quantity,
		det.product_id,
		prod.name as prod_name,
		cat.name as categories_name,
		cat.description,
		prod.unit,
		prod.price,
		supp.name as suppliers_name,
		supp.contact,
		supp.address,
		supp.city,
		supp.postal_code,
		supp.country,
		supp.phone as phone_suppliers,
		ord.customer_id,
		cust.name as customer_name,
		cust.contact as customer_contact,
		cust.address as customer_address,
		cust.city as customer_city,
		cust.postal_code as customer_postal_code,
		cust.country as customer_country,
		emp.*,
		ord.shipper_id,
		ship.name as shipper_name,
		ship.phone as shipper_phone
	FROM orders as ord
	INNER JOIN order_details as det
	ON ord.id = det.order_id
	INNER JOIN customers as cust
	ON ord.customer_id = cust.id
	INNER JOIN employees as emp
	ON ord.employee_id = emp.employee_id
	INNER JOIN shippers as ship
	ON ord.shipper_id = ship.id
	INNER JOIN products as prod
	ON det.product_id = prod.id
	INNER JOIN suppliers as supp
	ON prod.supplier_id = supp.id
	INNER JOIN categories as cat
	ON prod.category_id = cat.id) as tot
WHERE tot.employee_id > 3 and  tot.employee_id <= 10
GROUP BY categories_name
HAVING avg(quantity) > 21
ORDER BY avg_quantity desc
LIMIT 4 OFFSET 1;


