# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_10_11_003944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contestants", force: :cascade do |t|
    t.bigint "person_id"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "season_id"
    t.string "occupation"
    t.string "hometown"
    t.integer "eliminated_ep"
    t.index ["person_id"], name: "index_contestants_on_person_id"
    t.index ["season_id"], name: "index_contestants_on_season_id"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "contestant_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contestant_id"], name: "index_notes_on_contestant_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "bachelor_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bachelor_id"], name: "index_seasons_on_bachelor_id"
  end

  add_foreign_key "contestants", "seasons"
  add_foreign_key "seasons", "people", column: "bachelor_id"
end
