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

ActiveRecord::Schema.define(version: 20160416122351) do

  create_table "bills", force: :cascade do |t|
    t.integer  "consignee_id",            limit: 4
    t.integer  "shipper_id",              limit: 4
    t.string   "reference_number",        limit: 255
    t.string   "master_reference_number", limit: 255
    t.text     "description",             limit: 65535
    t.string   "carrier_name",            limit: 255
    t.string   "quantity",                limit: 255
    t.float    "gross_weight",            limit: 24
    t.float    "chargeable_weight",       limit: 24
    t.float    "measurement",             limit: 24
    t.string   "registry_number",         limit: 255
    t.string   "port",                    limit: 255
    t.date     "arrival_date"
    t.date     "estimated_arrival_date"
    t.string   "location",                limit: 255
    t.string   "carrier",                 limit: 255
    t.string   "destination",             limit: 255
    t.string   "origin",                  limit: 255
    t.string   "container_number",        limit: 255
    t.string   "invoice_number",          limit: 255
    t.decimal  "invoice_value",                         precision: 10, scale: 2
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "job_order_id",            limit: 4,                              null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name",           limit: 255,   null: false
    t.string   "contact_person", limit: 255
    t.string   "contact_number", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "address",        limit: 65535
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "default_flag",             default: false
  end

  create_table "expense_line_items", force: :cascade do |t|
    t.integer  "expense_id",          limit: 4
    t.decimal  "amount",                          precision: 10, scale: 2
    t.string   "reference",           limit: 255
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "name",                limit: 255,                          null: false
    t.integer  "expense_category_id", limit: 4
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "job_order_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "job_orders", force: :cascade do |t|
    t.integer  "client_id",        limit: 4,             null: false
    t.integer  "mode_of_shipment", limit: 4, default: 0, null: false
    t.integer  "service_type",     limit: 4, default: 0, null: false
    t.integer  "services",         limit: 4, default: 0, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "number",           limit: 4, default: 0, null: false
  end

  create_table "liquidation_categories", force: :cascade do |t|
    t.string   "name",         limit: 255,                 null: false
    t.boolean  "default_flag",             default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "type",         limit: 255
  end

  create_table "liquidation_form_lines", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "liquidation_forms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "liquidation_line_items", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.decimal  "amount",                                precision: 10, scale: 2
    t.string   "type",                    limit: 255
    t.integer  "liquidation_id",          limit: 4
    t.text     "remarks",                 limit: 65535
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "liquidation_category_id", limit: 4
  end

  create_table "liquidations", force: :cascade do |t|
    t.string   "liquidated_by_name", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "expense_id",         limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
