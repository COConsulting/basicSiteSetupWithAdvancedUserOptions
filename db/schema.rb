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

ActiveRecord::Schema.define(version: 20160725043949) do

  create_table "companies", force: :cascade do |t|
    t.string   "email",                             default: "",                         null: false
    t.integer  "user_id",                           default: 0,                          null: false
    t.string   "company_name"
    t.string   "contact_name"
    t.text     "description"
    t.string   "office_phone"
    t.string   "fax_phone"
    t.string   "website"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country",                           default: "United States of America"
    t.integer  "zip_code"
    t.string   "latitude"
    t.string   "longitude"
    t.boolean  "nonprofit",                         default: false,                      null: false
    t.string   "charity_navigator"
    t.string   "guide_star"
    t.string   "nonprofit_number"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "google_plus"
    t.string   "instagram"
    t.string   "pinterest"
    t.string   "blog"
    t.boolean  "published",                         default: false,                      null: false
    t.boolean  "verified",                          default: false,                      null: false
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.boolean  "service_church"
    t.boolean  "service_food_bank"
    t.boolean  "service_medical_doctor"
    t.boolean  "service_medical_dentist"
    t.boolean  "service_medical_other"
    t.string   "service_medical_other_description"
    t.boolean  "service_shelter_womans"
    t.boolean  "service_shelter_mens"
    t.boolean  "service_shelter_family"
    t.boolean  "service_shelter_other"
    t.string   "service_shelter_other_description"
    t.boolean  "service_food_meal"
    t.string   "irs_url"
  end

  add_index "companies", ["id"], name: "index_companies_on_id", unique: true

  create_table "stories", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "authorName"
    t.text     "heading"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "locationCity"
    t.string   "locationState"
    t.string   "locationZip"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.integer  "security_level",         default: 1
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip_code"
    t.date     "birthday"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "google_plus"
    t.string   "instagram"
    t.string   "pinterest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "private"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
