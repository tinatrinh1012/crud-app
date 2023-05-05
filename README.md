# Full Stack Crud App (Vue.js, Node.js, and PostgreSQL)
This project is a full-stack web app that connects with Postgres database of jobs and displays table of data. In addition, the app can search, filter, create, update, and delete job record.

## Table of Contents
- [Environment Setup](#environment-setup)
- [Install and Run the Program](#install-and-run-the-program)

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

### Installation

```sh
$ git clone https://github.com/tinatrinh1012/crud-app.git

// navigate to project directory
$ cd crud-app

// navigate to server directory
$ cd server

// set up database
$ psql -U postgres -f .\crud_db.sql

// install packages in server directory
$ npm install

// navigate to client directory from server directory  and install packages
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

This database design decision allows for consistent data update and insert as well as less storage since `jobs` table now only store record id integer value instead of literal strings like the denormalized version.

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