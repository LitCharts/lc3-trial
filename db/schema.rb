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

ActiveRecord::Schema.define(version: 20180607025519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "highlights", force: :cascade do |t|
    t.integer  "lit_guide_id",   null: false
    t.text     "note"
    t.text     "quote",          null: false
    t.integer  "start_position"
    t.integer  "end_position"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "highlights", ["lit_guide_id"], name: "index_highlights_on_lit_guide_id", using: :btree

  create_table "lit_guides", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
