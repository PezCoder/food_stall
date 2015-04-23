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

ActiveRecord::Schema.define(version: 20150423192242) do

  create_table "foods", force: :cascade do |t|
    t.integer  "vendor_id",       limit: 4
    t.string   "name",            limit: 50
    t.string   "category",        limit: 50
    t.integer  "price",           limit: 4
    t.boolean  "available",       limit: 1
    t.datetime "order_date_time"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "foods", ["vendor_id"], name: "index_foods_on_vendor_id", using: :btree

  create_table "foods_users", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "food_id", limit: 4
  end

  add_index "foods_users", ["user_id", "food_id"], name: "index_foods_users_on_user_id_and_food_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 100,   null: false
    t.string   "name",            limit: 50
    t.string   "city",            limit: 50
    t.string   "address",         limit: 255
    t.string   "phone_no",        limit: 10
    t.text     "password_digest", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "email",           limit: 100,   null: false
    t.string   "name",            limit: 50
    t.string   "tag_line",        limit: 255
    t.string   "city",            limit: 50
    t.string   "phone_no",        limit: 10
    t.text     "password_digest", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "vendors", ["email"], name: "index_vendors_on_email", using: :btree

end
