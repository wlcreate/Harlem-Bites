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

ActiveRecord::Schema.define(version: 2020_08_18_163945) do

  create_table "reservations", force: :cascade do |t|
    t.integer "party_size"
    t.datetime "date"
    t.integer "guest_id"
    t.integer "restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.integer "seating_capacity"
    t.string "address"
    t.string "telephone"
    t.time "open_time"
    t.time "close_time"
    t.string "cuisine"
    t.string "pricey"
    t.string "stars"
  end

  create_table "safety_precautions", force: :cascade do |t|
    t.string "cleaning_sanitizing"
    t.string "social_distancing"
    t.string "ppe"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "phone_number"
  end

end
