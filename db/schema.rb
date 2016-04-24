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

ActiveRecord::Schema.define(version: 20160422205300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_names", force: :cascade do |t|
    t.string   "name"
    t.integer  "group"
    t.string   "attributez"
    t.string   "methodz"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_selections", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "quiz_id"
    t.boolean  "display_t_or_f"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "current_answer"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "t"
    t.text     "f"
    t.string   "domain",           default: "coding"
    t.text     "public_comments"
    t.text     "private_comments"
    t.boolean  "active",           default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "inspired_by"
  end

  create_table "questions_tags", force: :cascade do |t|
    t.integer "question_id"
    t.integer "tag_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "custom"
    t.integer  "question_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "quizzes_tags", force: :cascade do |t|
    t.integer "quiz_id"
    t.integer "tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "role"
    t.string   "email"
    t.string   "github_nickname"
    t.string   "github_avatar"
  end

end
