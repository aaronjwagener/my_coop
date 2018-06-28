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

ActiveRecord::Schema.define(version: 20180627180428) do

  create_table "coops", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managements", force: :cascade do |t|
    t.integer "manager_id"
    t.integer "managed_coop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["managed_coop_id"], name: "index_managements_on_managed_coop_id"
    t.index ["manager_id", "managed_coop_id"], name: "index_managements_on_manager_id_and_managed_coop_id", unique: true
    t.index ["manager_id"], name: "index_managements_on_manager_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "member_id"
    t.integer "joined_coop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["joined_coop_id"], name: "index_memberships_on_joined_coop_id"
    t.index ["member_id", "joined_coop_id"], name: "index_memberships_on_member_id_and_joined_coop_id", unique: true
    t.index ["member_id"], name: "index_memberships_on_member_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
