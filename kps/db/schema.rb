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

ActiveRecord::Schema.define(version: 20140515123407) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "type"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.float    "weight"
    t.float    "volume"
    t.integer  "priority_id"
    t.float    "price_per_gram"
    t.float    "price_per_cubic_cm"
    t.integer  "transport_company_id"
    t.integer  "transport_type_id"
    t.string   "depart_day"
    t.float    "depart_frequency"
    t.float    "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_request_route_segments", force: true do |t|
    t.integer  "route_segment_id"
    t.integer  "mail_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_requests", force: true do |t|
    t.integer  "mail_route_id"
    t.decimal  "price"
    t.decimal  "weight"
    t.decimal  "volume"
    t.integer  "priority_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_routes", force: true do |t|
    t.integer  "to_id"
    t.integer  "from_id"
    t.decimal  "margin"
    t.integer  "priority_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priorities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "route_segments", force: true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.boolean  "active"
    t.decimal  "cost"
    t.integer  "duration"
    t.decimal  "costVolume"
    t.decimal  "costWeight"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
