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

ActiveRecord::Schema.define(:version => 20130125071612) do

  create_table "avatars", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.float    "value"
    t.text     "svg"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "individuals", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "canvas_id"
    t.string   "sisid"
    t.string   "email"
    t.string   "type"
    t.integer  "gradyear"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "target_area_id"
    t.float    "value"
    t.string   "image_url"
    t.string   "minecraft_image_url"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "svg"
    t.integer  "avatar_id"
  end

  create_table "owned_items", :force => true do |t|
    t.integer  "individual_id"
    t.integer  "item_id"
    t.string   "stats"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "wearing"
    t.string   "color"
  end

  create_table "target_areas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
