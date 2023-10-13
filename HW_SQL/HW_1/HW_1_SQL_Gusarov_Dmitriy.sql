-----------------------------------------------------------------------------------------------------------------------------
-- ## 2. Data Manipulation Language
--
-- Задание 3. Вам даны таблицы users, orders с информацией о пользователях и заказах. 
--    Отберите тех пользователей, кто оформлял заказы осенью 2022 года.
      /*SELECT o.user_id user_id, CONCAT(u.first_name, ' ', u.last_name) username 
      FROM orders AS o 
      INNER JOIN users AS u 
      ON u.id = o.user_id
	  WHERE to_date(_order_date, 'DD/MM/YYYY') BETWEEN '2022-09-01' AND '2022-11-30'
	  Order BY 2;*/
	  
-- Задание 4. Обновите значения в таблице orders: пользователю, сделавшему заказ на наибольшую сумму 
--    (за предоставленное время) сделайте скидку 10% на все покупки. 
--    Выведите для всех пользователей таблицы orders имеющиеся данные о заказах, 
--    а также размер скидки (discount) и итоговую цену после применения скидки (new_price)
      /*ALTER TABLE orders
	  ADD COLUMN new_price REAL,
	  ADD COLUMN discount INT DEFAULT 0;

	  UPDATE orders
      SET new_price = price;

	  UPDATE orders AS o
      SET new_price = 0.9 * price, discount = 10
	  WHERE o.price = (
        SELECT MAX(price) 
        FROM orders
      );

	  SELECT * 
      FROM orders;*/

-- Задание 5. Удалите из таблицы orders заказы, которые были отменены ИЛИ количество товаров в заказе превышало 4.
	  /*DELETE FROM orders 
      WHERE status = 'cancel_order' OR items > 4;*/

-- Задание 6. Укажите 3 наиболее популярных почтовых индекса среди пользователей мужчин (например, outlook/gmail и тд). 
	  /*SELECT address FROM (
  	  SELECT SUBSTRING(
          u.email from 
          position('@' in u.email) + 1 
          for position('.' in u.email) - 1
      ) address,  
      COUNT(*) cnt_address 
      FROM users u
	  GROUP BY address
	  ORDER BY 2 DESC
	  ) f
      
	  LIMIT 3;*/

-- Задание 7. Объясните, отработает ли приведенный ниже код в СУБД PostgreSQL (и почему):
      /*
      SELECT old_price - new_price AS diff 
	  FROM goods 
	  WHERE diff > 100
	  */
      
	  /*
      Приведённый ниже код не отработает в СУБД PostgreSQL
      Проблема заключается в том, что в выражении WHERE diff > 100 используется псевдоним diff, 
      который был создан в выражении SELECT, 
      SQL не позволяет использовать алиасы столбцов из SELECT в WHERE, 
      потому что порядок выполнения операторов SQL не позволяет обращаться к алиасам до выполнения фильтрации.
      */













