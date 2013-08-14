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

ActiveRecord::Schema.define(:version => 20130808031108) do

  create_table "analogies", :force => true do |t|
    t.integer  "word_id"
    t.string   "root"
    t.string   "root_target"
    t.string   "second_source"
    t.string   "second_target"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "bundle_progresses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "current_stage"
    t.binary   "words_seen"
    t.binary   "words_not_yet_seen"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "bundles", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sentences", :force => true do |t|
    t.integer  "word_id"
    t.string   "part_1"
    t.string   "part_2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "lives",           :default => 4
    t.integer  "current_bundle",  :default => 1
    t.string   "password"
    t.string   "password_digest"
    t.string   "salt"
    t.integer  "stage",           :default => 0
    t.string   "email"
  end

  create_table "words", :force => true do |t|
    t.string   "headword"
    t.string   "conjugates"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "hint"
    t.integer  "bundle_id"
  end

end
