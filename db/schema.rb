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

ActiveRecord::Schema.define(version: 20180928011003) do

  create_table "blocks", force: :cascade do |t|
    t.date "date"
    t.text "information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "micropost_id"
    t.string "picture"
    t.string "picture_cache"
    t.text "place"
  end

  create_table "chains", force: :cascade do |t|
    t.integer "micropost_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "contact"
    t.string "user_id"
    t.index ["micropost_id"], name: "index_chains_on_micropost_id"
  end

  create_table "deepchains", force: :cascade do |t|
    t.date "date"
    t.text "information"
    t.string "chainpicture"
    t.integer "chain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "place"
    t.index ["chain_id"], name: "index_deepchains_on_chain_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "introductions", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "affilitation"
    t.string "site"
    t.text "prefecture"
    t.index ["user_id"], name: "index_introductions_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "micropost_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["micropost_id"], name: "index_likes_on_micropost_id"
    t.index ["user_id", "micropost_id"], name: "index_likes_on_user_id_and_micropost_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "product"
    t.string "photo_cache"
    t.integer "likes_count", default: 0, null: false
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "notics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "notified_by_id"
    t.integer "micropost_id"
    t.string "notified_type"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "like_id"
    t.integer "relationship_id"
    t.index ["like_id"], name: "index_notics_on_like_id"
    t.index ["micropost_id"], name: "index_notics_on_micropost_id"
    t.index ["notified_by_id"], name: "index_notics_on_notified_by_id"
    t.index ["relationship_id"], name: "index_notics_on_relationship_id"
    t.index ["user_id"], name: "index_notics_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "thumbnail"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.boolean "accepted", default: false, null: false
    t.boolean "pay", default: false, null: false
    t.integer "qrcount"
    t.integer "qr", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
