# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_06_184732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "oscar"
    t.integer "nominations"
  end

  create_table "movies", force: :cascade do |t|
    t.bigint "director_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.boolean "oscar"
    t.integer "nominations"
    t.index ["director_id"], name: "index_movies_on_director_id"
  end

  create_table "vegetable_gardens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "summer_garden"
    t.boolean "winter_garden"
    t.integer "hrs_of_sun"
  end

  create_table "vegetables", force: :cascade do |t|
    t.bigint "vegetable_garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "summer_harvest"
    t.boolean "winter_harvest"
    t.integer "min_hrs_sun"
    t.index ["vegetable_garden_id"], name: "index_vegetables_on_vegetable_garden_id"
  end

  add_foreign_key "movies", "directors"
  add_foreign_key "vegetables", "vegetable_gardens"
end
