# README

## Ruby version

2.4.1

## System dependencies

- MacOS for dev
- Ubuntu for prod

## Configuration

To setup dev environment:

    ./bin/setup

## Database creation

To create the database:

    ./bin/rails db:create

## Database initialization

To seed the database with test data:

    ./bin/rails db:seed

## How to run the test suite

To run all the specs:

    ./bin/rspec

To run all the cops:

    ./bin/rubocop

Or you can use guard to make it follow all your changes:

    ./bin/guard

## Heroku

To setup application:

    heroku addons:create heroku-postgresql

To deploy the project to Heroku:

    git push origin master

To open web site:

    heroku open
