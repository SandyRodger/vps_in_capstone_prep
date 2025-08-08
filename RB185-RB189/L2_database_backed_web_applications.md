# [Database backed Web Applications](https://launchschool.com/lessons/421e2d1e/assignments)

## 1	[Getting Started](https://launchschool.com/lessons/421e2d1e/assignments/196569f0)

- Revisiting RB175 to-do list project. (download in zip file).
- Modifying it to use a database instead of a session.

## 2	[What to Focus On](https://launchschool.com/lessons/421e2d1e/assignments/1cc04e67)

- Key points:
  - What schema does an app require?
    - Being able to map the data used by a project to a database is a key skill.
  - Project set-up is secondary

## 3	[Project Overview](https://launchschool.com/lessons/421e2d1e/assignments/e8c01dbf)

- video [5:00]

![Screenshot 2023-12-02 at 08 41 24](https://github.com/SandyRodger/RB185-RB189/assets/78854926/ad3c28ee-3821-4f51-837c-1d4043850de6)

1. Take all code to do with the session and extract it into another class.
  - "SessionPersistence"
  - manage values in the session
2. Replace 'SessionPersistence` class with `DatabasePersistence` class.
  - It will use all the same methods from the Sinatra Application, it will just handle them differently
  - This using different APIs for the same app is known as the "adaptor pattern".
  - In this way your app can work with any number of data stores. 

![Screenshot 2023-12-02 at 08 49 32](https://github.com/SandyRodger/RB185-RB189/assets/78854926/a21dcb9f-7715-4605-8034-0d3328da5ea7)

## 4	[Extracting Session Manipulation Code](https://launchschool.com/lessons/421e2d1e/assignments/0ff36959)

- video [5:32]
- Extracting session manipulation functionality to a new class: `SessionPersistence`
- Search for `session[:id]`
  - Start with `load_list` method.
  - create `@storage`
- Solution video: [18:27]


## 5	[Designing a Schema](https://launchschool.com/lessons/421e2d1e/assignments/e3e8c87e)

-

## 6	[Setting up a Database Connection](https://launchschool.com/lessons/421e2d1e/assignments/a0591f9d)

- Video [10:31]
- Take db and connect to it from the Ruby process in the Sinatra application
- Project clean-up:
  - Move `SessionPersistence` class into its own file
  - Not sure why I have to specify the `public/` directory when referencing this file ?

- Add reference to `pg` gem in Gemfile + `bundle install`
- The `require "pg"` statement won't be in `todo.rb`, instead it will be in `database-persistence`.
- Delete `next_element` method because now we have an `id` column to sort this out.

- [3:10] Could be stored in a directory called 'lib'. 

- [4:30]
- `initialize`
  - initialize a `@db` instance variable:
  - Remove `session` related methods:

```ruby
def initialize
  `@db = PG.connect("dbname: "todos")`
end
```

- update `all_lists` method. [5:40]

```ruby
def all_lists
  sql = "SELECT * FROM lists"
  result = @db.exec(sql)
  result.map {|tuple|
    [{id: tuple["id"], name: tuple["name"], todos: []}]
  end
end
```


## 7	[Executing and Logging Database Queries](https://launchschool.com/lessons/421e2d1e/assignments/d7a23509)

- video [14:06]
- We try to load single todo lists from the index page.

- `find_list` method.
  - Retain the interface (?). Which means use the return value that we were using before. 

- We want to see in Sinatra's output which SQL queries are being run on the Database.
- print list id when searching for it.
- `query` method as a wrapper.

- [11:30] `logger`
- Sinatra's  logging application to make our output look like standard Sinatra output.


## 8	[Loading Records From the Database](https://launchschool.com/lessons/421e2d1e/assignments/c7a670dc)

- video [1 min]
- Fleshing out missing functionality  
  - `all_lists` returns an empty array. We want to return an array of hashes.

## 9	[Solving the Reloading Problem](https://launchschool.com/lessons/421e2d1e/assignments/732c2301)

- video [4 mins]
- The `Sinatra/reloader` gem detects Sinatra built-in methods being changed and reloads when they are. However, our files `DatabasePersistence` and `sessionpersistence` don't use these methods. So we must specify to Sinatra that we want them reloaded.
- `also_reload "database_persistence.rb` (we need the specific file name, unlike within `require`)
- Sinatra Reloader documentation: https://sinatrarb.com/contrib/reloader.html
- It doesn't have to be in the configure block, but it;'s a little more explicit to do so.

## 10	[Development Configuration](https://launchschool.com/lessons/421e2d1e/assignments/347a5cf2)

- video [2:17]
- Making reload safe. We only want reload in development.
- 2 ways:
  1. `also reload "database_persistence.rb" if development?` returns true if we're in the development eviironment.
  2. Create a **2nd** configure block with the argument `:development` with the code we want executed when we're running inside that environment;:

 ```
configure(:development) do
  require "sinatra/reloader"
  also_reload "database_persistence.rb"
end
```

  - `@logger` ?

## 11	[Working with Lists](https://launchschool.com/lessons/421e2d1e/assignments/0b9c3307)

- Implement methods in the `DatabasePersistence` class to restore the original functionality of the application.

1. Update `create_new_lists` so that it inserts new rows into the db.
2. Update `delete_list` so that it removes the correct row from `lists`.
3. re-write `update_list_name` so it updates rows in the db.

## 12	[Working with Todos](https://launchschool.com/lessons/421e2d1e/assignments/f183f8e6)

- Implement methods in the `DatabasePersistence` class to restore the original functionality of the application.
1. Create new todo
2. delete_todo_from_list
3. `update_todo_status`
4. `mark_all_todos_as_completed`

## 13	[Deploying PG Applications to Heroku](https://launchschool.com/lessons/421e2d1e/assignments/54681a23)

```
heroku apps:create rb185-todos-rodger
bundle lock --add-platform x86_64-linux
heroku addons:create heroku-postgresql:mini -a rb185-todos-rodger
heroku pg:psql -a rb185-todos-rodger < schema.sql
heroku git:remote -a rb185-todos-rodger
git add .
git commit -am "make it better"
git push heroku master
git push heroku main
```

- I had some issues to muddle through here.

## 14 [Summary](https://launchschool.com/lessons/421e2d1e/assignments/0981ae77)

- Extract functionality to `SessionPersistence` class
- Replace `SessionPersistence` with `DatabasePersistence`
- Safely handle inserting parameters into SQL statements woth `PG::Connection#exec_params`
- Use `configure(:development) block for environment-specific things.
- Reload our code with `sinatra/reloader`
- Log database queries made by our application.
![image](https://github.com/SandyRodger/RB185-RB189/assets/78854926/2293f972-69af-41cd-a8ea-74dfdd7ae729)
![image](https://github.com/SandyRodger/RB185-RB189/assets/78854926/a00d0192-f5e3-4f1c-895c-21b27587285e)
