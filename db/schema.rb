# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_25_025547) do

  create_table "end_movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "end_id"
    t.index ["end_id"], name: "index_end_movies_on_end_id"
    t.index ["movie_id"], name: "index_end_movies_on_movie_id"
  end

  create_table "ends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "attribute_end", null: false
  end

  create_table "era_movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "era_id"
    t.index ["era_id"], name: "index_era_movies_on_era_id"
    t.index ["movie_id"], name: "index_era_movies_on_movie_id"
  end

  create_table "eras", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "attribute_era", null: false
  end

  create_table "genre_movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "genre_id"
    t.index ["genre_id"], name: "index_genre_movies_on_genre_id"
    t.index ["movie_id"], name: "index_genre_movies_on_movie_id"
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "attribute_genre", null: false
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.text "details"
    t.float "evaluation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "end_movies", "ends"
  add_foreign_key "end_movies", "movies"
  add_foreign_key "era_movies", "eras"
  add_foreign_key "era_movies", "movies"
  add_foreign_key "genre_movies", "genres"
  add_foreign_key "genre_movies", "movies"
end
