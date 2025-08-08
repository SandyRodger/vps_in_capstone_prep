# [Optimisation](https://launchschool.com/lessons/ce10b313/assignments)

## What to focus on

- Optimization (duh)
- db apps can be slow for many reasons.

## [Identifying Optimizations](https://launchschool.com/lessons/ce10b313/assignments/9d758946)

-video [4:44]
- It works, but it's inefficient.
- N + 1 query
  - The total number of queries performed is equal to the number of queries on the page plus 1.
  - It's where an application issues one query to retrieve data for a parent record, and then an additional query for each child record associated with that parent.
- Using the most general purpose methods you can at first and then coming back to optimise.
- Minimise the number of SQL queries being made to the db.

## [Optimising N + 1 queries](https://launchschool.com/lessons/ce10b313/assignments/89590e77)

- video [21:12]
- Finding duplicated functionality.
- `git grep -n todos_count`
- `git grep -n list_complete`
- What is really needed?
- `\e`
- `NULLIF`
- consistent `count` methods.
- Preventing work happening behind the scenes which won't ever be necessary.
- Start general with SQL queries, this makes it easier to build forward. Then later come back and change the code.

## [Pushing Down Operations to the Database](https://launchschool.com/lessons/ce10b313/assignments/bb9d2366)

- video [13:50]
- `list_complete?` method
  - Where is this list hash coming from?
  - The returning hash has differing keys.
- How to refactor out any duplication.
- It's a lot more efficient for you to count things in SQL rather than in Ruby.
- `tuple_to_list_hash`

- We have in this lesson:
  - continued to move counting functionality into the db. Remove some helper methods. Move business logic into the db
  - Standardized the way the list hashes are used. This makes them simpler.
  - Changed the way that we load data into the todo-lists page. By creating @todos and @list instance variables.

## [Summary](https://launchschool.com/lessons/ce10b313/assignments/4065e279)

- How N+1 queries are a result of performing an additional query for each element in a collection.
- How to move business logic from Ruby into the database by adding to a query's select list.
- How making database interactions more efficient often involves making SQL queries more specialized.

## [Quiz](https://launchschool.com/lessons/ce10b313/assignments/465e198a)

- 100%
- review 22.2.24 100% 
