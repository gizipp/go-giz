# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_17_105521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.integer "url_clicked", default: 0
    t.string "slug"
    t.integer "slug_clicked", default: 0
    t.string "title"
    t.string "description"
    t.string "author"
    t.string "image"
    t.string "status_code", limit: 3, default: "404"
    t.string "scheme"
    t.string "host"
    t.datetime "checked_at"
    t.jsonb "custom_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_links_on_slug", unique: true
    t.index ["url"], name: "index_links_on_url", unique: true
  end

end
