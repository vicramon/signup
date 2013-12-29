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

ActiveRecord::Schema.define(version: 20131229020746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "temporary",  default: false
  end

  create_table "contacts", force: true do |t|
    t.string   "email"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["group_id"], name: "index_contacts_on_group_id", using: :btree

  create_table "fields", force: true do |t|
    t.string   "name"
    t.string   "kind"
    t.boolean  "required",   default: false
    t.integer  "form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fields", ["form_id"], name: "index_fields_on_form_id", using: :btree

  create_table "forms", force: true do |t|
    t.integer  "account_id"
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.time     "starts_at"
    t.time     "ends_at"
    t.boolean  "send_reminders"
    t.integer  "reminder_days_before"
    t.boolean  "notify_admin_of_new_signup"
    t.boolean  "published",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forms", ["account_id"], name: "index_forms_on_account_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["account_id"], name: "index_groups_on_account_id", using: :btree

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["account_id"], name: "index_memberships_on_account_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "slots", force: true do |t|
    t.string  "name"
    t.integer "max"
    t.integer "form_id"
  end

  add_index "slots", ["form_id"], name: "index_slots_on_form_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "reset_password_token"
    t.string   "session_token"
    t.boolean  "temporary",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
