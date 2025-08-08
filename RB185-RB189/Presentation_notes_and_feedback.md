Here's a list of timings based on the provided document:

1. **LIVE DEMO:** 02:00
   - Writing Sinatra applications
   - Navigate to the tree directory
   - Explanation of Sinatra as a web-development framework
   - Introduction to common tasks automated by Sinatra
   - Discussion on handling routes, logging, redirecting, and view-helpers
   - View Templates in Sinatra and its Rack-based nature

2. **Writing ERB code:** 04:00
   - Navigate to views/layout.erb
   - Explanation of ERB as string interpolation
   - The layout file in Sinatra wrapping around other view-files
   - Navigate to views/gym_trips.erb

3. **Using view variables and helpers:** 05:00
   - Discussion on view helpers and variables
   - Navigate to my_gym.rb line 92
   - Differentiating between instance variables and view-variables

4. **Using and writing routes:** 07:00
   - Navigate to my_gym – get ‘exercises
   - Navigate to views/exercises.erb line 10
   - Explanation of handling route parameters
   - Navigate to my_gym.rb line 105
   - Validation and moving on to the first page of exercises

5. **Validation:** 09:00
   - Navigate to validation.rb line 51
   - Demonstration of validation on Chrome
   - Discussion on creating a separate class for validation methods

6. **Maintaining state:** 11:00
   - Discussion on maintaining state with a PostgreSQL database and session
   - Flash messages/sessions
   - Navigate to my_gym.rb line 18 and layout.erb line 13

7. **Sessions and persistence:** 13:00
   - Navigate to database_persistence.rb
   - Discussion on persistence and initializing a Database object
   - Explanation of using a Logger for debugging

8. **Using SQL:** 17:00
   - Navigate to postgres \d
   - Discussion on designing the schema for the project
   - Explanation of relationships between tables
   - Navigate to \d gym_trips

9. **QUERIES:** 21:00
   - Navigate to database_persistence line 76 (#five_rows_for_exercises_averages)
   - Discussion on pushing queries down to the database and optimizing SQL queries

10. **Using static assets:** 23:00
    - Navigate to http://localhost:4567/gym_trip/edit/8/1
    - Discussion on static assets (CSS)

11. **Working with the request/response cycle:** 25:00
    - Navigate to my_gym.rb line 170
    - Discussion on simplicity provided by Sinatra

12. **Know how and when to use GET and POST requests correctly:** 26:00
    - Explanation of when to use GET and POST requests

13. **Using redirects properly:** 27:00
    - Navigate to my_gym.rb line 72
    - Discussion on the pattern of redirects after adding or updating information

14. **Understanding and mitigating security risks:** 29:00
    - Navigate to my_gym.rb line 15
    - Discussion on sanitizing inputs and escaping HTML

POWERPOINT:   									00:00

Slide 1:

-	I wrote this program to practice and demonstrate the material I’ve learnt at Launch School, but also because I enjoy going to the gym and tracking my progress. I currently use Microsoft Excel for this, which has probably influenced some of the design choices. 

Slide 2:

-	Instructions
-	After log-in 

Slide 3:

-	I am a keen gym user.
-	I  think tables are clear
-	Validate input so it’s simple to use and unbreakable
-	Pagination means user isn’t overwhelmed even when lots of data is input

Slide 4:

-	It even shows which page you are currently on

Slide 5:

-	It wouldn’t have worked to make a library of exercises available, but not allow the user to adapt it.
-	Lord Kelvin: “If you can not measure it, you can not improve it.”

Slide 6:

-	For example

Slide 7:

-	The nature of a web app is that many files have complex inter-dependencies, so the best way for me to present my program is by showing you. There’s more to say than I have time for, but I’ll do my best. I will brush over many details unfortunately

LIVE DEMO: 										02:00

- Writing Sinatra applications
NAVIGATE TO: tree directory

-	Sinatra = web-development frame-work 
-	Automates common tasks for creating web-applications. 
-	LIKE 
1.	Handling routes
2.	Logging
3.	Redirecting
4.	View-helpers
-	.VIEW TEMPLATES: 
1.	Sinatra is Rack-based. Rack is a web-server interface acting as a layer between web servers (for me WEBrick) and Ruby web-frameworks (for me Sinatra). It makes it easier to create web-applications. 
2.	This takes care of the complicated details of communicating with the web-server. 

- Writing ERB code 									04:00
NAVIGATE TO:  views/layout.erb

3.	I found it helpful to think about erb as string interpolation. 
4.	The layout file in Sinatra wraps around other view-files

NAVIGATE TO:  views/gym_trips.erb

- Using view variables and helpers 						05:00

-	View helpers are methods defined  within a block in the program  - that are available to be used within the view templates. 
-	I decided not to rely on view helper methods because for me it was neater to separate the business logic of the program from its presentation. And the data was always available in Ruby collections like Arrays and hashes.
-	I could have used helpers to sort the data, but in the end it was easier to do this sorting in the SQL queries themselves.
-	Using view variables again felt pretty familiar because they look and behave similarly to instance-variables. 
 
NAVIGATE TO:  my_gym.rb line 92

-	But they are not the same for example here `@storage` is an instance variable which I created so I wouldn’t have to create a new connection to the database every time I made a query. But @all_page_nums and @current_page_num are view-variables because I need them to be available in the erb view file.

- Using and writing routes 								07:00


NAVIGATE TO:  my_gym – get ‘exercises
NAVIGATE TO:  views/exercises.erb line 10

-	I enjoyed getting to grips with route parameters. For instance, when posting from this form, the parameter doesn’t need to be explicitly written in line 10 Instead it is defined in the input tag (line 14), where it is called “name”, so I know that in the route I will have access to this value by typing `params[:name]` or `params[“name”]`.

NAVIGATE TO:  my_gym.rb line 105

-	And here I access name in line 107
-	Validate and move on to the first page of exercises.

-Validation 									09:00

NAVIGATE TO:  validation.rb line 51
DEMONSTRATE ON CHROME

-	Validation required its own class which I stored in a separate file. I knew there were going to be many methods that would be required multiple times but also many methods for specific input to be validated. 
-	These validation methods return error messages if the input is not valid. I wrote helper methods like `invalid message` to DRY the code and also to ensure flash messages followed the same format and always included the invalid input to make things clearer for the user. 

- Maintaining state									11:00

HTTP is a stateless protocol – to state the obvious. In this program I am maintaining state with a postgres database and with the session. This means that the application is saving data on the database and the browser is storing information (only flash messages) in the session. I’ll explain how I do these.

Flash messages / Sessions							13:00

NAVIGATE TO:  my_gym.rb line 18

-	We need the session[:error] and session[:success] to respond to the #erach method before each route that’s why  we assign it in the before block

NAVIGATE TO:  layout.erb line 13

-	I needed to be able to display multiple flash messages so I set session[:error] and session[:success] to arrays and shovelled in strings of the messages that needed to be displayed and after iterating over the array I would reassign it to an empty array. 
-	This allowed me to display multiple messages whenever a view file is loaded.



- Sessions and persistence							15:00
NAVIGATE TO:  database_persistence.rb

-	The other way of persistence – the PostgresDatabase
-	I moved all code to do with persisting the database to the database_persistence class in a relative file. 
-	This way I could initialize a Database object in my before block and know that it would be available for any SQL queries I needed, rather than opening a new connection each time which would have slowed down the program a lot.
-	In my Database_persistence class the initialize method tells the server where to find the postgres database. This is for if/when the app is deployed online using a web-hosting platform like Heroku, which might need to be told where the PG database is. 
-	The initialize method also uses a Logger which is something built into the Sinatra program to allow devs to change and use information about the request cycle between Sinatra and the server. Here we write it into the ‘query’ method to always print out what the sql query was when we perform one. This helps a lot with debugging. 

- Using SQL										17:00

NAVIGATE TO:  postgres \d

-	SQL has been lovely. The first step was to design the schema for my project.
-	As it is there are 4 tables: Exercises, sets, gym_trips, and users.
-	 Incidentally it took a second to decide on the name of ‘gym_trips’ because for gym goers it’s usually called a gym-session, but that would have overlapped with a coding-session, so I decided ‘gym-trip’ was the most clear and descriptive. 
-	RELATIONSHIPS
-	Users doesn’t need to reference anything.
-	Exercises is referenced by sets (one to many)
-	Sets is referenced by gym_trips (one to many)
-	Sets is also referenced by exercises (one to many)
 
-	NAVIGATE TO:  \d gym_trips						19:00

-	Gym_trips only has 2 columns, id and date. It references sets, which references exercises to populate its tables.

-	One of the big lessons from this project has been how starting with a simple idea soon morphs out into more unwieldy complexity. So for example at the beginning I intended to have another table for the muscle groups trained by each exercise. This would have had a one to many relationship with exercises, because one exercise can train multiple muscles and different muscles are trained by multiple exercises. Each exercise would link to this table on a many-to-many relationship so for instance whenever pull-ups was displayed the information that it trains back and biceps would appear. I could have just included this information as columns in the exercises table, but it would have meant lots of duplication. In the end it was simply too complicated and unnecessary. 

QUERIES: 								21:00
-	NAVIGATE TO:  database_persistence line 76 (#five_rows _for_exercises_averages)

-	Here I Pushed queries down to the database.
-	The queries themselves I wrote quite generally and then made them more specific. I know SQL is more efficient at sorting data that Ruby would have been, so I made my queries precise.
-	THIS IS AN EXAMPLE OF…

- Optimizing SQL queries

-	I wanted to avoid N+1:  This is a type of query which involves making a separate query for each item in a collection. It is not considered an efficient way of gathering data. An example would be selecting every entry from a table only to count them in the ruby program and use that number.
-	WHERE clauses – limit it to just data that we want.
-	Count in the database is more efficient. In the example below I’m making PG do the heavy lifting by joining three tables. And doing all the sorting within the query. I only want entries corresponding to the gym_trip_id I pass in. I’m careful to name the columns, especially id  so there’s no confusion (there are 4 tables and so 4 different ids in the program to confuse). 
-	The offset allows me to only take the results for that page, rather than calling for all the rows in the gym trip and then afterwards sorting to the 5 I need in the Ruby program.


- Using static assets						23:00
-	NAVIGATE TO:  http://localhost:4567/gym_trip/edit/8/1
-	
-	My static assets were just the css files for this application. I didn’t provide any images or javascript. If I were to, I would want to have some javascript that autopopulated the exercises field as the user typed, like on a google-search form. 
-	At the moment the safest way to process user input for exercises is by having them input the id number, which requires them to look up the exercise first. I could have also included images of each exercise, for better User Experience. But it was outside of the requirements of this project. 

- Working with the request/response cycle					25:00
-	NAVIGATE TO:  my_gym.rb line 170

This was really made very simple by Sinatra, which has a built-in DSL for routing and passes requests to the server via Rack.

- Know how and when to use GET and POST requests correctly	26:00

-	Sinatra POST methods correspond to HTTP post requests and are for sending user input to the program. GET methods are for retrieving resources from a specified source. 

- Using redirects properly						27:00
-	NAVIGATE TO:  my_gym.rb line 72

-	As a general pattern redirects happen after adding or updating information. Also successful requests are rendered by erb view-helpers and unsuccessful requests tend to be redirected, so the problem can be fixed. 


- Understand and know how to mitigate security risks that can affect HTTP and SQL

-	NAVIGATE TO:  my_gym.rb line 15
-	Sanitize my inputs
-	Escape HTML





Mistakes I won’t bring up, but should be ready to talk about:

Why did you include a config.ru file? In most cases it wouldn’t be necessary to have a `config.ru` file here. Sinatra gives Rack all the information it needs to configure the app and connect to the server. I included one to take care of browsers requesting a `favicon` file, which is a problem I’ve encountered in the past. 

Why did you include a Procfile ?

The Procfile is there for any web-hosting platform  which in the future might hsot this app. In a procfile one specifies which processes need to be started up when the program begins for instane the app’s web-server, which here is WEBrick. But just running locally this Procfile isn’t being used.

Why didn’t you include ‘require_signed_in_user` in the before block? 
-	I would do it like that .

Why didn’t you use Sinatra’s `not_found` method instead of `get/*`

-	That would have been better.

What’s up with the `require Sinatra/reload`

-	To be used in a development environment.  With ‘also_reload’

 What’s up with the ‘db.disconnect`?

-	Heroku only allows a limited number of connections ? 

Questions they might ask:

Explain the string interpolation here:

 

-	The curly bracket string interpolation  was an adjustment made by Rubocop. When I called `rubocop -A` it made thee adjustments. As I understand it it is a more explicit way of including spaces in and SQL query, but they aren’t actually necessary. I think I just ran Rubocop with some traiuling spaces on my SQL query. I’ve since run the program without them and it still functions, so I would remove them.

What is Rack::Lint ? 

-	A debugging program offered by Rack which helps with debugging by running runtime checks and issuing warnings when the program does not conform to Rack requirements. 

Can you think of any improvements you could make?

-	`not_found` method for unknown pages.
-	Require_signed in user’ in before block
-	Javascript for inputing exercise names
-	The logical next steps: package it as a gem, host it on Heroku.
-	Add tests
-	Have the side-nav render in layout.erb and different links render with content_fors
-	Are you sure you want to delete?
![image](https://github.com/SandyRodger/RB185-RB189/assets/78854926/a655c45e-51de-4203-a0bb-826a3bd749df)


## Feedback 

- Use git-branches
  - So when you're trying to build a new feature and it doesn't work yo don't have to control-z a million times
- include testing to make it easier for yourself
  - So you're not breaking old things with new things
- Practice more
  - I seemed like I hadn't practiced enough
- I went over-time
- I presented the code when I should have presented the app
- I wasn't fluent with screen-sharing on Slack and made mistakes and fumbled.
