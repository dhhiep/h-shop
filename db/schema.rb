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

ActiveRecord::Schema.define(version: 20160807160243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.text   "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "phone"
  end

  create_table "assets", force: :cascade do |t|
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.text     "alt"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "variant_id"
    t.decimal "price",      precision: 8, scale: 2
    t.integer "quantity"
  end

  create_table "option_types", force: :cascade do |t|
    t.string "name"
    t.text   "presentation"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "number"
    t.decimal  "item_total",      precision: 8, scale: 2
    t.decimal  "subtotal",        precision: 8, scale: 2
    t.string   "state"
    t.integer  "user_id"
    t.datetime "completed_at"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.string   "email"
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "slug"
    t.text "short_description"
  end

  create_table "products_taxons", force: :cascade do |t|
    t.integer "product_id"
    t.integer "taxon_id"
  end

  create_table "taxons", force: :cascade do |t|
    t.string  "name"
    t.string  "permalink"
    t.integer "parent_id"
  end

  add_index "taxons", ["permalink"], name: "index_taxons_on_permalink", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "variant_option_values", force: :cascade do |t|
    t.integer "variant_id"
    t.integer "option_type_id"
    t.string  "value"
  end

  create_table "variants", force: :cascade do |t|
    t.string  "sku"
    t.integer "product_id"
    t.decimal "cost_price",    precision: 8, scale: 2
    t.decimal "price",         precision: 8, scale: 2
    t.integer "count_on_hand",                         default: 0
  end

end
