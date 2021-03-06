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

ActiveRecord::Schema.define(version: 20140121201604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "identities", force: true do |t|
    t.string   "value",            null: false
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "identity_type_id"
  end

  add_index "identities", ["member_id"], name: "index_identities_on_member_id", using: :btree

  create_table "identity_types", force: true do |t|
    t.string "identity_kind"
  end

  create_table "members", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "role",       null: false
    t.string   "email",      null: false
    t.string   "gender",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_url",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "uid",          null: false
    t.string   "name",         null: false
    t.string   "display_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
  end

  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

end
