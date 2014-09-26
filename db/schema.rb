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

ActiveRecord::Schema.define(version: 20140926235357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "menu_items", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",        precision: 8, scale: 2
    t.integer  "menu_type_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_items", ["category_id"], name: "index_menu_items_on_category_id", using: :btree
  add_index "menu_items", ["menu_type_id"], name: "index_menu_items_on_menu_type_id", using: :btree

  create_table "menu_types", force: true do |t|
    t.string "name"
  end

end
