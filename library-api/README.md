# Library API

You are in charge of creating an application for a library. The library contains several types of
books/media.

- General books
- Reference books
- Children’s books
- CD / DVD’s

Reference books cannot be checked out. General books can be checked for up to 1 week.
Children’s books can be checked out for up to 2 weeks. CD/DVDs are limited to 2 checkouts
per person and have double the late fee. Book late fees are $1.25 a day.

1. Show database table design and relationships
2. Design an API (consumed over http) to support the following:

    a. Search for book by author or title

    b. Checkout materials

    c. Get current overdue items for a customer

    d. Get overdue amount for a customer

    e. Fetch checkout history for a customer

    f. Fetch checkout history for a resource item

* Ruby version

    ruby 2.3.3

* System dependencies

    - MySQL
    - Rails
    - Nodejs

* Configuration

    1. Install Ruby and Rails.
    2. Install MySQL server and client (optional).
    3. Clone this repo and navigate into the application directory.
    4. Execute `bundle install` to install all gems.
    5. Create a database.yml file like the example but add your user and password to connect to MySQL.
    6. Execute `rails db:create && rails db:migrate && rails db:seed` to setup the Database.
    7. Execute `rails s` to start the server locally.

* How to run the test suite

    Execute `bundle exec rspec` to run all the test

* Database schema

```
   -------------   -------------------   -----------------   ----------------
   | CUSTOMERS |   | PRODUCTS        |   | PRODUCT_TYPES |   | CHECKOUTS    |
   -------------   -------------------   -----------------   ----------------
 |-| id        | |-| id              | |-| id            |   | id           |
 | | name      | | | name            | | | name          |   | customer_id  |>|
 | | phone     | | | author          | | | description   | |<| product_id   | |
 | | email     | | | genre           | | | location      | | | pickup_date  | |
 | | address   | | | publisher       | | | checkout_days | | | dropoff_date | |
 | | CUD       | | | published_date  | | | late_fee      | | | CUD          | |
 | ------------- | | description     | | | CUD           | | ---------------- |
 |               | | in_library      | | ----------------- |                  |
 |               | | product_type_id |>|                   |                  |
 |               | | CUD             |                     |                  |
 |               | -------------------                     |                  |
 |               |_________________________________________|                  |
 |                                                                            |
 |____________________________________________________________________________|

```
