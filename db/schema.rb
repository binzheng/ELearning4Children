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

ActiveRecord::Schema.define(version: 20180103071047) do

  create_table "add_column_to_result_histories", force: :cascade do |t|
    t.integer "testPoint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_test_types", force: :cascade do |t|
    t.string "testName"
    t.integer "parentTypeId"
    t.string "testUrl"
    t.string "testImage"
    t.string "testDesc"
    t.integer "testSize"
    t.string "created_id"
    t.string "updated_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "testEnNm"
  end

  create_table "result_his_details", force: :cascade do |t|
    t.integer "testHistId"
    t.integer "testSeq"
    t.string "testQuestion"
    t.string "testFirstAnswer"
    t.string "testAnswer"
    t.string "expectAnswer"
    t.string "testResult"
    t.string "created_id"
    t.string "updated_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "result_histories", force: :cascade do |t|
    t.string "testResultFirst"
    t.string "testResultLast"
    t.datetime "testStartTime"
    t.datetime "testEndTime"
    t.string "testTypeId"
    t.string "created_id"
    t.string "updated_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "userId"
    t.integer "testPoint"
  end

  create_table "test_rules", force: :cascade do |t|
    t.integer "ruleUserId"
    t.integer "mTestTypeId"
    t.integer "testCount"
    t.integer "maxScore"
    t.integer "maxPoint"
    t.integer "minScore"
    t.integer "minPoint"
    t.integer "midScore"
    t.integer "midPoint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toys", force: :cascade do |t|
    t.string "toyName"
    t.string "toyUrl"
    t.integer "toyPoint"
    t.string "toyImage"
    t.string "testDesc"
    t.string "created_id"
    t.string "updated_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "User"
    t.string "loginNm"
    t.string "kataNm"
    t.string "kanjiNm"
    t.integer "age"
    t.string "email"
    t.integer "point"
    t.string "voiceGood"
    t.string "voiceBad"
    t.string "voicePerfect"
    t.string "created_id"
    t.string "updated_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
