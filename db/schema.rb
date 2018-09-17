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

ActiveRecord::Schema.define(version: 2018_09_17_165601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "nearest_landmark"
    t.string "colony"
    t.string "city"
    t.string "state"
    t.integer "pin"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amenties_rooms", force: :cascade do |t|
    t.bigint "amenity_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_amenties_rooms_on_amenity_id"
    t.index ["room_id"], name: "index_amenties_rooms_on_room_id"
  end

  create_table "bath_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expences_rooms", force: :cascade do |t|
    t.bigint "expence_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expence_id"], name: "index_expences_rooms_on_expence_id"
    t.index ["room_id"], name: "index_expences_rooms_on_room_id"
  end

  create_table "furnishing_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "policies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "policies_rooms", force: :cascade do |t|
    t.bigint "policy_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["policy_id"], name: "index_policies_rooms_on_policy_id"
    t.index ["room_id"], name: "index_policies_rooms_on_room_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.bigint "property_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "sqr_ft"
    t.integer "rent"
    t.integer "deposit"
    t.boolean "current_status"
    t.integer "no_of_beds"
    t.bigint "furnishing_type_id"
    t.bigint "bath_type_id"
    t.bigint "property_id"
    t.bigint "sharing_type_id"
    t.bigint "tenant_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bath_type_id"], name: "index_rooms_on_bath_type_id"
    t.index ["furnishing_type_id"], name: "index_rooms_on_furnishing_type_id"
    t.index ["property_id"], name: "index_rooms_on_property_id"
    t.index ["sharing_type_id"], name: "index_rooms_on_sharing_type_id"
    t.index ["tenant_type_id"], name: "index_rooms_on_tenant_type_id"
  end

  create_table "rooms_users", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_rooms_users_on_room_id"
    t.index ["user_id"], name: "index_rooms_users_on_user_id"
  end

  create_table "sharing_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenant_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "primary_contact"
    t.string "secondary_contact"
    t.string "gender"
    t.bigint "role_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
