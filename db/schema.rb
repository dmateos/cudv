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

ActiveRecord::Schema.define(version: 20150610164949) do

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "partner",     limit: 255
    t.integer  "cu_id",       limit: 4
    t.integer  "order_type",  limit: 4
    t.float    "total_price", limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "orders_products", id: false, force: :cascade do |t|
    t.integer "order_id",   limit: 4
    t.integer "product_id", limit: 4
  end

  add_index "orders_products", ["order_id"], name: "index_orders_products_on_order_id", using: :btree
  add_index "orders_products", ["product_id"], name: "index_orders_products_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.float    "current_cost", limit: 24
    t.integer  "cu_id",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "cu_id",      limit: 4
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "location",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "orders", "users"
end
