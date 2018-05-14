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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "uuid", limit: 128
    t.string "token", limit: 255
  end

  create_table "buy_requests", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "title", limit: 255
    t.text "content"
    t.integer "amount"
    t.datetime "created_at"
  end

  create_table "captchas", id: :serial, force: :cascade do |t|
    t.string "phone", limit: 11
    t.string "code", limit: 6
  end

  create_table "chips", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "serial_number", limit: 100
    t.string "vendor", limit: 255
    t.integer "amount"
    t.datetime "manufacture_date"
    t.float "unit_price"
    t.string "specification", limit: 255
    t.boolean "is_verified"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "commentable_type", limit: 20
    t.integer "commentable_id"
    t.text "content"
    t.boolean "is_picked"
    t.integer "likes"
    t.datetime "created_at"
  end

  create_table "favorites", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "favorable_type", limit: 20
    t.integer "favorable_id"
    t.datetime "created_at"
  end

  create_table "help_requests", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "title", limit: 255
    t.text "content"
    t.integer "amount"
    t.datetime "created_at"
  end

  create_table "invitations", id: :serial, force: :cascade do |t|
    t.string "invitation_code", limit: 6
    t.boolean "has_activated"
  end

  create_table "likes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "comment_id"
    t.datetime "created_at"
  end

  create_table "news_items", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.string "description", limit: 255
    t.text "body"
    t.string "type", limit: 255
    t.string "link", limit: 255
    t.string "image", limit: 255
    t.string "source", limit: 255
    t.datetime "updated_at"
  end

  create_table "suggestions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "nickname", limit: 255
    t.string "pwd", limit: 255
    t.string "phone", limit: 11
    t.string "email", limit: 128
    t.string "avatar", limit: 255
    t.integer "gender"
    t.text "biography"
    t.datetime "created_at"
    t.datetime "login_date"
    t.string "real_name", limit: 20
    t.string "identity_card_num", limit: 19
    t.string "identity_card_front", limit: 256
    t.string "identity_card_back", limit: 256
    t.string "from_code", limit: 6
    t.string "license", limit: 256
    t.string "expertise", limit: 256
    t.string "resume", limit: 512
    t.integer "role"
    t.boolean "is_verified"
  end

  add_foreign_key "chips", "users", name: "chips_user_id_fkey"
end
