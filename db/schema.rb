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

ActiveRecord::Schema.define(version: 20210808102857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crono_jobs", force: :cascade do |t|
    t.string   "job_id",            null: false
    t.text     "log"
    t.datetime "last_performed_at"
    t.boolean  "healthy"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true, using: :btree
  end

  create_table "tests", force: :cascade do |t|
    t.string   "url"
    t.integer  "max_ttfb"
    t.integer  "max_tti"
    t.integer  "max_speed_index"
    t.integer  "max_ttfp"
    t.integer  "ttfb"
    t.integer  "tti"
    t.integer  "speed_index"
    t.integer  "ttfp"
    t.boolean  "passed"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
