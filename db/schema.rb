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

ActiveRecord::Schema.define(version: 20181229223809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "highlights", force: :cascade do |t|
    t.text     "text"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "passage_id"
    t.string   "offset"
  end

  add_index "highlights", ["passage_id"], name: "index_highlights_on_passage_id", using: :btree

  create_table "literary_symbols", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "literary_symbols_passages", id: false, force: :cascade do |t|
    t.integer "passage_id",         null: false
    t.integer "literary_symbol_id", null: false
  end

  create_table "passages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "book_id"
  end

  add_index "passages", ["book_id"], name: "index_passages_on_book_id", using: :btree

  create_table "passages_themes", id: false, force: :cascade do |t|
    t.integer "passage_id", null: false
    t.integer "theme_id",   null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "highlights", "passages"
  add_foreign_key "passages", "books"
end
