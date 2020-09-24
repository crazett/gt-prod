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

ActiveRecord::Schema.define(version: 2020_09_23_165651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "order_date"
    t.datetime "deliver_date"
    t.string "customer"
    t.bigint "ref_num"
    t.integer "length"
    t.integer "amount"
    t.string "width_degree"
    t.boolean "rivet"
    t.boolean "under_steel"
    t.integer "quality_id"
    t.boolean "precut_gt"
    t.integer "precut_extra_steel"
    t.string "etching"
    t.boolean "pipe"
    t.boolean "packing"
    t.boolean "gt_tool"
    t.boolean "gt_flexo"
    t.boolean "gt_engraving"
    t.text "comment"
    t.string "worker"
    t.string "approver"
  end

end
