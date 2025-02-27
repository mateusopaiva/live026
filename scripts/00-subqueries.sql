\c live026

--INSERT INTO orders(customer_id, amount) VALUES(1, 200);

-- Pegar os dados dos clientes e o total gasto
--SELECT
--  cus.*,
--  SUM(ord.amount) AS total_spent
--FROM customers AS cus
--LEFT JOIN orders AS ord ON ord.customer_id = cus.id
--GROUP BY cus.id
--ORDER BY id
--;

-- Pegar os dados dos clientes que gastaram MAIS DO QUE A MÉDIA
-- Sub Queries / Inner Queries
SELECT
  cus.*,
  SUM(ord.amount) AS total_spent,
  (
    SELECT MAX(ord.amount) FROM orders WHERE id = cus.id
  ) AS max_value
FROM customers AS cus
LEFT JOIN orders AS ord ON ord.customer_id = cus.id
GROUP BY cus.id
HAVING SUM(ord.amount) > (SELECT AVG(amount) FROM orders)
ORDER BY id
;
