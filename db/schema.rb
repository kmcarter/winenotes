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

ActiveRecord::Schema.define(version: 20160212040136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: :cascade do |t|
    t.integer  "rating"
    t.text     "tasting_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wine_id"
  end

  add_index "notes", ["wine_id"], name: "index_notes_on_wine_id", using: :btree

  create_table "wines", force: :cascade do |t|
    t.string   "name"
    t.string   "varietal"
    t.integer  "year"
    t.string   "vinyard"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "notes", "wines"
end
