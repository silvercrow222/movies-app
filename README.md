# What
Make the application to search for movies. It's base is often search application. Additionally, add original evaluation system into it.

# About
Sorry, this application is in the middle of been making. I kindly ask for your understanding.

# Technology used
This application uses the following open source packages:

<img width="531" src="https://user-images.githubusercontent.com/66307522/88165235-5a244d80-cc50-11ea-9012-f2c9222a056b.JPG">

# Database
## movies table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|details|text||
### association
- has_many :genres, thorugh: :genre_movies
- has_many :genre_movies
- has_many :ends, thorugh: :end_movies
- has_many :end_movies
- has_many :eras, thorugh: :era_movies
- has_many :era_movies
- has_many :evaluations


## users table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
### association
- has_many :evaluations


## evaluations table
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|
|movie_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### association
- has_many :users
- has_many :movies


## genres table
|Column|Type|Options|
|------|----|-------|
|attribute|string|null: false|
### association
- has_many :movies, thorugh: :genre_movies
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
- has_many :movies, thorugh: :end_movies
- has_many :end_movies

## end_movies table
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
- has_many :movies, thorugh: :era_movies
- has_many :era_movies

## era_movies table
|Column|Type|Options|
|------|----|-------|
|movie_id|integer|null: false, foreign_key: true|
|era_id|integer|null: false, foreign_key: true|
### association
- belongs_to :movie
- belongs_to :era
