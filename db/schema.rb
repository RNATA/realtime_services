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

ActiveRecord::Schema.define(version: 20170319041856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "email",            null: false
    t.string   "street_address",   null: false
    t.string   "city",             null: false
    t.string   "state",            null: false
    t.string   "zipcode",          null: false
    t.string   "current_location"
    t.string   "phone_number",     null: false
    t.string   "password_digest",  null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "auth_token"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "provider_service_id"
    t.integer  "client_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["client_id"], name: "index_jobs_on_client_id", using: :btree
    t.index ["provider_service_id"], name: "index_jobs_on_provider_service_id", using: :btree
  end

  create_table "provider_services", force: :cascade do |t|
    t.money    "base_rate",   scale: 2
    t.integer  "service_id"
    t.integer  "provider_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["provider_id"], name: "index_provider_services_on_provider_id", using: :btree
    t.index ["service_id"], name: "index_provider_services_on_service_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "email",            null: false
    t.string   "street_address",   null: false
    t.string   "city",             null: false
    t.string   "state",            null: false
    t.string   "zipcode",          null: false
    t.string   "current_location"
    t.string   "phone_number",     null: false
    t.string   "password_digest",  null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "auth_token"
  end

  create_table "services", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "jobs", "clients"
  add_foreign_key "jobs", "provider_services"
  add_foreign_key "provider_services", "providers"
  add_foreign_key "provider_services", "services"
end
