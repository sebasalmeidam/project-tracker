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

ActiveRecord::Schema.define(version: 20161218021321) do

  create_table "attachments", force: :cascade do |t|
    t.string   "file"
    t.string   "file_name"
    t.integer  "task_id"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attachments", ["client_id"], name: "index_attachments_on_client_id"
  add_index "attachments", ["task_id"], name: "index_attachments_on_task_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "project"
    t.string   "description"
    t.date     "task_date"
    t.text     "result"
    t.string   "pending"
    t.string   "client_p"
    t.string   "firm_p"
    t.string   "edited_by"
    t.integer  "client_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "incharge"
    t.date     "pending_date"
    t.boolean  "done",         default: false, null: false
    t.integer  "hours"
  end

  add_index "tasks", ["client_id"], name: "index_tasks_on_client_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "client_id"
    t.boolean  "admin_type",      default: false
    t.boolean  "client_type",     default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_digest"
  end

  add_index "users", ["client_id"], name: "index_users_on_client_id"

end
