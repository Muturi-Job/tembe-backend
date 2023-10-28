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

ActiveRecord::Schema[7.1].define(version: 2023_10_26_084111) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "health_metrics", force: :cascade do |t|
    t.bigint "user_id"
    t.string "metric_type"
    t.decimal "value", precision: 8, scale: 2
    t.datetime "measurement_datetime"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_health_metrics_on_user_id"
  end

  create_table "medication_interactions", force: :cascade do |t|
    t.bigint "medication1_id"
    t.bigint "medication2_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication1_id"], name: "index_medication_interactions_on_medication1_id"
    t.index ["medication2_id"], name: "index_medication_interactions_on_medication2_id"
  end

  create_table "medications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "dosage"
    t.string "frequency"
    t.date "start_date"
    t.date "end_date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_medications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "medication_interactions", "medications", column: "medication1_id"
  add_foreign_key "medication_interactions", "medications", column: "medication2_id"
end
