CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount nueric(6,2) NOT NULL,
  memo text NOT NULL,
  created_on date NOT NULL
);