# TinyURL Clone

### Getting Started

* Uses Ruby 3.0.1 & Rails 6.1.4.1
* Fork the repo from Github
* cd into `tinyurl`
* `bundle install`
* `yarn install`
* If your local database requires login, uncomment "username" and "password" in database.yml and update with your credentials
  * It is best to create an .env file to store these credentials using ENV["your_credential_name"] to avoid committing them to version control
* `rails db:create`
* `rails db:migrate`
* `rails db:seed`
* `rails server`

### Notes

#### Assumptions

* User authentication is not required in the spec, so I won't include it to avoid overcomplicating the assignment.
* Given that there is no user authentication, it makes sense to add a uniqueness validation for URLs and redirect the user to the existing record for that URL, rather than creating a new shortened URL.

##

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
