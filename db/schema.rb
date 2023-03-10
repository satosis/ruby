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

ActiveRecord::Schema[7.0].define(version: 2023_03_09_232722) do
  create_table "admins", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", charset: "utf8mb4", force: :cascade do |t|
    t.string "a_name"
    t.string "a_slug"
    t.integer "a_hot", default: 0
    t.integer "a_active", default: 1
    t.integer "a_view", default: 0
    t.text "a_description"
    t.text "a_avatar"
    t.text "a_content"
    t.integer "_wysihtml5_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "c_name"
    t.string "c_slug"
    t.string "c_cate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", charset: "utf8mb4", force: :cascade do |t|
    t.string "k_name"
    t.string "k_slug"
    t.string "k_description"
    t.integer "k_hot", default: 0
    t.integer "k_active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "transaction_id"
    t.bigint "product_id"
    t.integer "sale", default: 0
    t.integer "qty", default: 0
    t.float "price", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["transaction_id"], name: "index_orders_on_transaction_id"
  end

  create_table "product_images", charset: "utf8mb4", force: :cascade do |t|
    t.string "al_name"
    t.string "al_slug"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "product_keywords", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword_id"], name: "index_product_keywords_on_keyword_id"
    t.index ["product_id"], name: "index_product_keywords_on_product_id"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "pro_name"
    t.integer "pro_amount", default: 100
    t.integer "pro_view", default: 0
    t.string "pro_slug"
    t.integer "pro_price", default: 0
    t.integer "pro_sale", default: 0
    t.bigint "category_id"
    t.integer "pro_favourite", default: 0
    t.string "pro_avatar"
    t.integer "pro_hot", default: 0
    t.integer "pro_active", default: 0
    t.bigint "admin_id"
    t.integer "pro_pay", default: 0
    t.text "pro_description"
    t.text "pro_content"
    t.integer "pro_review_total", default: 0
    t.integer "pro_review_star", default: 5
    t.string "keywordseo"
    t.string "_wysihtml5_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_products_on_admin_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "ratings", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.integer "number", default: 0
    t.integer "status", default: 0
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_ratings_on_product_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "transactions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.float "tst_total_money", default: 0.0
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "note"
    t.integer "status", default: 1
    t.integer "type", default: 1
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "user_favourites", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_user_favourites_on_product_id"
    t.index ["user_id"], name: "index_user_favourites_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.string "provider_id"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "password"
    t.string "avatar"
    t.string "remember_token"
    t.date "birthday"
    t.integer "gender", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "products"
  add_foreign_key "orders", "transactions"
  add_foreign_key "product_images", "products"
  add_foreign_key "product_keywords", "keywords"
  add_foreign_key "product_keywords", "products"
  add_foreign_key "products", "admins"
  add_foreign_key "products", "categories"
  add_foreign_key "ratings", "products"
  add_foreign_key "ratings", "users"
  add_foreign_key "transactions", "users"
  add_foreign_key "user_favourites", "products"
  add_foreign_key "user_favourites", "users"
end
