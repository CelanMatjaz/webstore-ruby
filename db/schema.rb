# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_04_224313) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country", limit: 32, null: false
    t.string "city", limit: 64, null: false
    t.decimal "zip_code", null: false
    t.string "street", limit: 64, null: false
    t.decimal "house_number", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
    t.index ["users_id"], name: "index_addresses_on_users_id"
  end

  create_table "card_infos", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "card_number"
    t.decimal "expiry_date"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_card_infos_on_user_id"
    t.index ["users_id"], name: "index_card_infos_on_users_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity", default: 1, null: false
    t.decimal "price", null: false
    t.string "currency", null: false
    t.check_constraint "currency::text = ANY (ARRAY['USD'::character varying, 'EUR'::character varying, 'GBP'::character varying]::text[])", name: "currency_check"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "address_id"
    t.datetime "date"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
  end

  create_table "product_prices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.decimal "price", null: false
    t.string "currency", null: false
    t.index ["currency", "product_id"], name: "index_product_prices_on_currency_and_product_id", unique: true
    t.index ["product_id"], name: "index_product_prices_on_product_id"
    t.check_constraint "currency::text = ANY (ARRAY['USD'::character varying, 'EUR'::character varying, 'GBP'::character varying]::text[])", name: "currency_check"
  end

  create_table "product_subgroups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.bigint "product_group_id"
    t.bigint "product_groups_id"
    t.index ["product_group_id"], name: "index_product_subgroups_on_product_group_id"
    t.index ["product_groups_id"], name: "index_product_subgroups_on_product_groups_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 32, null: false
    t.integer "quantity"
    t.string "image_url", limit: 64
    t.bigint "product_subgroups_id"
    t.index ["product_subgroups_id"], name: "index_products_on_product_subgroups_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", limit: 20, null: false
    t.string "email", null: false
    t.string "password_digest", limit: 64, null: false
    t.boolean "is_email_validated", default: false, null: false
    t.boolean "is_admin", default: false, null: false
    t.index ["users_id"], name: "index_users_on_users_id"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "addresses", "users", column: "users_id"
  add_foreign_key "card_infos", "users"
  add_foreign_key "card_infos", "users", column: "users_id"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "users"
  add_foreign_key "product_prices", "products"
  add_foreign_key "product_subgroups", "product_groups"
  add_foreign_key "product_subgroups", "product_groups", column: "product_groups_id"
  add_foreign_key "products", "product_subgroups", column: "product_subgroups_id"
  add_foreign_key "users", "users", column: "users_id"
end
