# Crawler-Database

Database tables and functions for Redback Crawler capstone project RMIT

If you wish to set up the database from scratch you have two options:

    1: Use a tool such as PGadmin and backup the existing database running on Elephant SQL and restore it to a new host.
    
    2: Copy the contents of All_Tables.sql into a postgres terminal, note the tables are layed out in the file in a specifc order so that table constraints are met.
        Once tables are created, do the same with All_Functions.sql
        
## Running Locally with Docker

A simple dockerfile is provided for running up a local dev PG server. 

Build the dockerfile `docker built -t jack/crawler-db .`

Run with `docker run -d -p 5432:5432 jack/crawler-db`

Use a tool such as PSQL to connect (`psql -h localhost`)

Once connected with PSQL create a db: `create database crawler`, switch to it `\c crawler` and populate functions and tables.
