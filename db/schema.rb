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

ActiveRecord::Schema.define(version: 20160913102725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "department"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "adults", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "call"
    t.string   "zip_code"
    t.string   "enthicity"
    t.string   "district"
    t.string   "parish"
    t.string   "city"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "prefix"
    t.string   "nationality"
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "expires_at"
    t.integer  "student_id"
    t.boolean  "active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "admin_id"
  end

  add_index "api_keys", ["access_token"], name: "index_api_keys_on_access_token", unique: true, using: :btree
  add_index "api_keys", ["student_id"], name: "index_api_keys_on_student_id", using: :btree

  create_table "father_lists", force: :cascade do |t|
    t.integer  "adult_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guardians", force: :cascade do |t|
    t.integer  "adult_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mother_lists", force: :cascade do |t|
    t.integer  "adult_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.string   "level"
    t.string   "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "teacher_id"
    t.string   "status"
  end

  add_index "rooms", ["teacher_id"], name: "index_rooms_on_teacher_id", using: :btree

  create_table "student_rooms", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_rooms", ["room_id"], name: "index_student_rooms_on_room_id", using: :btree
  add_index "student_rooms", ["student_id"], name: "index_student_rooms_on_student_id", using: :btree

  create_table "student_subjects", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "subject_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.float    "grade"
    t.float    "score1"
    t.float    "score2"
    t.float    "score_primary_term"
    t.float    "score_secondary_term"
  end

  add_index "student_subjects", ["student_id"], name: "index_student_subjects_on_student_id", using: :btree
  add_index "student_subjects", ["subject_id"], name: "index_student_subjects_on_subject_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.float    "gpa"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "iden_number"
    t.string   "code_number"
    t.boolean  "room_state"
    t.string   "blood"
    t.datetime "birthdate"
    t.string   "address"
    t.string   "call"
    t.string   "zip_code"
    t.string   "ability"
    t.string   "nationality"
    t.string   "ethnicity"
    t.string   "district"
    t.string   "parish"
    t.string   "city"
    t.string   "prefix"
    t.string   "delete_status"
    t.string   "username"
    t.string   "password_digest"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subjects", ["teacher_id"], name: "index_subjects_on_teacher_id", using: :btree

  create_table "teacher_rooms", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teacher_rooms", ["room_id"], name: "index_teacher_rooms_on_room_id", using: :btree
  add_index "teacher_rooms", ["teacher_id"], name: "index_teacher_rooms_on_teacher_id", using: :btree

  create_table "teacher_subjects", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teacher_subjects", ["subject_id"], name: "index_teacher_subjects_on_subject_id", using: :btree
  add_index "teacher_subjects", ["teacher_id"], name: "index_teacher_subjects_on_teacher_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "password_digest"
    t.string   "status"
  end

  add_foreign_key "rooms", "teachers"
  add_foreign_key "student_rooms", "rooms"
  add_foreign_key "student_rooms", "students"
  add_foreign_key "student_subjects", "students"
  add_foreign_key "student_subjects", "subjects"
  add_foreign_key "subjects", "teachers"
  add_foreign_key "teacher_rooms", "rooms"
  add_foreign_key "teacher_rooms", "teachers"
  add_foreign_key "teacher_subjects", "subjects"
  add_foreign_key "teacher_subjects", "teachers"
end
