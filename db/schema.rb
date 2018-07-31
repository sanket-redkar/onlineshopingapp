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

ActiveRecord::Schema.define(version: 20180729161734) do

  create_table "accessories", force: :cascade do |t|
    t.string   "serial_number"
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "modal_id"
    t.string   "data"
    t.float    "price"
    t.text     "description"
    t.date     "bought_date"
    t.date     "sold_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "product_details", force: :cascade do |t|
    t.integer  "model_id"
    t.float    "price"
    t.integer  "shoping_card_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "source_name"
    t.integer  "source_id"
    t.integer  "source_type"
  end

  add_index "product_details", ["shoping_card_id"], name: "index_product_details_on_shoping_card_id"

  create_table "products", force: :cascade do |t|
    t.string   "serial_number"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "modal_id"
    t.integer  "strings"
    t.float    "price"
    t.text     "description"
    t.string   "type"
    t.date     "bought_date"
    t.date     "sold_date"
    t.integer  "brand_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id"

  create_table "shoping_cards", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shoping_cards", ["user_id"], name: "index_shoping_cards_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "source_name"
    t.integer  "source_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
