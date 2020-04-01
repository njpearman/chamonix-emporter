# README

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
```
docker-compose down --rmi all  -v
docker-compose build web
docker-compose up
docker-compose exec web bin/rails db:migrate db:seed
```
