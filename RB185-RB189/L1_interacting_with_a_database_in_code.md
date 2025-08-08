# [Interacting with a Database in Code](https://launchschool.com/lessons/10f7102d/assignments)

## 1	[What this Course Covers](https://launchschool.com/lessons/10f7102d/assignments/9b9de296)

- How to interact with an SQL database via a ruby program.
- Using a `pg` gem to interact with a POstgreSQL database.
- Using a lot of HTML and CSS
- The assessment covers RB175 also.

## 2	[Getting Started](https://launchschool.com/lessons/10f7102d/assignments/7ac0fce8)

- We'll learn:
  - Connecting to PostgreSQL from Ruby.
  - Using the `pg` gem to perform queries.
  - building dynamic SQL statements safely.
  - structuring small command-line applications
  - Optimize queries made from Ruby programs
 
- Install pg gem
- Install Pry gem

## 3	[What to Focus On](https://launchschool.com/lessons/10f7102d/assignments/61966257)

- Observe the progresion of steps from high-level requirements to low-level implementation details.
  - Think about how project requirements affect what SQL is written later.
- Understand how to dynamically generate SQL.
  - When we make SQL queries from Ruby there are inherent risks.
- Focus on the database and not the application.
  - We'll build a command line app here. It's nice, but not the thing we're learning to do. Focus more on the database interaction. That's the nugget.

## 4	[Executing SQL Statements from Ruby](https://launchschool.com/lessons/10f7102d/assignments/003e5e30)

- video [13:29]
- Connecting to a SQL db from ruby with `pg`.
  - Install pg.
  - `db = PG.connect(dbname: "films")`
  - `show-method PG.connect`
  - `result = db.exec "SELECT 1"
  - `cd result`
  - `ls`
### Tuple
  - [4:20] A tuple is a Ruby-hash rather than a list of values (which is the more common meaning of 'tuple')
  - `result = db.exec "SELECT * FROM films;"`
    - (never pass multiple queries to exec at a time)
  - `result.values`
  - `show-method result.fields`
  - `result.values.size` tells you how many columns there are, but so does `result.ntuples`

``sql
result.each do |tuple|
  puts "#{tuple["title"]} came out in #{tuple["year"]}"
end
  ```

```sql
result.each_row do |row|
  puts "#{row[1]} came out in #{row[2]}"
end
```

- Note that the results are all strings. Later we will look at Type-casting data into different types.
- `result.field_values("duration")` is the same as `result.column_values(4)`

Review of useful commands:

|Command|	What it does|
| :--- | :--- |
|PG.connect(dbname: "a_database")	|Create a new PG::Connection object|
|connection.exec("SELECT * FROM table_name")	|execute a SQL query and return a PG::Result object|
|result.values|	Returns an Array of Arrays containing values for each row in result|
|result.fields|	Returns the names of columns as an Array of Strings|
|result.ntuples|	Returns the number of rows in result|
|result.each(&block)|	Yields a Hash of column names and values to the block for each row in result|
|result.each_row(&block)|	Yields an Array of values to the block for each row in result|
|result[index]|	Returns a Hash of values for row at index in result|
|result.field_values(column)|	Returns an Array of values for column, one for each row in result|
|result.column_values(index)|	Returns an Array of values for column at index, one for each row in result|

## 5 [Project Demo](https://launchschool.com/lessons/10f7102d/assignments/1ca9b617)

- Video[4:34]
- A small CL app that uses a PostgreSQL database to store data about expenses.
- This video just shows how it works. In later videos we'll build it.
  - `./expense` to run the executable
  - Add an expense:
    -  `./expense add 4.56 Coffee`
    -   `./expense add 9.23 "Lunch with client"`
    -   `./expense list`
    -   `./expense search "coffee`

## 6	[Project Setup](https://launchschool.com/lessons/10f7102d/assignments/2090528a)

- Setting up everything from scratch.
  - Create directory (`01_expenses_project`)
  - Create `Gemfile` with `pg` gem.
  - `bundle install`
  - Create main app file `expense`
  - Add "hash-bang" `#! /use/bin/env ruby`
  - Add execute permission to `execute` : `chmod +x expense`
  - Require `pg`
  - Add code to `expense`
  - test program with `./expense`

## 7	[Database Design](https://launchschool.com/lessons/10f7102d/assignments/796f407c)

- `createdb rb185_project` (meta-command)
- `\c rb185_project`

```sql
CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount numeric(6,2) NOT NULL,
  memo text NOT NULL,
  created_on date NOT NULL
);

INSERT INTO expenses(amount, memo, created_on) VALUES
(9999.99, 'this is the largest possible value', '2023-11-29');

INSERT INTO expenses(amount, memo, created_on) VALUES
(10000.00, 'this is too large', '2023-11-29');

INSERT INTO expenses(amount, memo, created_on) VALUES
(-9999.99, 'this is the smallest possible value', '2023-11-29');

INSERT INTO expenses(amount, memo, created_on) VALUES
(-10000.00, 'this value''s too small', '2023-11-29');

DELETE FROM expenses WHERE amount < 0;
ALTER TABLE expenses ADD CONSTRAINT amount_positive_value CHECK (amount BETWEEN 0 AND 9999.99);
ALTER TABLE expenses ADD CONSTRAINT positive_amount CHECK (amount >= 0.01);
```

## 8	[Listing Expenses](https://launchschool.com/lessons/10f7102d/assignments/772b1386)	

```sql
INSERT INTO expenses (amount, memo, created_on) VALUES (14.56, 'Pencils', NOW());
INSERT INTO expenses (amount, memo, created_on) VALUES (3.29, 'Coffee', NOW());
INSERT INTO expenses (amount, memo, created_on) VALUES (49.99, 'Text Editor', NOW());

DELETE FROM expenses WHERE id = 1;
SELECT * FROM expenses ORDER BY created_on DESC;
```

```expense
  db = PG.connect(dbname: "rb185_projects")
  results = db.exec("SELECT * FROM expenses ORDER BY created_on ASC")
  results.each do |tuple|
    columns = [ tuple["id"].rjust(3),
                tuple["created_on"].rjust(10),
                tuple["amount"].rjust(12),
                tuple["memo"]]
    puts columns.join(" | ")
  end
```

## 9	[Displaying Help](https://launchschool.com/lessons/10f7102d/assignments/fa215da5)

```sql
#! /usr/bin/env ruby

require "pg"

def list_expenses
  connection = PG.connect(dbname: "expenses")

  result = connection.exec("SELECT * FROM expenses ORDER BY created_on ASC")
  result.each do |tuple|
    columns = [ tuple["id"].rjust(3),
                tuple["created_on"].rjust(10),
                tuple["amount"].rjust(12),
                tuple["memo"] ]

    puts columns.join(" | ")
  end
end

def display_help
  puts <<~HELP
    An expense recording system

    Commands:

    add AMOUNT MEMO - record a new expense
    clear - delete all expenses
    list - list all expenses
    delete NUMBER - remove expense with id NUMBER
    search QUERY - list expenses with a matching memo field
  HELP
end

command = ARGV.first
if command == "list"
  list_expenses
else
  display_help
end
```

## 10 [Adding Expenses](https://launchschool.com/lessons/10f7102d/assignments/c54b083f)

```expenses
#! /usr/bin/env ruby

require 'pg'
require 'date'

CONNECTION = PG.connect(dbname: "rb185_projects")

def list_expenses
  results = CONNECTION.exec("SELECT * FROM expenses ORDER BY created_on ASC")
  results.each do |tuple|
    columns = [ tuple["id"].rjust(3),
                tuple["created_on"].rjust(10),
                tuple["amount"].rjust(12),
                tuple["memo"]]
    puts columns.join(" | ")
  end
end

def display_help
  puts <<~HELP
  An expense recording system

  Commands:
  
  add AMOUNT MEMO - record a new expense
  clear - delete all expenses
  list - list all expenses
  delete NUMBER - remove expense with id NUMBER
  search QUERY - list expenses with a matching memo field
  HELP
end

def add_expense(amount, memo)
  date = Date.today
  sql = "INSERT INTO expenses (amount, memo, created_on) VALUES (#{amount}, '#{memo}', '#{date}')"
  CONNECTION.exec(sql)
end

command = ARGV.first
if command == "list"
  list_expenses
elsif command == "add"
  amount = ARGV[1]
  memo = ARGV[2]
  abort "You must provide an amount and memo." unless amount && memo
  add_expense(amount, memo)
else
  display_help
end
```

- An explanation of how misplaced apostrophes are a common bug which can allow for SQL injection hacks.

## 11	[Handling Parameters Safely](https://launchschool.com/lessons/10f7102d/assignments/6877d345)

- 'sanitize your inputs'
- The following malicious code is an example of a SQL injection to delete all data:
  - `$ ./expense add 0.01 "', '2015-01-01'); DROP TABLE expenses; --"`
- PostgreSQL provides a way to guard against this:
  - `pg` adopts this with the method `PG::Connection#exec_params` rather than `PG::Connection#exec`
- THIS IS THE BIT ABOUT $1 as a variable.
- For example:
  - `connection.exec_params("SELECT 1 + $1", [1]).values` => `[["2"]]`
  - `connection.exec_params("SELECT upper($1)", ["test"]).values` => `[["TEST"]]`
  - `connection.exec_params("SELECT position($1 in $2)", ["t", "test"]).values` => `[["1"]]`

- Practice problem 1:
  - `connection.exec_params("SELECT position($1 in $2)", ["test"]).values` returns the following error:
  -  `(irb):7:in `exec_params': ERROR:  bind message supplies 1 parameters, but prepared statement "" requires 2 (PG::ProtocolViolation)`
- Practice problem 2: Update the `add_expense` method to use the `exec_params` method:

```
def add_expense(amount, memo)
  date = Date.today
  sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"
  CONNECTION.exec_params(sql, [amount, memo, date])
end
```
- Practice problem 3: What happens when malicious code is entered into a query now:
  - `INSERT INTO expenses (amount, memo, created_on) VALUES (0.01, '', '2015-01-01'); DROP TABLE expenses; --', '')`
    -   => `  1 | 2016-06-22 |         0.01 | ', '2015-01-01'); DROP TABLE expenses; --`


## 12 [Code Structure](https://launchschool.com/lessons/10f7102d/assignments/bfc4ac83)

- video [3:59]

![Screenshot 2023-12-01 at 12 29 06](https://github.com/SandyRodger/RB185-RB189/assets/78854926/42392f7f-1529-459f-bd6d-eae1f0e9c81f)

- The command line is the starting point.
- It'll use a `CLI` class to parse/process arguments passed by the user to the program
- `ExpenseData` class.
  - communicate with the database 
    - (send and receive SQL queries)
  - Format and display results.
    - These 2 jobs might be 2 classes in a larger program.
    - Doesn't send data back to CLI class, it displays it directly.
-This structure is pretty common for a Ruby Command-line program.
  - A single class that takes input and processes it
  - Method calls are made on a second object, that deals with the business-application.

- Final code:

```expense
#! /usr/bin/env ruby

require "pg"

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: "expenses")
  end

  def list_expenses
    result = @connection.exec("SELECT * FROM expenses ORDER BY created_on ASC")
    result.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")
    end
  end

  def add_expense(amount, memo)
    date = Date.today
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"
    @connection.exec_params(sql, [amount, memo, date])
  end
end

class CLI
  def initialize
    @application = ExpenseData.new
  end

  def run(arguments)
    command = arguments.shift
    case command
    when "add"
      amount = arguments[0]
      memo = arguments[1]
      abort "You must provide an amount and memo." unless amount && memo
      @application.add_expense(amount, memo)
    when "list"
      @application.list_expenses
    else
      display_help
    end
  end

  def display_help
    puts <<~HELP
      An expense recording system

      Commands:

      add AMOUNT MEMO - record a new expense
      clear - delete all expenses
      list - list all expenses
      delete NUMBER - remove expense with id NUMBER
      search QUERY - list expenses with a matching memo field
    HELP
  end
end

CLI.new.run(ARGV)
```

## 13	[Searching Expenses](https://launchschool.com/lessons/10f7102d/assignments/e4a48665)

- Implementing the `search` method.

```
#! /usr/bin/env ruby

require 'pg'
require 'date'

class CLI

  attr_reader :db_object

  def initialize
    @db_object = ExpenseData.new
  end

  def run(argv)
    command = argv.first
    case command
    when "list"
      db_object.list_expenses
    when "add"
      amount = argv[1]
      memo = argv[2]
      abort "You must provide an amount and memo." unless amount && memo
      db_object.add_expense(amount, memo)
    when "search"
      memo = argv[1]
      db_object.search_expense(memo)
    else
      display_help
    end
  end

  private

  def display_help
    puts <<~HELP
    An expense recording system
  
    Commands:
    
    add AMOUNT MEMO - record a new expense
    clear - delete all expenses
    list - list all expenses
    delete NUMBER - remove expense with id NUMBER
    search QUERY - list expenses with a matching memo field
    HELP
  end

end

class ExpenseData

  attr_reader :connection

  def initialize
    @connection = PG.connect(dbname: "rb185_projects")
  end

  def search_expense(memo)
    sql = "SELECT * FROM expenses WHERE memo ILIKE $1"
    results = connection.exec_params(sql, [memo])
    display_expenses(results)
  end

  def list_expenses
    results = connection.exec("SELECT * FROM expenses ORDER BY created_on ASC")
    results.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"]]
      puts columns.join(" | ")
    end
  end

  def add_expense(amount, memo)
    date = Date.today
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"
    connection.exec_params(sql, [amount, memo, date])
  end

  private

  def display_expenses(expenses)
    expenses.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"]]
      puts columns.join(" | ")
    end
  end
end

CLI.new.run(ARGV)
```

## 14	[Deleting Expenses](https://launchschool.com/lessons/10f7102d/assignments/59094a8d)

- delete rows by their `id` number

```
 def delete_expense(id)
    sql = "SELECT * FROM expenses WHERE id = $1"
    result = @connection.exec_params(sql, [id])

    if result.ntuples == 1
      sql = "DELETE FROM expenses WHERE id=$1"
      @connection.exec_params(sql, [id])

      puts "The following expense has been deleted:"
      display_expenses(result)
    else
      puts "There is no expense with the id '#{id}'."
    end
  end
```

## 15	[Clearing Expenses](https://launchschool.com/lessons/10f7102d/assignments/78571424)

- Write a method `clear` which will delete all the entries in the `expenses` table.
- NB: the method is called `delete_all_expenses`, which clearly describes its acrtion. But the user-command is `clear`. So it's conventional for a program's entrails to be different from its extrails. Esp. for CLI commands where brief commands are preferable.
- `IO#getch` - like `gets` but for a single char.

```
require "io/console"
```

 and
 
```
 def delete_all_expenses
    @connection.exec("DELETE FROM expenses")
    puts "All expenses have been deleted."
  end
```

and

```
    when "clear"
      puts "This will remove all expenses. Are you sure? (y/n)"
      response = $stdin.getch
      @application.delete_all_expenses if response == "y"
```

## 16	[Counting and Totaling Expenses](https://launchschool.com/lessons/10f7102d/assignments/53f46b39)

- In `seach_expenses` and `list_expenses` insert:

```
    display_count(result)
    display_expenses(result) if result.ntuples > 0
```

```
 def display_count(expenses)
    count = expenses.ntuples
    if count == 0
      puts "There are no expenses."
    elsif count == 1
      puts "There is 1 expense."
    else
      puts "There are #{count} expenses."
    end
  end
```

- At the end of the `display_expenses` method:
```
 puts "-" * 50

    amount_sum = expenses.field_values("amount").map(&:to_f).inject(:+)

    puts "Total #{format('%.2f', amount_sum.to_s).rjust(25)}"
```
## 17	[Creating the Schema Automatically](https://launchschool.com/lessons/10f7102d/assignments/99b9d97f)

- `information_schema.tables`

```sql
 def setup_schema
    result = @connection.exec <<~SQL
      SELECT COUNT(*) FROM information_schema.tables
      WHERE table_schema = 'public' AND table_name = 'expenses';
    SQL

    if result[0]["count"] == "0"
      @connection.exec <<~SQL
        CREATE TABLE expenses (
          id serial PRIMARY KEY,
          amount numeric(6,2) NOT NULL CHECK (amount >= 0.01),
          memo text NOT NULL,
          created_on date NOT NULL
        );
      SQL
    end
  end
```

## 18	[Summary](https://launchschool.com/lessons/10f7102d/assignments/e40ff3e1)

- `pg` for:
  - creating a new `PG::Connection` object
  - Executing SQL statements using `#exec` and `#exec_params`
  - Accessing query results contained in `PG::result` object.
- Build a small command-line Ruby application
- Automatically create tables if they don't exist.
