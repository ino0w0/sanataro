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

ActiveRecord::Schema.define(version: 20121019045203) do

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.boolean  "active",     default: true
    t.string   "type"
    t.integer  "order_no"
    t.datetime "updated_at"
    t.string   "bgcolor"
  end

  create_table "autologin_keys", force: true do |t|
    t.integer  "user_id"
    t.string   "enc_autologin_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_relations", force: true do |t|
    t.integer  "credit_account_id"
    t.integer  "payment_account_id"
    t.integer  "settlement_day"
    t.integer  "payment_month"
    t.integer  "payment_day"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "from_account_id"
    t.integer  "to_account_id"
    t.string   "currency"
    t.integer  "amount"
    t.date     "action_date"
    t.datetime "created_at"
    t.integer  "adjustment_amount",     default: 0
    t.integer  "parent_id"
    t.datetime "updated_at"
    t.boolean  "confirmation_required", default: false
    t.string   "type"
  end

  create_table "monthly_profit_losses", force: true do |t|
    t.integer  "user_id"
    t.date     "month"
    t.integer  "account_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.string   "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true

  create_table "oauth_applications", force: true do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.string   "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "taggings", force: true do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string  "taggable_type"
    t.integer "user_id"
  end

  add_index "taggings", ["tag_id", "taggable_type"], name: "index_taggings_on_tag_id_and_taggable_type"
  add_index "taggings", ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type"
  add_index "taggings", ["user_id", "tag_id", "taggable_type"], name: "index_taggings_on_user_id_and_tag_id_and_taggable_type"
  add_index "taggings", ["user_id", "taggable_id", "taggable_type"], name: "index_taggings_on_user_id_and_taggable_id_and_taggable_type"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0, null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name"
  add_index "tags", ["taggings_count"], name: "index_tags_on_taggings_count"

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.boolean  "active",       default: true
    t.datetime "updated_at"
    t.string   "email"
    t.string   "confirmation"
  end

end
