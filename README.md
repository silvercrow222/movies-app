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

# DB設計

## movies table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|details|text||
|evaluation|float||
### association
- has_many :genres
- has_many :genre_movies
- has_many :ends
- has_many :end_movies
- has_many :eras
- has_many :era_movies


## genres table
|Column|Type|Options|
|------|----|-------|
|attribute|string|null: false|
### association
- has_many :movies
- has_many :genre_movies

## genre_movies table
|Column|Type|Options|
|------|----|-------|
|movie_id|integer|null: false, foreign_key: true|
|genre_id|integer|null: false, foreign_key: true|
### association
- belongs_to :movie
- belongs_to :genre


## ends table
|Column|Type|Options|
|------|----|-------|
|attribute|string|null: false|
### association
- has_many :movies
- has_many :end_movies

## genre_movies table
|Column|Type|Options|
|------|----|-------|
|movie_id|integer|null: false, foreign_key: true|
|end_id|integer|null: false, foreign_key: true|
### association
- belongs_to :movie
- belongs_to :end


## eras table
|Column|Type|Options|
|------|----|-------|
|attribute|string|null: false|
### association
- has_many :movies
- has_many :era_movies

## genre_movies table
|Column|Type|Options|
|------|----|-------|
|movie_id|integer|null: false, foreign_key: true|
|era_id|integer|null: false, foreign_key: true|
### association
- belongs_to :movie
- belongs_to :era
