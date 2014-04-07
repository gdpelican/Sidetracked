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

ActiveRecord::Schema.define(version: 20140328205952) do

  create_table "contact_methods", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.string   "type"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gigs", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "address"
    t.text     "description"
    t.datetime "first_performance"
    t.datetime "last_performance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
    t.integer  "act_id"
    t.integer  "gig_entry_id"
  end

  create_table "links", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "href"
    t.string   "title"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "on_contact", default: false
  end

  create_table "performances", force: true do |t|
    t.datetime "date"
    t.integer  "gig_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
