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

ActiveRecord::Schema.define(version: 20150619073239) do

  create_table "donations_orgs", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,   null: false
    t.string   "name",          limit: 255, null: false
    t.integer  "cu_id",         limit: 4,   null: false
    t.datetime "registered_at",             null: false
    t.string   "status",        limit: 255
    t.float    "budget",        limit: 24,  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "donations_orgs", ["user_id"], name: "index_donations_orgs_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,   null: false
    t.string   "partner",     limit: 255, null: false
    t.integer  "cu_id",       limit: 4,   null: false
    t.integer  "order_type",  limit: 4,   null: false
    t.float    "total_price", limit: 24,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.datetime "ordered_at"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "orders_products", id: false, force: :cascade do |t|
    t.integer "order_id",   limit: 4, null: false
    t.integer "product_id", limit: 4, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",         limit: 255,             null: false
    t.float    "current_cost", limit: 24,              null: false
    t.integer  "cu_id",        limit: 4,               null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "total_orders", limit: 4,   default: 0
  end

  create_table "users", force: :cascade do |t|
    t.integer  "cu_id",         limit: 4,               null: false
    t.string   "name",          limit: 255,             null: false
    t.string   "email",         limit: 255,             null: false
    t.string   "location",      limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.datetime "registered_at"
    t.integer  "orders_count",  limit: 4,   default: 0
  end

  add_foreign_key "donations_orgs", "users"
  add_foreign_key "orders", "users"
end
