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

ActiveRecord::Schema.define(version: 20171115152251) do

  create_table "checkouts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id"
    t.bigint "product_id"
    t.datetime "pickup_date", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "dropoff_date"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "deleted_at"
    t.index ["customer_id"], name: "index_checkouts_on_customer_id"
    t.index ["product_id"], name: "index_checkouts_on_product_id"
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "phone"
    t.string "email", null: false
    t.string "address"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "deleted_at"
  end

  create_table "product_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "description"
    t.string "location"
    t.integer "checkout_days", default: 0
    t.float "late_fee", limit: 24, default: 0.0
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "deleted_at"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "author"
    t.string "publisher"
    t.string "genre"
    t.datetime "published_date"
    t.string "description"
    t.boolean "in_library", default: true
    t.bigint "product_type_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "deleted_at"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  add_foreign_key "checkouts", "customers"
  add_foreign_key "checkouts", "products"
  add_foreign_key "products", "product_types"
end
