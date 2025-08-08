CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount numeric(6,2) NOT NULL,
  memo text NOT NULL,
  created_on date NOT NULL
);

-- practice problem 1

INSERT INTO expenses(amount, memo, created_on) VALUES
(9999.99, 'this is the largest possible value', '2023-11-29');

INSERT INTO expenses(amount, memo, created_on) VALUES
(10000.00, 'this is too large', '2023-11-29');

-- practice problem 2

INSERT INTO expenses(amount, memo, created_on) VALUES
(-9999.99, 'this is the smallest possible value', '2023-11-29');

INSERT INTO expenses(amount, memo, created_on) VALUES
(-10000.00, 'this value''s too small', '2023-11-29');

-- practice problem 3

DELETE FROM expenses WHERE amount < 0;
ALTER TABLE expenses ADD CONSTRAINT amount_positive_value CHECK (amount BETWEEN 0 AND 9999.99);
ALTER TABLE expenses ADD CONSTRAINT positive_amount CHECK (amount >= 0.01);

-- Listing Expenses

INSERT INTO expenses (amount, memo, created_on) VALUES (14.56, 'Pencils', NOW());
INSERT INTO expenses (amount, memo, created_on) VALUES (3.29, 'Coffee', NOW());
INSERT INTO expenses (amount, memo, created_on) VALUES (49.99, 'Text Editor', NOW());

DELETE FROM expenses WHERE id = 1;
SELECT * FROM expenses ORDER BY created_on DESC;

-- Handling parameters safely

INSERT INTO expenses(id, created_on, amount, memo) VALUES
(1, '2016-06-22', 14.56, 'Pencils'),
  (2, '2016-06-22',  3.29, 'Coffee'),
  (3, '2016-06-22', 49.99, 'Text Editor'),
  (4, '2016-06-22',  3.59, 'More Coffee');

-- Pactice problem 1

connection.exec_params("SELECT position($1 in $2)", ["test"]).values

-- (irb):7:in `exec_params': ERROR:  bind message supplies 1 parameters, but prepared statement "" requires 2 (PG::ProtocolViolation)  

-- PP 3

INSERT INTO expenses (amount, memo, created_on) VALUES (0.01, '', '2015-01-01'); DROP TABLE expenses; --', '')