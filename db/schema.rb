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

ActiveRecord::Schema.define(version: 20140112222801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.boolean  "temporary",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "email"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["group_id"], name: "index_contacts_on_group_id", using: :btree

  create_table "field_infos", force: true do |t|
    t.integer  "field_id"
    t.integer  "rsvp_id"
    t.integer  "user_id"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "field_infos", ["field_id"], name: "index_field_infos_on_field_id", using: :btree
  add_index "field_infos", ["rsvp_id"], name: "index_field_infos_on_rsvp_id", using: :btree
  add_index "field_infos", ["user_id"], name: "index_field_infos_on_user_id", using: :btree

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
    t.boolean  "send_reminders",             default: true
    t.integer  "reminder_days_before",       default: 1
    t.boolean  "notify_admin_of_new_signup", default: true
    t.boolean  "published",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "invite_text"
    t.text     "location"
    t.boolean  "require_slot",               default: false
  end

  add_index "forms", ["account_id"], name: "index_forms_on_account_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["account_id"], name: "index_groups_on_account_id", using: :btree

  create_table "invites", force: true do |t|
    t.string   "email"
    t.integer  "form_id"
    t.boolean  "sent",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invites", ["form_id"], name: "index_invites_on_form_id", using: :btree

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["account_id"], name: "index_memberships_on_account_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "rsvps", force: true do |t|
    t.integer "user_id"
    t.integer "form_id"
    t.integer "slot_id"
  end

  add_index "rsvps", ["form_id"], name: "index_rsvps_on_form_id", using: :btree
  add_index "rsvps", ["slot_id"], name: "index_rsvps_on_slot_id", using: :btree
  add_index "rsvps", ["user_id"], name: "index_rsvps_on_user_id", using: :btree

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
    t.boolean  "rsvp",                 default: false
  end

end
