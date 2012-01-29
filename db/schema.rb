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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110827231935) do

  create_table "affs", :force => true do |t|
    t.integer "team_id"
    t.integer "pairing_id"
  end

  create_table "affs_pairings", :id => false, :force => true do |t|
    t.integer "aff_id"
    t.integer "pairing_id"
  end

  create_table "amta_ballots", :force => true do |t|
    t.integer  "p_open"
    t.integer  "d_open"
    t.integer  "p_witness_1"
    t.integer  "p_dx_1"
    t.integer  "d_cx_1"
    t.integer  "p_witness_2"
    t.integer  "p_dx_2"
    t.integer  "d_cx_2"
    t.integer  "p_witness_3"
    t.integer  "p_dx_3"
    t.integer  "d_cx_3"
    t.integer  "d_witness_1"
    t.integer  "d_dx_1"
    t.integer  "p_cx_1"
    t.integer  "d_witness_2"
    t.integer  "d_dx_2"
    t.integer  "p_cx_2"
    t.integer  "d_witness_3"
    t.integer  "d_dx_3"
    t.integer  "p_cx_3"
    t.integer  "p_close"
    t.integer  "d_close"
    t.integer  "atty_rank_1"
    t.integer  "atty_rank_2"
    t.integer  "atty_rank_3"
    t.integer  "atty_rank_4"
    t.integer  "witness_rank_1"
    t.integer  "witness_rank_2"
    t.integer  "witness_rank_3"
    t.integer  "witness_rank_4"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pairing_id"
    t.integer  "p_witness_1_cx"
    t.integer  "p_witness_2_cx"
    t.integer  "p_witness_3_cx"
    t.integer  "d_witness_1_cx"
    t.integer  "d_witness_2_cx"
    t.integer  "d_witness_3_cx"
  end

  create_table "competitors", :force => true do |t|
    t.string   "name"
    t.string   "contactemail"
    t.string   "contactphone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.boolean  "captain"
    t.integer  "user_id"
  end

  create_table "gods", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.integer  "failed_attempts",                   :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "sign_in_count",                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gods", ["email"], :name => "index_gods_on_email", :unique => true

  create_table "negs", :force => true do |t|
    t.integer  "team_id"
    t.integer  "pairing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "negs_pairings", :id => false, :force => true do |t|
    t.integer "neg_id"
    t.integer "pairing_id"
  end

  create_table "pairings", :force => true do |t|
    t.integer  "round_id"
    t.string   "room"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pairings_teams", :id => false, :force => true do |t|
    t.integer "pairing_id"
    t.integer "team_id"
  end

  create_table "pros", :force => true do |t|
    t.integer  "team_id"
    t.integer  "pairing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", :force => true do |t|
    t.integer "index"
    t.integer "tournament_id"
  end

  create_table "teams", :force => true do |t|
    t.string   "amtaid"
    t.string   "school"
    t.string   "teamabcd"
    t.string   "contactemail"
    t.string   "contactphone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_of_team"
  end

  create_table "teams_tournaments", :id => false, :force => true do |t|
    t.integer "team_id"
    t.integer "tournament_id"
  end

  create_table "tournaments", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_of_competition"
    t.integer  "number_of_rounds"
    t.text     "info"
    t.text     "host"
    t.integer  "num_rounds"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "rooms"
    t.string   "pairing_log"
    t.integer  "owner_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
