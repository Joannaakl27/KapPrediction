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

ActiveRecord::Schema.define(version: 2022_06_09_124804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "vessel_visits", force: :cascade do |t|
    t.string "voyage_number"
    t.string "service_id"
    t.string "vessel_id"
    t.float "vessel_length"
    t.integer "total_container_moves"
    t.float "discharge_container_move_ratio"
    t.float "crane_intensity"
    t.float "berth_occupancy"
    t.float "yard_occupancy"
    t.float "estimated_cargo_operating_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "eta"
    t.string "etc"
  end

end
