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

ActiveRecord::Schema.define(version: 2019_08_17_140819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_dossiers", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "dossier_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_dossiers_on_article_id"
    t.index ["dossier_id"], name: "index_article_dossiers_on_dossier_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "date"
    t.text "summary"
    t.text "paragraph"
    t.string "url"
    t.boolean "read"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "dossiers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "article_dossiers", "articles"
  add_foreign_key "article_dossiers", "dossiers"
end
