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

ActiveRecord::Schema.define(version: 20170225005135) do

  create_table "questions", force: :cascade do |t|
    t.integer  "parent_id"
    t.text     "answer",       default: ""
    t.text     "question",     default: ""
    t.boolean  "terminal",     default: false
    t.text     "diagnosis",    default: ""
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "user_defined", default: false
    t.index ["parent_id"], name: "index_questions_on_parent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.integer  "user_group",        default: 1
    t.string   "name"
    t.string   "specialization"
    t.string   "phone"
    t.text     "address"
    t.text     "bio",               default: ""
    t.datetime "dob"
    t.text     "nationality"
    t.string   "marital_status"
    t.string   "occupation"
    t.text     "hobbies"
    t.text     "languages"
    t.float    "height"
    t.float    "weight"
    t.text     "allergies"
    t.text     "smoke"
    t.text     "alcohol"
    t.text     "tattoos"
    t.text     "history"
    t.text     "medication"
    t.boolean  "drugs"
    t.text     "illness"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "activation_digest"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "questions_id",      default: 1
    t.datetime "last_test"
    t.index ["questions_id"], name: "index_users_on_questions_id"
  end

end
