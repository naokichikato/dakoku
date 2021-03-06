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

ActiveRecord::Schema.define(version: 2022_03_22_042417) do

  create_table "pepers", force: :cascade do |t|
    t.string "kind"
    t.string "status"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pepers_on_user_id"
  end

  create_table "timecards", force: :cascade do |t|
    t.datetime "work_begin"
    t.datetime "work_finish"
    t.datetime "rest_begin"
    t.datetime "rest_finish"
    t.integer "work_time", default: 0
    t.integer "rest_time", default: 0
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.integer "overtime", default: 0
    t.index ["user_id", "created_at"], name: "index_timecards_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_timecards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "pepers", "users"
  add_foreign_key "timecards", "users"
end
