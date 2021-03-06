# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151030235934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itineraries", force: :cascade do |t|
    t.date     "start_date",   null: false
    t.date     "end_date",     null: false
    t.string   "country_code", null: false
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "itineraries", ["country_code"], name: "index_itineraries_on_country_code", using: :btree
  add_index "itineraries", ["user_id"], name: "index_itineraries_on_user_id", using: :btree

  create_table "itinerary_items", force: :cascade do |t|
    t.date     "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "city"
    t.string   "place"
    t.integer  "itinerary_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "itinerary_items", ["itinerary_id"], name: "index_itinerary_items_on_itinerary_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

  create_table "wish_item_images", force: :cascade do |t|
    t.string   "image",        null: false
    t.integer  "wish_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "wish_item_images", ["wish_item_id"], name: "index_wish_item_images_on_wish_item_id", using: :btree

  create_table "wish_items", force: :cascade do |t|
    t.text     "description",       null: false
    t.integer  "itinerary_item_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "wish_items", ["itinerary_item_id"], name: "index_wish_items_on_itinerary_item_id", using: :btree

  add_foreign_key "itineraries", "users"
  add_foreign_key "itinerary_items", "itineraries"
  add_foreign_key "wish_item_images", "wish_items"
  add_foreign_key "wish_items", "itinerary_items"
end
