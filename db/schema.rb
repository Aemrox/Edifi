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

ActiveRecord::Schema.define(version: 20160201161129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connection_requests", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "connection_requests", ["skill_id"], name: "index_connection_requests_on_skill_id", using: :btree
  add_index "connection_requests", ["student_id"], name: "index_connection_requests_on_student_id", using: :btree
  add_index "connection_requests", ["teacher_id"], name: "index_connection_requests_on_teacher_id", using: :btree

  create_table "connections", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "connections", ["skill_id"], name: "index_connections_on_skill_id", using: :btree
  add_index "connections", ["student_id"], name: "index_connections_on_student_id", using: :btree
  add_index "connections", ["teacher_id"], name: "index_connections_on_teacher_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.datetime "date_time"
    t.integer  "connection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "lessons", ["connection_id"], name: "index_lessons_on_connection_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "skills", ["subject_id"], name: "index_skills_on_subject_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teacher_skills", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teacher_skills", ["skill_id"], name: "index_teacher_skills_on_skill_id", using: :btree
  add_index "teacher_skills", ["teacher_id"], name: "index_teacher_skills_on_teacher_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_foreign_key "connection_requests", "skills"
  add_foreign_key "connections", "skills"
  add_foreign_key "lessons", "connections"
  add_foreign_key "teacher_skills", "skills"
end
