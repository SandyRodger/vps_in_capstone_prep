# Presentation

## [1	Assessment Format](https://launchschool.com/lessons/67daf349/assignments/7758362c)

PRESENTATION (NOT INTERVIEW) (40 minute maximum)

Once you pass the project assessment, you can book a time for your presentation. Most presentations will take about 20-30 minutes, but may go a little longer. The presentation will consist primarily of a talk by you that discusses certain aspects of your project, and will also include a demonstration of the base functionality. We will usually use a video call program with screen sharing, such as Zoom. The presentation mainly focuses on your communication and presentation abilities.

Note that the requirements for the presentation will be given to you as part of the requirements for the project. This will give you plenty of time to prepare and be ready to present when you meet with the interviewer.

## [2. Study Guide: Assessment Project](https://launchschool.com/lessons/67daf349/assignments/52052d50)

The assessment project will test your knowledge of the concepts required to build WEB-based applications using Ruby, Sinatra, ERB, and PostgreSQL. The project is generally free form but with certain minimal behaviors and features. We will describe those when you start the project. At a minimum, you should be ready to:

- write a Ruby application using Sinatra
- write enough ERB code to display your application in a browser. Your ERB code will likely be less complex than that used in the RB175/RB185 projects. You may need to learn some HTML via LS202 before starting the project. We will not grade your ERB code other than checking that it works.
- create Gemfile and Gemfile.lock files so your grader can run the code on their system
- provide the SQL needed to create and seed any databases you require.
- you do not need CSS if you do not want to use it. We do not require a pretty application for this project.
- save your project in a zip file and upload it after completing the project
- You will receive additional information and requirements once you start the project.

### Important Topics You Need to Study:

- Writing Sinatra applications
- Writing ERB code
- Using view variables and helpers
- Using and writing routes
- Sessions and persistence
- Using SQL
  - designing a schema: https://launchschool.com/lessons/421e2d1e/assignments/e3e8c87e
- Optimizing SQL queries
- Validation and Flash messages
- Using static assets
- Working with the request/response cycle
- Know how and when to use GET and POST requests correctly
- Using redirects properly
- Maintaining state
- Understand and know how to mitigate security risks that can affect HTTP and SQL

## [4. Project]

Presentation Assessment Requirements

You will use this project in the RB189 presentation assessment. You should prepare your presentation before scheduling the presentation. Be sure to consider the presentation requirements as you work on your project:

- The presentation should last between 15 and 20 minutes. Be sure to rehearse your presentation beforehand to ensure you're not going to fall short or go over the time limit. Do not rehearse your presentation with other Launch School students.
- The presentation will be conducted using Zoom or similar software with screen sharing.
- If you decide to do a live demonstration of your project, you will also need your browser.
- Your presentation should include slides (3 minimum). You can use something like Powerpoint, Keynote, Google Slides, or any other similar application.
- You should discuss the following during your presentation:
- What need does your application satisfy?
- Who is the target audience?
- How does your application satisfy that need?
- Demonstrate the key features of your application.
- You do not have to demonstrate all features.
- The demonstration can be live, or it can use static screenshots.
- How do the demonstrated features address the needs you tried to satisfy?
- What challenges did you encounter during development?
- What insights or lessons learned did you have during development?
- Following the presentation, the interviewer may ask you some additional questions. The questions will be about the project and your experiences working on the project.

## [5. Study Guide: Assessment Presentation or Interview](https://launchschool.com/lessons/67daf349/assignments/9988e7f0)

Study Guide for the Presentation:

The presentation requirements are outlined in the requirements for your RB189 project assessment. Please review those requirements and prepare a presentation that meets those requirements. Please do not schedule your presentation assessment until you are ready to make the presentation.

There are no study requirements for the presentation. We will primarily focus on your communication, professionalism, composure, and presentation skills.

We will use Slack or Zoom or similar software for the presentation. You can expect to use screen sharing for your presentation.

The entire assessment session should last about 40-45 minutes. However, your formal presentation (excluding questions the interviewer may ask you) should be between 15 and 20 minutes. Going under or over the time limit may affect your grade, so be sure to rehearse before the assessment begins.


TIMINGS:

The presentation itself should be 15-20 minutes, but there maybe another 10-20 minutes of questions from the interview.


## To research:

### Writing Sinatra applications

- I  chose to pass information as individual path parameters, rather than using the `?rolls=2&sides=6` way. ([link](https://launchschool.com/lessons/cac53b94/assignments/4d46009e) 

I reviewed:

| Course | Lesson | when finished | link |
| :---: | :--- | :---: | :---: |
| RB175 | 1 Intro and prerequisites| 3.2.24 |[here](https://github.com/SandyRodger/RB175_networked_applications/blob/main/01_introduction_and_prerequisites.md )|
| RB175 | 2 Handling Requests manually|3.2.24|[here](https://github.com/SandyRodger/RB175_networked_applications/blob/main/02_handling_requests_manually.md)|
| RB130 | 3 Packaging code into a project| 4.2.24| [here](https://github.com/SandyRodger/RB130-139/blob/main/lesson_3_packaging_code_into_a_project.md)|
| RB175 |3 Working with Sinatra|8.2.24|[here](https://github.com/SandyRodger/RB175_networked_applications/blob/main/03_working_with_sinatra.md)|
| RB175 |4 Deploying Sinatra Applications|15.2.24|[here](https://github.com/SandyRodger/RB175_networked_applications/blob/main/04_deploying_sinatra_applications.md)|
| RB175 |5 Project Todos (THIS CAN BE A TEMPLATE FOR YOU PRESENTATION)|17.2.24|[here](https://github.com/SandyRodger/RB175_networked_applications/blob/main/05_project_todos.md)|
| RB175 |6 Securing Applications|21.2.24|[here](https://github.com/SandyRodger/RB175_networked_applications/blob/main/06_securing_applications.md)|
| RB175 |8 CMS project|21.2.24|[here](https://github.com/SandyRodger/RB175_networked_applications/blob/main/08_project_file_based_CMS.md)|
| RB185 |1 Interacting with a database in code|21.2.24|[here](https://github.com/SandyRodger/RB185-RB189/blob/main/L1_interacting_with_a_database_in_code.md)|
| RB185 |2 Database backed web applications||[here](https://github.com/SandyRodger/RB185-RB189/blob/main/L2_database_backed_web_applications.md)|
| RB185 |3||[here](https://github.com/SandyRodger/RB185-RB189/blob/main/L3_optimisation.md)|



### Writing ERB code

- https://launchschool.com/blog/growing-your-own-web-framework-with-rack-part-3
- https://launchschool.com/lessons/c3578b91/assignments/d6969b5b

### Using view variables and helpers

### Using and writing routes

- I should have put the `require_signed_in_user` method in the before block rather than at the beginning of every GET method. Because before blocks are for things that should be run before every request to an application (Say this?)

### Sessions and persistence

- You enable sessions, but only for flash messages.
### Using SQL
Safely handle inserting parameters into SQL statements with PG::Connection#exec_params.
### Optimizing SQL queries (https://launchschool.com/lessons/ce10b313/assignments/bf18ccc5)
- "I joined these tables to minimise queries needed"
### Validation and Flash messages
### Using static assets
### Working with the request/response cycle
### Know how and when to use GET and POST requests correctly
### Using redirects properly
### Maintaining state
### Understand and know how to mitigate security risks that can affect HTTP and SQL
https://launchschool.com/lessons/31df6daa/assignments/d98e4174

## Questions:

- Where is 'port 4567' coming from?
  - It's the standard Sinatra port. You can specify others, but if you don't this will be the one used.

## To Do:

- Draw a flow-chart of RackUp apps
- Go through 'to research' topics and find links for all the relevant sections.
  - First look through your own notes.

## My breakdown of the assessment:

18 minutes : Me giving the assessor a walk through on my gym app via zoom, with a 3 slides minimum PowerPoint presentation!
15 minutes : The assessor asking me to explain concepts covered in the curriculum as they appear in my app.

## Discuss with Olly:

- Should I talk about the mistakes I've caught in preparing this presentation?

## other notes:

- Remember, all these Sinatra commands you take for granted, like `redirect` are built-in methods.
- Should I have added comments to my routes?
- This [link](https://launchschool.com/lessons/9230c94c/assignments/7d7b4dd7) covers the following:
  - why we prevent the sinatra reloader during development
  - How/why we add puma gem, but only in production
  - What's up with the config.ru file
  - What's up with the Procfile
