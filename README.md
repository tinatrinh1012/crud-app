**************Environment Setup************** 

To run the program, you need Node.js, NPM (Node Package Manager), and PostgreSQL installed in your environment.   

******************************Node.js and NPM******************************

Install [Node.js](https://nodejs.org/en) if you don’t already have it installed. NPM will be included with Node.js installation. Verify if you have successfully installed Node.js and NPM by running the following command in your terminal or command prompt 

```sql
node --version

npm --version
```

**********************PostgreSQL********************** 

Install PostgreSQL using [PostgreSQL packages and installer from EDB](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads). If you’re on a Mac, you can also choose to download and install [PostgresApp](https://postgresapp.com/) instead. I use PostgresApp because it was quick and easy to set up. 

**PostgreSQL EDB installer**

Follow [installation instructions for your operating system](https://www.enterprisedb.com/docs/supported-open-source/postgresql/installer/02_installing_postgresql_with_the_graphical_installation_wizard/). 

We don’t need pgAdmin 4 and Stack Builder to run this app. In the “Select Components” step, you can choose to uncheck those items when installing to make the installation process faster. 

Accept the default option for Installation Directory, Data Directory, Port (default port is 5432), and Locale. 

Set password to be “123456”. You can set a different password if you’d like, but you’ll need to change the password value in server/db.js. 

******PostgresApp on MacOS******

Follow [installation instructions for PostgresApp](https://postgresapp.com/). 

Verify if you have successfully installed PostgreSQL by running “psql -U postgres” in the terminal or command prompt, and it should take you to a psql shell. 

Enter “\l” and you should see a list of databases. 

Enter “\q” to quit psql shell. 

Here’s an example of how it should look like in your terminal 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/27efd951-a26a-4695-bf28-e67a93ef7773/Untitled.png)

**********************Install and Run the program**********************

************************Installation************************

```sql
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

**Run the program**

To start the server, navigate to server directory and run “node server.js” 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a50eb0f2-81ef-4f73-8805-08138e942812/Untitled.png)

Open another terminal or command prompt, navigate to the client directory and run “npm run serve”

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0c08a737-c1d8-4421-b7c8-ceb9f3de63af/Untitled.png)

Go to [http://localhost:8080/](http://localhost:8080/) on your browser to open and run the app.
