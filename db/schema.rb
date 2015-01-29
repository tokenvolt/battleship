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

ActiveRecord::Schema.define(version: 20150129224609) do

  create_table "game_activities", force: :cascade do |t|
    t.integer  "game_id",       limit: 4
    t.boolean  "result",        limit: 1
    t.integer  "step_activity", limit: 4
    t.boolean  "user",          limit: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "game_activities", ["game_id"], name: "index_game_activities_on_game_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "first_user_id",  limit: 4
    t.integer  "second_user_id", limit: 4
    t.integer  "status",         limit: 4, default: 0
    t.boolean  "result",         limit: 1
    t.time     "playing_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["first_user_id"], name: "index_games_on_first_user_id", using: :btree
  add_index "games", ["second_user_id"], name: "index_games_on_second_user_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.integer  "game_id",        limit: 4
    t.boolean  "user_type",      limit: 1
    t.string   "ships_position", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "steps", ["game_id"], name: "index_steps_on_game_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "nick_name",              limit: 255
    t.string   "auth_token",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
