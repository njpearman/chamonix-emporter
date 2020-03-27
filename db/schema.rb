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

ActiveRecord::Schema.define(version: 2020_03_27_100639) do

  create_table "contact_channels", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.string "value"
    t.integer "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_contact_channels_on_vendor_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street"
    t.string "town"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.boolean "delivers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "location_id"
    t.index ["location_id"], name: "index_vendors_on_location_id"
  end

  create_table "weekday_time_ranges", force: :cascade do |t|
    t.string "day"
    t.integer "start_in_mins"
    t.integer "end_in_mins"
    t.integer "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_weekday_time_ranges_on_vendor_id"
  end

  add_foreign_key "contact_channels", "vendors"
  add_foreign_key "vendors", "locations"
  add_foreign_key "weekday_time_ranges", "vendors"
end
