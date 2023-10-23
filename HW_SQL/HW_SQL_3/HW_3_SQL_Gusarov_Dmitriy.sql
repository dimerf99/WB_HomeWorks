-- task 1.1 --------------------------------------------------------------

-- Создание таблицы users

CREATE TABLE users (
  user_id INT,
  birth_date DATE,
  sex VARCHAR(10),
  age INT,
  PRIMARY KEY (user_id)
);

-- Создание таблицы items

CREATE TABLE items (
  item_id INT,
  description VARCHAR(100),
  price DECIMAL(8, 2),
  category VARCHAR(50),
  PRIMARY KEY (item_id)
);

-- Создание таблицы ratings

CREATE TABLE ratings (
  item_id INT,
  user_id INT,
  review TEXT,
  rating INT,
  PRIMARY KEY (item_id, user_id),
  FOREIGN KEY (item_id) REFERENCES items (item_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);
--------------------------------------------------------------------------


-- task 1.3 --------------------------------------------------------------

-- Наполнение таблицы users

INSERT INTO users (user_id, birth_date, sex, age)
SELECT
  generate_series AS user_id,
  to_date('01-01-1990', 'DD-MM-YYYY') + generate_series,
  CASE WHEN random() < 0.5 THEN 'Male' ELSE 'Female' END,
  FLOOR(random() * 50) + 18
FROM generate_series(1, 20);

SELECT * FROM users;

-- Наполнение таблицы items

INSERT INTO items (item_id, description, price, category)
SELECT
  generate_series AS item_id,
  'Item ' || generate_series AS description,
  (random() * 500) + 10,
  CASE WHEN random() < 0.5 THEN 'Electronics' ELSE 'Clothing' END
FROM generate_series(1, 20);

SELECT * FROM items;

-- Наполнение таблицы ratings

INSERT INTO ratings (item_id, user_id, review, rating)
SELECT
  FLOOR(random() * 20) + 1 AS item_id,
  FLOOR(random() * 20) + 1 AS user_id,
  'Review for item ' || item_id || ' by user ' || user_id AS review,
  FLOOR(random() * 5) + 1 AS rating
FROM generate_series(1, 20)








