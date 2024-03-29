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

ActiveRecord::Schema.define(version: 2019_04_26_134548) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "dateofevent"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "eventusers", force: :cascade do |t|
    t.integer "attendee_id"
    t.integer "attended_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attended_event_id"], name: "index_eventusers_on_attended_event_id"
    t.index ["attendee_id", "attended_event_id"], name: "index_eventusers_on_attendee_id_and_attended_event_id", unique: true
    t.index ["attendee_id"], name: "index_eventusers_on_attendee_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "event_id"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "sender_id", "receiver_id"], name: "index_invitations_on_event_id_and_sender_id_and_receiver_id", unique: true
    t.index ["event_id"], name: "index_invitations_on_event_id"
    t.index ["receiver_id"], name: "index_invitations_on_receiver_id"
    t.index ["sender_id"], name: "index_invitations_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
