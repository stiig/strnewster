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

ActiveRecord::Schema.define(version: 20170115133135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feed_sources", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.boolean  "active",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_feed_sources_on_url", unique: true, using: :btree
  end

  create_table "parsed_articles", force: :cascade do |t|
    t.string   "title",          null: false
    t.string   "link",           null: false
    t.datetime "date",           null: false
    t.integer  "feed_source_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["feed_source_id"], name: "index_parsed_articles_on_feed_source_id", using: :btree
  end

  create_table "publics", force: :cascade do |t|
    t.string   "outer_id",                         null: false
    t.integer  "width",                default: 0, null: false
    t.integer  "height",               default: 0, null: false
    t.integer  "mode",       limit: 2, default: 0, null: false
    t.integer  "wide",       limit: 2, default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "title",                            null: false
    t.index ["outer_id"], name: "index_publics_on_outer_id", unique: true, using: :btree
  end

  add_foreign_key "parsed_articles", "feed_sources"
end
