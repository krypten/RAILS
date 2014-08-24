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

ActiveRecord::Schema.define(version: 20140416054234) do

  create_table "audi_infos", force: true do |t|
    t.integer  "screen_no"
    t.string   "seat_no"
    t.integer  "Pricing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audi_infos", ["Pricing_id"], name: "index_audi_infos_on_Pricing_id"

  create_table "billing_infos", force: true do |t|
    t.date     "bill_date"
    t.integer  "CardInfo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_infos", ["CardInfo_id"], name: "index_billing_infos_on_CardInfo_id"

  create_table "card_infos", force: true do |t|
    t.string   "card_no"
    t.string   "card_holdername"
    t.date     "card_exp_date"
    t.integer  "card_pin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "couriers", force: true do |t|
    t.string   "receiver_name"
    t.string   "contact_no"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logins", force: true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "User_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logins", ["User_id"], name: "index_logins_on_User_id"

  create_table "movies", force: true do |t|
    t.string   "movie_name"
    t.text     "description"
    t.time     "duration"
    t.string   "image_url"
    t.string   "language"
    t.string   "certificate"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "quantity"
    t.decimal  "total_amount"
    t.boolean  "payment_success"
    t.string   "mode_of_collection"
    t.integer  "Courier_id"
    t.integer  "BillingInfo_id"
    t.integer  "User_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["BillingInfo_id"], name: "index_orders_on_BillingInfo_id"
  add_index "orders", ["Courier_id"], name: "index_orders_on_Courier_id"
  add_index "orders", ["User_id"], name: "index_orders_on_User_id"

  create_table "pricings", force: true do |t|
    t.string   "seat_type"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "Viewing_id"
    t.date     "show_date"
    t.integer  "Order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["Order_id"], name: "index_tickets_on_Order_id"
  add_index "tickets", ["Viewing_id"], name: "index_tickets_on_Viewing_id"

  create_table "tmps", force: true do |t|
    t.string   "k"
    t.string   "h"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "viewings", force: true do |t|
    t.integer  "Movie_id"
    t.integer  "AudiInfo_id"
    t.time     "timing"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "viewings", ["AudiInfo_id"], name: "index_viewings_on_AudiInfo_id"
  add_index "viewings", ["Movie_id"], name: "index_viewings_on_Movie_id"

end
