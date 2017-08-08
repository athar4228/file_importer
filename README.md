# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    `2.4.0`

* System dependencies

       * Database => `mysql`

* Database creation  `rake db:create`

* Database initialization
   `rake db:migrate`

* How to run the test suite
   `rspec`

* Services (job queues, cache servers, search engines, etc.)
   `No external Services are used`

* Deployment instructions
     * Generate secrets using `rake secret` and set that in environment for production server against `SECRET_KEY_BASE` key
     * run `bundle install` command
     * run `rake assets:precompile` for precompiling assets
