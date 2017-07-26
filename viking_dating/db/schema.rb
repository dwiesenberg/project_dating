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

ActiveRecord::Schema.define(version: 20170726010859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "choice_id"
    t.integer  "priority"
    t.integer  "question_id"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["client_id", "question_id"], name: "index_answers_on_client_id_and_question_id", unique: true, using: :btree
  end

  create_table "choices", force: :cascade do |t|
    t.text     "option"
    t.integer  "position"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id", "position"], name: "index_choices_on_question_id_and_position", unique: true, using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "sex"
    t.integer  "age"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "about_myself"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "clients_matches", force: :cascade do |t|
    t.integer  "score",      default: 0
    t.integer  "thumb",      default: 0
    t.integer  "matcher_id",             null: false
    t.integer  "matchee_id",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["matcher_id", "matchee_id"], name: "index_clients_matches_on_matcher_id_and_matchee_id", unique: true, using: :btree
    t.index ["matcher_id", "thumb", "score"], name: "index_clients_matches_on_matcher_id_and_thumb_and_score", order: { thumb: :desc, score: :desc }, using: :btree
  end

  create_table "essential_attributes", force: :cascade do |t|
    t.string   "sex"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "message_text"
    t.integer  "sendable_id",                        null: false
    t.integer  "receivable_id",                      null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "sendable_type"
    t.text     "receivable_type"
    t.boolean  "read",               default: false
    t.integer  "desire_to_like_you", default: 0
    t.index ["read", "updated_at"], name: "index_messages_on_read_and_updated_at", using: :btree
    t.index ["sendable_id", "receivable_id"], name: "index_messages_on_sendable_id_and_receivable_id", unique: true, using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question_text"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "viking_coordinators", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "clients"
  add_foreign_key "answers", "questions"
  add_foreign_key "choices", "questions"
end
