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

ActiveRecord::Schema.define(version: 20180114013101) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "lectures_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lectures_id"], name: "index_courses_on_lectures_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.date "date"
    t.string "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lectures_on_course_id"
    t.index ["user_id"], name: "index_lectures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "charity_name"
    t.string "charity_url"
    t.string "donate_amount"
    t.integer "lectures_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lectures_id"], name: "index_users_on_lectures_id"
  end

end