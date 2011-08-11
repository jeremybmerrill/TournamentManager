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

ActiveRecord::Schema.define(:version => 20110808045701) do

  create_table "amta_ballots", :force => true do |t|
    t.integer  "round_id"
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
  end

  create_table "competitors", :force => true do |t|
    t.string   "name"
    t.string   "contactemail"
    t.string   "contactphone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "plaintiff_id"
    t.integer  "defense_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "amtaid"
    t.string   "school"
    t.string   "teamabcd"
    t.string   "contactemail"
    t.string   "contactphone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tournament_id"
  end

  create_table "teams_tournaments", :id => false, :force => true do |t|
    t.integer "team_id"
    t.integer "tournament_id"
  end

  create_table "tournaments", :force => true do |t|
    t.string   "title"
    t.string   "date"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "number_of_rounds"
    t.text     "info"
    t.text     "host"
    t.integer  "num_rounds"
  end

end
