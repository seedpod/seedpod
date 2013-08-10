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

ActiveRecord::Schema.define(version: 20130810070637) do

  create_table "admins", force: true do |t|
    t.string   "email",               null: false
    t.string   "encrypted_password",  null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true

  create_table "crops", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructions", force: true do |t|
    t.string   "summary"
    t.text     "detail"
    t.integer  "crop_id"
    t.integer  "pod_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ship",       default: false
  end

  add_index "instructions", ["crop_id"], name: "index_instructions_on_crop_id"
  add_index "instructions", ["pod_id"], name: "index_instructions_on_pod_id"

  create_table "pods", force: true do |t|
    t.date     "month"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",  default: false
    t.text     "summary"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "shipments", force: true do |t|
    t.integer  "pod_id"
    t.integer  "user_id"
    t.boolean  "shipped",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shipments", ["pod_id"], name: "index_shipments_on_pod_id"
  add_index "shipments", ["user_id"], name: "index_shipments_on_user_id"

  create_table "subscriptions", force: true do |t|
    t.string   "gocardless_id"
    t.integer  "user_id"
    t.datetime "cancelled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "address_street"
    t.string   "address_locality"
    t.string   "address_region"
    t.string   "address_postcode"
    t.string   "name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
