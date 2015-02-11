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

ActiveRecord::Schema.define(version: 20150211034102) do

  create_table "cornellclasses", force: :cascade do |t|
    t.string   "title"
    t.string   "prefix"
    t.integer  "coursenumber"
    t.float    "avgrating"
    t.integer  "numratings"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "courseid"
    t.string   "instructor"
    t.boolean  "hwyesno"
    t.float    "profqual"
    t.float    "taqual"
    t.float    "lecturequal"
    t.float    "recitationqual"
    t.boolean  "recitationreqdyesno"
    t.float    "hwdiff"
    t.float    "examdiff"
    t.boolean  "examyesno"
    t.boolean  "lecturereqdyesno"
    t.float    "materialdiff"
    t.boolean  "projyesno"
    t.float    "projdiff"
    t.boolean  "prelimyesno"
    t.float    "prelimdiff"
    t.string   "semester"
    t.boolean  "paperyesno"
    t.float    "paperdiff"
    t.string   "name"
  end

  add_index "cornellclasses", ["courseid"], name: "index_cornellclasses_on_courseid"

  create_table "cornellsubjects", force: :cascade do |t|
    t.string   "prefix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "prefix"
    t.integer  "course_number"
    t.integer  "courseid"
    t.boolean  "hwyesno"
    t.integer  "profqual"
    t.integer  "taqual"
    t.integer  "lecturequal"
    t.integer  "recitationqual"
    t.boolean  "recitationreqdyesno"
    t.integer  "hwdiff"
    t.integer  "examdiff"
    t.boolean  "examyesno"
    t.boolean  "lecturereqdyesno"
    t.integer  "materialdiff"
    t.boolean  "projyesno"
    t.integer  "projdiff"
    t.boolean  "prelimyesno"
    t.integer  "prelimdiff"
    t.string   "semester"
    t.boolean  "paperyesno"
    t.integer  "paperdiff"
  end

  add_index "ratings", ["courseid"], name: "index_ratings_on_courseid"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "teammembers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.string   "quote"
    t.string   "quoted_person"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "position"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
