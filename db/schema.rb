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

ActiveRecord::Schema.define(version: 20181102111534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "effective"
  end

  create_table "nodes", force: :cascade do |t|
    t.string   "module_code"
    t.string   "question_code"
    t.text     "content"
    t.integer  "sort"
    t.string   "kind"
    t.text     "summary"
    t.text     "report_summary"
    t.text     "help"
    t.text     "faq"
    t.text     "asc"
    t.text     "examples"
    t.string   "conclusion_1"
    t.string   "conclusion_2"
    t.string   "conclusion_3"
    t.string   "meets_response"
    t.string   "response_1"
    t.string   "response_2"
    t.string   "response_3"
    t.string   "target_1"
    t.string   "target_2"
    t.string   "target_3"
    t.string   "target_module"
    t.string   "return_node"
    t.string   "decision_node"
    t.string   "boolean"
    t.boolean  "return",         default: false
    t.string   "response_value"
    t.string   "response_text"
    t.string   "target_node"
    t.integer  "index"
    t.string   "comment"
    t.string   "conclusion"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "project_id"
    t.integer  "question_id"
    t.integer  "subject_id"
    t.string   "display_value"
    t.index ["project_id"], name: "index_nodes_on_project_id", using: :btree
    t.index ["question_id"], name: "index_nodes_on_question_id", using: :btree
    t.index ["subject_id"], name: "index_nodes_on_subject_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "date"
    t.string   "entity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "subject_id"
    t.integer  "version_id"
    t.index ["subject_id"], name: "index_projects_on_subject_id", using: :btree
    t.index ["version_id"], name: "index_projects_on_version_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "module_code",    null: false
    t.string   "question_code",  null: false
    t.text     "content",        null: false
    t.string   "sort"
    t.string   "kind"
    t.text     "summary"
    t.text     "report_summary"
    t.text     "help"
    t.text     "faq"
    t.text     "asc"
    t.text     "examples"
    t.string   "conclusion_1"
    t.string   "conclusion_2"
    t.string   "conclusion_3"
    t.string   "meets_response"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "subject_id"
    t.boolean  "scope"
    t.string   "report_content"
    t.index ["subject_id"], name: "index_questions_on_subject_id", using: :btree
  end

  create_table "responses", force: :cascade do |t|
    t.string  "kind"
    t.string  "response_value"
    t.string  "target_node"
    t.string  "sequence"
    t.string  "decision_node"
    t.string  "meets_value"
    t.string  "return_node"
    t.text    "comment"
    t.text    "conclusion"
    t.text    "boolean"
    t.integer "project_id"
    t.index ["project_id"], name: "index_responses_on_project_id", using: :btree
  end

  create_table "returns", force: :cascade do |t|
    t.integer  "node_index"
    t.string   "question_code"
    t.string   "return_node_code"
    t.integer  "status",           default: 1, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "project_id"
    t.index ["project_id"], name: "index_returns_on_project_id", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.boolean  "conclusion_pause",   default: false
    t.boolean  "analysis_shortcut",  default: true
    t.datetime "subscription_start"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name",                    null: false
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "display"
    t.integer  "status",      default: 0
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "version_nodes", force: :cascade do |t|
    t.string   "response_1"
    t.string   "target_1"
    t.string   "response_2"
    t.string   "target_2"
    t.string   "response_3"
    t.string   "target_3"
    t.string   "target_module"
    t.string   "return_node"
    t.string   "decision_node"
    t.string   "boolean"
    t.string   "meets_response"
    t.boolean  "return",         default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "version_id"
    t.integer  "question_id"
    t.index ["question_id"], name: "index_version_nodes_on_question_id", using: :btree
    t.index ["version_id"], name: "index_version_nodes_on_version_id", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "module_code",     null: false
    t.string   "version_number",  null: false
    t.datetime "effective_date"
    t.datetime "expiration_date"
    t.string   "status"
    t.text     "json"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "subject_id"
    t.index ["subject_id"], name: "index_versions_on_subject_id", using: :btree
  end

  add_foreign_key "nodes", "projects"
  add_foreign_key "nodes", "questions"
  add_foreign_key "nodes", "subjects"
  add_foreign_key "projects", "subjects"
  add_foreign_key "projects", "users"
  add_foreign_key "projects", "versions"
  add_foreign_key "questions", "subjects"
  add_foreign_key "responses", "projects"
  add_foreign_key "returns", "projects"
  add_foreign_key "version_nodes", "questions"
  add_foreign_key "version_nodes", "versions"
  add_foreign_key "versions", "subjects"
end
