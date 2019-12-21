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

ActiveRecord::Schema.define(version: 2019_12_20_001232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "login", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_admins_on_login", unique: true
  end

  create_table "bill_requests", force: :cascade do |t|
    t.bigint "manager_id"
    t.bigint "bill_id"
    t.date "approved_at"
    t.boolean "approved_status", default: false
    t.string "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_requests_on_bill_id"
    t.index ["manager_id"], name: "index_bill_requests_on_manager_id"
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "bill_type", null: false
    t.float "amount", default: 0.0, null: false
    t.decimal "percent", default: "0.0"
    t.datetime "close_at"
    t.datetime "replenishment_at"
    t.float "regular_replenishment_amount", default: 0.0
    t.datetime "expired_bill_at"
    t.boolean "close_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "post_code"
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "short_code", default: "", null: false
    t.string "phone_code", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_code"], name: "index_countries_on_short_code", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "manager_notifications", force: :cascade do |t|
    t.bigint "manager_id"
    t.bigint "bill_id"
    t.string "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_manager_notifications_on_bill_id"
    t.index ["manager_id"], name: "index_manager_notifications_on_manager_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "full_name", default: "", null: false
    t.string "login", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_managers_on_slug", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "recipient_id", null: false
    t.float "amount", null: false
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_transactions_on_recipient_id"
    t.index ["sender_id"], name: "index_transactions_on_sender_id"
  end

  create_table "main", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.date "birthday", null: false
    t.string "gender", null: false
    t.string "phone", null: false
    t.boolean "is_deleted", default: false, null: false
    t.boolean "is_blocked", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "transactions", "bills", column: "recipient_id"
  add_foreign_key "transactions", "bills", column: "sender_id"
end
