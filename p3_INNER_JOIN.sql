USE hw_3;
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
ON prod.category_id = cat.id;
