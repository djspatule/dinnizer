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

ActiveRecord::Schema.define(version: 20170903140556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string "attachinariable_type"
    t.bigint "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "dinner_guests", force: :cascade do |t|
    t.bigint "dinner_id"
    t.bigint "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dinner_id"], name: "index_dinner_guests_on_dinner_id"
    t.index ["guest_id"], name: "index_dinner_guests_on_guest_id"
  end

  create_table "dinner_recipes", force: :cascade do |t|
    t.bigint "dinner_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dinner_id"], name: "index_dinner_recipes_on_dinner_id"
    t.index ["recipe_id"], name: "index_dinner_recipes_on_recipe_id"
  end

  create_table "dinners", force: :cascade do |t|
    t.date "dinner_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dinners_on_user_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "dinner_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dinner_id"], name: "index_guests_on_dinner_id"
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "dinner_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dinner_id"], name: "index_recipes_on_dinner_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dinner_guests", "dinners"
  add_foreign_key "dinner_guests", "guests"
  add_foreign_key "dinner_recipes", "dinners"
  add_foreign_key "dinner_recipes", "recipes"
  add_foreign_key "dinners", "users"
  add_foreign_key "guests", "dinners"
  add_foreign_key "guests", "users"
  add_foreign_key "recipes", "dinners"
  add_foreign_key "recipes", "users"
end
