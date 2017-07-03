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

ActiveRecord::Schema.define(version: 20170628145355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "boolean_answers", force: :cascade do |t|
    t.boolean "answer", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "inspection_id", null: false
    t.bigint "question_id", null: false
    t.string "answer_type"
    t.bigint "answer_id"
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_type", "answer_id"], name: "index_entries_on_answer_type_and_answer_id"
    t.index ["inspection_id"], name: "index_entries_on_inspection_id"
    t.index ["question_id"], name: "index_entries_on_question_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.date "at_date", null: false
    t.integer "kind", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_inspections_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "title"
    t.text "description"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_projects_on_customer_id"
    t.index ["status"], name: "index_projects_on_status"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question", null: false
    t.integer "kind", default: 0, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "text_answers", force: :cascade do |t|
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entries", "inspections"
  add_foreign_key "entries", "questions"
  add_foreign_key "inspections", "projects"
  add_foreign_key "projects", "customers"
end
