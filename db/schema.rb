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

ActiveRecord::Schema[7.1].define(version: 2024_04_06_163833) do
  create_table "transactions", force: :cascade do |t|
    t.datetime "timestamp", null: false
    t.integer "points", default: 0, null: false
    t.integer "spentPoints", default: 0, null: false
    t.integer "creditWallet_id"
    t.integer "debitWallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creditWallet_id"], name: "index_transactions_on_creditWallet_id"
    t.index ["debitWallet_id"], name: "index_transactions_on_debitWallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.string "walletIdentifier", null: false
    t.integer "balance", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["walletIdentifier"], name: "index_wallets_on_walletIdentifier", unique: true
  end

  add_foreign_key "transactions", "wallets", column: "creditWallet_id"
  add_foreign_key "transactions", "wallets", column: "debitWallet_id"
end
