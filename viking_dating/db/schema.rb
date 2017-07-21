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

ActiveRecord::Schema.define(version: 20170720154231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "choice_id"
    t.integer  "priority"
    t.integer  "question_id"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["client_id"], name: "index_answers_on_client_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "choices", force: :cascade do |t|
    t.text     "option"
    t.integer  "position"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_choices_on_question_id", using: :btree
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

  create_table "essential_attributes", force: :cascade do |t|
    t.string   "geographical_area"
    t.string   "sex"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "score"
    t.integer  "thumb"
    t.integer  "matcher_id", null: false
    t.integer  "matched_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matcher_id", "matched_id"], name: "index_matches_on_matcher_id_and_matched_id", unique: true, using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "message_text"
    t.integer  "sender_id",    null: false
    t.integer  "recipient_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["sender_id", "recipient_id"], name: "index_messages_on_sender_id_and_recipient_id", unique: true, using: :btree
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
