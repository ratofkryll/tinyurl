# TinyURL Clone

### Installation

* Uses Ruby 3.0.1 & Rails 6.1.4.1
* Fork the repo from Github
* cd into `tinyurl`
* `bundle install`
* `npm install`
* If your local database requires login, uncomment "username" and "password" in database.yml and update with your credentials
  * It is best to create an .env file to store these credentials using ENV["your_credential_name"] to avoid committing them to version control
* `rails db:create`
* `rails db:migrate`
* `rails db:seed`
* `rails server`

### Notes

* User authentication is not required in the spec, so I won't include it to avoid overcomplicating the assignment.
* Given that there is no user authentication, it makes sense to add a uniqueness validation for URLs and redirect the user to the existing record for that URL, rather than creating a new shortened URL.
* No length was specified for the shortened URL, so I decided to challenge myself and, instead of keeping the short_url column on urls, based the shortened URL on the url's index. This ensures that the short URL will never be duplicated.
* Removed Turbolinks - it caused a bug which created duplicate views and otherwise didn't provide any major benefit to this particular project.
