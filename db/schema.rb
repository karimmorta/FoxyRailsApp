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

ActiveRecord::Schema.define(version: 20150623103312) do

  create_table "betting_odds", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "b365h"
    t.float    "b365d"
    t.float    "b365a"
    t.float    "bsh"
    t.float    "bsd"
    t.float    "bsa"
    t.float    "bwh"
    t.float    "bwd"
    t.float    "bwa"
    t.float    "gb"
    t.float    "gbd"
    t.float    "gba"
    t.float    "iwh"
    t.float    "iwd"
    t.float    "iwa"
    t.float    "lbh"
    t.float    "lbd"
    t.float    "lba"
    t.float    "psh"
    t.float    "psd"
    t.float    "psa"
    t.float    "soh"
    t.float    "sod"
    t.float    "soa"
    t.float    "sbh"
    t.float    "sbd"
    t.float    "sba"
    t.float    "sjh"
    t.float    "sjd"
    t.float    "sja"
    t.float    "syh"
    t.float    "syd"
    t.float    "sya"
    t.float    "vch"
    t.float    "vcd"
    t.float    "vca"
    t.float    "whh"
    t.float    "whd"
    t.float    "wha"
    t.integer  "bb1x2"
    t.float    "bbmxh"
    t.float    "bbavh"
    t.float    "bbmxd"
    t.float    "bbavd"
    t.float    "bbmxa"
    t.float    "bbava"
    t.integer  "bbou"
    t.float    "bbmx_over_two_point_five"
    t.float    "bbav_over_two_point_five"
    t.float    "bbmx_under_two_point_five"
    t.float    "bbav_under_two_point_five"
  end

  create_table "bwin_odds", force: :cascade do |t|
    t.float    "home_odds"
    t.float    "draw_odds"
    t.float    "away_odds"
    t.string   "home_link"
    t.string   "draw_link"
    t.string   "away_link"
    t.string   "home_team"
    t.string   "away_team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitions", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compositions", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fbd_game_stats", force: :cascade do |t|
    t.integer "game_id"
    t.integer "attendance"
    t.integer "referee_id"
    t.integer "fthg"
    t.integer "ftag"
    t.string  "ftr"
    t.integer "hthg"
    t.integer "htag"
    t.integer "htr"
    t.integer "hs"
    t.integer "as"
    t.integer "hst"
    t.integer "ast"
    t.integer "hhw"
    t.integer "ahw"
    t.integer "hc"
    t.integer "ac"
    t.integer "hf"
    t.integer "af"
    t.integer "ho"
    t.integer "ao"
    t.integer "hy"
    t.integer "ay"
    t.integer "hr"
    t.integer "ar"
    t.integer "hbp"
    t.integer "abp"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "home_id"
    t.integer  "away_id"
    t.string   "game_name"
    t.integer  "competition_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "picks", force: :cascade do |t|
    t.string   "game_name"
    t.integer  "game_id"
    t.string   "bet"
    t.integer  "bet_type"
    t.boolean  "won"
    t.float    "odds"
    t.integer  "tipster_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "amount"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "division_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "fanion_url"
    t.string   "logo_url"
  end

  create_table "tipsters", force: :cascade do |t|
    t.string   "name"
    t.string   "ba_url"
    t.float    "avg_odds"
    t.float    "avg_yield"
    t.float    "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "avg_bet"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
