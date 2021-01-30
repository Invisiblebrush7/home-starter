# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 6666_66_66_666683) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.string "shipping_method"
    t.string "start_date"
    t.string "end_date"
    t.bigint "bundles_offer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "shipping_address"
    t.string "payment_info"
    t.index ["bundles_offer_id"], name: "index_bookings_on_bundles_offer_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "bundled_furnitures", force: :cascade do |t|
    t.bigint "furniture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "bundles_offer_id"
    t.index ["bundles_offer_id"], name: "index_bundled_furnitures_on_bundles_offer_id"
    t.index ["furniture_id"], name: "index_bundled_furnitures_on_furniture_id"
  end

  create_table "bundles_offers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "condition"
    t.index ["user_id"], name: "index_bundles_offers_on_user_id"
  end

  create_table "furnitures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "dimensions"
    t.integer "price"
    t.string "condition"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_furnitures_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "bundles_offer_id", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["bundles_offer_id"], name: "index_reviews_on_bundles_offer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "shipping_address"
    t.string "phone_number"
    t.string "user_type", default: "Renter"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "bundles_offers"
  add_foreign_key "bookings", "users"
  add_foreign_key "bundled_furnitures", "bundles_offers"
  add_foreign_key "bundled_furnitures", "furnitures"
  add_foreign_key "bundles_offers", "users"
  add_foreign_key "furnitures", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "bundles_offers"
end
