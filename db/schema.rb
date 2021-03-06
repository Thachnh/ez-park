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

ActiveRecord::Schema.define(version: 20140223090658) do

  create_table "blocks", force: true do |t|
    t.string   "address"
    t.integer  "limit"
    t.integer  "count"
    t.integer  "fromDay"
    t.integer  "toDay"
    t.integer  "fromHour"
    t.integer  "toHour"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lat"
    t.float    "lon"
    t.float    "rate"
  end

  create_table "meters", force: true do |t|
    t.float    "lat"
    t.float    "long"
    t.integer  "block_id"
    t.float    "rate"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meter_number"
  end

  create_table "requests", force: true do |t|
    t.integer  "meter_id"
    t.datetime "paytime"
    t.integer  "duration"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expire_in"
  end

end
