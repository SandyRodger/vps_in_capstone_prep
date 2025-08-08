INSERT INTO lists(name) VALUES ('Homework');
INSERT INTO lists(name) VALUES ('Groceries');

--

INSERT INTO todos(name, list_id) VALUES ('Math', 3);
INSERT INTO todos(name, list_id) VALUES ('Science', 3);
INSERT INTO todos(name, list_id, completed) VALUES ('Geography', 3, true);
SELECT * FROM todos;

-- 
UPDATE todos SET name = $1 WHERE name == $2 