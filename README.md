# Full Stack CRUD App (Vue.js, Node.js, and PostgreSQL)
This project is a full-stack web app that connects with Postgres database of jobs and displays table of data. In addition, the app can search, filter, create, update, and delete job record.

## Table of Contents
- [Environment Setup](#environment-setup)
- [Install and Run the Program](#install-and-run-the-program)
- [Design Decision Overview](#design-decision-overview)
- [Programming Languages and Technology Choice](#programming-languages-and-technology-choice)
- [Process for verifying the correctness of the program](#process-for-verifying-the-correctness-of-the-program)
- [Features to implement with more time](#features-to-implement-with-more-time)

## Environment Setup

To run the program, you need Node.js, NPM (Node Package Manager), and PostgreSQL installed in your environment.

### Node.js and NPM

Install [Node.js](https://nodejs.org/en) if you don’t already have it installed. NPM will be included with Node.js installation. Verify if you have successfully installed Node.js and NPM by running the following command in your terminal or command prompt

```sh
$ node --version

$ npm --version
```

### PostgreSQL

Install PostgreSQL using [PostgreSQL packages and installer from EDB](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads). If you’re on a Mac, you can also choose to download and install [PostgresApp](https://postgresapp.com/) instead. I use PostgresApp because it was quick and easy to set up.

#### Using PostgreSQL EDB installer

Follow [installation instructions for your operating system](https://www.enterprisedb.com/docs/supported-open-source/postgresql/installer/02_installing_postgresql_with_the_graphical_installation_wizard/).

We don’t need pgAdmin 4 and Stack Builder to run this app. In the “Select Components” step, you can choose to uncheck those items when installing to make the installation process faster.

Accept the default option for Installation Directory, Data Directory, Port (default port is 5432), and Locale.

Set password to be “123456”. You can set a different password if you’d like, but you’ll need to change the password value in server/db.js.

#### Using PostgresApp on MacOS

Follow [installation instructions for PostgresApp](https://postgresapp.com/).

#### Verify PostgreSQL Installation

Verify if you have successfully installed PostgreSQL by running “psql -U postgres” in the terminal or command prompt, and it should take you to a psql shell.

Enter `\l` and you should see a list of databases.

Enter `\q` to quit psql shell.

Here’s an example of how it should look like in your terminal

<img width="819" alt="image" src="https://user-images.githubusercontent.com/68746212/236375231-9dfc728e-e6b4-4cd0-8a11-6534eeaf07ab.png">

## Install and Run the Program

### Install project and setup database

```sh
$ git clone https://github.com/tinatrinh1012/crud-app.git

# navigate to project directory
$ cd crud-app

# navigate to server directory for database setup
$ cd server

# run crud_db.sql to set up database
# if on mac OS
$ psql postgres < crud_db.sql
# if on window OS
$ psql -U postgres -f .\crud_db.sql


# install node packages in server directory
$ npm install

# navigate to client directory from server directory and install node packages
$ cd ..
$ cd client
$ npm install

```

### Run the program

To start the server, navigate to server directory and run `node server.js

<img width="818" alt="image" src="https://user-images.githubusercontent.com/68746212/236375318-7e2a32e3-4a75-4427-8253-dbd533927266.png">


Open another terminal or command prompt, navigate to the client directory and run `npm run serve`

<img width="799" alt="image" src="https://user-images.githubusercontent.com/68746212/236375366-743d4a99-997d-44eb-9eee-a8c9400dba94.png">

Go to [http://localhost:8080/](http://localhost:8080/) on your browser to open and run the app.


## Design Decision Overview

### PostgreSQL Database

Separate given data into 6 tables

- jobs
- mfr
- type
- style
- color
- size

Each record in `jobs` table store record id of mfr, type, style, color, and size as foreign keys that reference a unique record in `mfr`, `type`, `style`, `color`, and `size` tables. Since all columns in `jobs` table reference a record in another table, except for `ID` column, job records cannot have null value.

This database design decision allows for

- Consistent data update and insert
- Less database storage since `jobs` table now only store record id integer value instead of literal strings like the denormalized version

However, it's more expensive on database query because we have to join multiple tables to display desired table output.

### Server

Backend API end-points include

- GET all jobs
- GET job by ID
- GET all mfr
- GET all type
- GET all style
- GET all color
- GET all size
- POST create a job
- PUT update a job by ID
- DELETE a job by ID

### UI/UX

Frontend features include

- Table of job data
- Search by job ID, style ID, and color number
- Filter by manufacturer, type, style, color, and size using drop-down list
- Create new job form (all fields are required because a job record must reference an existing unique value in mfr, type, style, color, size tables)
- Update job form by ID
- Delete job button


## Programming Languages and Technology Choice

- Node.js for server-side application because it's simple, quick to set up, and easier to write. For this sample app, setting up a robost framework like Java is not efficient since Java code is pretty verbose and requires more time to set up.

- Vue.js for front-end application because it's simple, easy to use, and I'm more familiar with Vue.js than React.js at the moment. Since I only had 2 weeks for the project, I wanted to use something I'm comfortable with and find ways to optimize instead of figuring out a new framework and not have time to optimize.

- Foundation CSS framework for styling because they have an easy-to-use grid system that can dynamically adjust for different screen sizes. In addition, Foundation default styling is good enough for this sample app.

- PostgreSQL for database simply because this is the only relational database management system that I've learned.


## Process for verifying the correctness of the program

- Test API endpoints by using Postman to make requests to the server application and verify expected response
- Test connection with database by making API request that sends a query to database and verify that the database is updated correctly or sends back the right data as if we were to enter the same query in psql shell
- Use Vue Devtools (browser devtools extension for Vue.js) to debug Vue.js app during development and verify that states are updated correctly
- Use browser developer tools like console, network, and elements to debug full-stack application functionality and errors, such as verfiying what requests were made when a frontend event happens and response from server.

- Functionality manual test

    - Frontend app routing to different views
    - Display jobs table properly
    - Create a new job, which require all fields to be filled, and verify database update that should reflect on frontend data table
    - Update an existing job information and verify results in database
    - Delete a job and verify results in database
    - Search records by job ID, style ID, and color number and verify display results
    - Filter by manufacturer, type, style, color, and size and verify display results

## Features to implement with more time

- Currently, the app's search and filter logic is on the frontend because it was easier and faster to implement, not having to send data to the server, query database, and wait for response. With more data and more users accessing the app at the same time, I would filter and search on the server side, return data with limit, and implement pagination feature on the frontend. This way, we'll reduce web traffic and avoid writing the same logic again if we want to implement the same filter and search somewhere else.
- Ability to add new and unique value for `mfr`, `type`, `style`, `color`, and `size` when creating or updating a job record. Currently, the app only allow for creating or updating job record with existing value in `mfr`, `type`, `style`, `color`, and `size`
- For more complex application, the query would be abstracted out in a separate layer from controller files
- More appropriate error code return for different situation
- Nice success, warning, and error message callout when creating, updating, or deleting job record
- Add unit tests for reliability
