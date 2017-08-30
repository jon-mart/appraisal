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

ActiveRecord::Schema.define(version: 20170830053503) do

  create_table "comments", force: :cascade do |t|
    t.integer "goal_id"
    t.string "comments_words"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "super_manager_id"
    t.integer "manager_id"
    t.integer "goals_id"
    t.index ["goal_id"], name: "index_comments_on_goal_id"
    t.index ["goals_id"], name: "index_comments_on_goals_id"
    t.index ["manager_id"], name: "index_comments_on_manager_id"
    t.index ["super_manager_id"], name: "index_comments_on_super_manager_id"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "user_id"
    t.string "details"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "salary"
    t.string "contact"
    t.string "role"
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "super_manager_id"
    t.string "gender", default: "M"
    t.string "avatar", default: ""
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["manager_id"], name: "index_users_on_manager_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["super_manager_id"], name: "index_users_on_super_manager_id"
  end

end
