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

ActiveRecord::Schema.define(version: 20160901120400) do

  create_table "albums", force: true do |t|
    t.text     "name"
    t.boolean  "is_published",    default: true
    t.boolean  "is_video",        default: false
    t.boolean  "is_photo",        default: false
    t.integer  "sort_order",      default: 1
    t.integer  "auser_id",        default: 0
    t.boolean  "is_video_review", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "permalink"
  end

  create_table "clients", force: true do |t|
    t.integer  "sort_order"
    t.boolean  "is_published", default: true
    t.string   "image"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "navigations", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "sort_order",  default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "objects", force: true do |t|
    t.string   "title"
    t.string   "header"
    t.text     "body"
    t.text     "additional_body"
    t.boolean  "is_published",     default: true
    t.string   "permalink"
    t.string   "full_path"
    t.string   "image"
    t.integer  "parent_id",        default: 0
    t.integer  "sort_order",       default: 1
    t.integer  "thread_id",        default: 0
    t.integer  "nesting",          default: 0
    t.integer  "objects_type_id",  default: 0
    t.integer  "auser_id",         default: 0
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "objects", ["header"], name: "index_objects_on_header", using: :btree
  add_index "objects", ["permalink"], name: "index_objects_on_permalink", using: :btree
  add_index "objects", ["title"], name: "index_objects_on_title", using: :btree

  create_table "objects_navigations", force: true do |t|
    t.integer "objects_id"
    t.integer "navigations_id"
  end

  add_index "objects_navigations", ["navigations_id"], name: "index_objects_navigations_on_navigations_id", using: :btree
  add_index "objects_navigations", ["objects_id"], name: "index_objects_navigations_on_objects_id", using: :btree

  create_table "objects_types", force: true do |t|
    t.string   "name"
    t.integer  "sort_order", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "objects_types", ["name"], name: "index_objects_types_on_name", using: :btree

  create_table "photos", force: true do |t|
    t.text     "name"
    t.boolean  "is_published", default: true
    t.string   "image"
    t.integer  "sort_order",   default: 1
    t.integer  "auser_id",     default: 0
    t.integer  "album_id",     default: 0
    t.integer  "service_id",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "session_id"
    t.boolean  "is_published",            default: false
    t.string   "fio"
    t.float    "rate",         limit: 24
    t.string   "event"
    t.string   "avatar"
    t.date     "date"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "title"
    t.string   "header"
    t.text     "body"
    t.boolean  "is_published",     default: true
    t.string   "permalink"
    t.string   "image"
    t.string   "logo_class"
    t.integer  "sort_order",       default: 1
    t.integer  "auser_id",         default: 0
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "user_id",   default: 0
    t.string   "sid"
    t.datetime "dt_access"
  end

  create_table "slides", force: true do |t|
    t.text     "name"
    t.boolean  "is_published", default: true
    t.string   "image"
    t.integer  "sort_order",   default: 1
    t.integer  "auser_id",     default: 0
    t.string   "header"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "password"
    t.boolean  "is_admin"
    t.boolean  "is_published", default: true
    t.string   "name"
    t.string   "last_name"
    t.string   "middle_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.text     "name"
    t.boolean  "is_published", default: true
    t.string   "permalink"
    t.integer  "sort_order",   default: 1
    t.integer  "auser_id",     default: 0
    t.integer  "album_id",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
