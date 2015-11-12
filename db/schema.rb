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

ActiveRecord::Schema.define(version: 20151112144726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bar_categories", force: :cascade do |t|
    t.integer  "bar_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bar_categories", ["bar_id"], name: "index_bar_categories_on_bar_id", using: :btree
  add_index "bar_categories", ["category_id"], name: "index_bar_categories_on_category_id", using: :btree

  create_table "bars", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "city_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  add_index "bars", ["city_id"], name: "index_bars_on_city_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.date     "ends_on"
    t.string   "message"
    t.string   "voucher"
    t.boolean  "complete",            default: false
    t.integer  "gift_id"
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "friend_name"
    t.string   "friend_email"
    t.string   "friend_phone_number"
    t.string   "token"
  end

  add_index "bookings", ["gift_id"], name: "index_bookings_on_gift_id", using: :btree
  add_index "bookings", ["token"], name: "index_bookings_on_token", unique: true, using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "gifts", ["bar_id"], name: "index_gifts_on_bar_id", using: :btree

  create_table "partners", force: :cascade do |t|
    t.integer  "bar_id"
    t.string   "iban"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "partners", ["bar_id"], name: "index_partners_on_bar_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "phone_number"
    t.string   "address"
    t.integer  "partner_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["partner_id"], name: "index_users_on_partner_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bar_categories", "bars"
  add_foreign_key "bar_categories", "categories"
  add_foreign_key "bars", "cities"
  add_foreign_key "bookings", "gifts"
  add_foreign_key "bookings", "users"
  add_foreign_key "gifts", "bars"
  add_foreign_key "partners", "bars"
  add_foreign_key "users", "partners"
end
