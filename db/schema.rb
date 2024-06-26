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

ActiveRecord::Schema[7.1].define(version: 2024_05_30_052825) do
  create_table "active_sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "session_id", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.index ["user_id"], name: "index_active_sessions_on_user_id"
  end

  create_table "blog_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blogs_id"
    t.integer "tags_id"
    t.index ["blogs_id"], name: "index_blog_tags_on_blogs_id"
    t.index ["tags_id"], name: "index_blog_tags_on_tags_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.binary "thumbnail"
    t.integer "view_count"
    t.string "share_link"
    t.integer "category_id"
    t.index ["category_id"], name: "index_blogs_on_category_id"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_reactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_id"
    t.integer "reactions_id"
    t.index ["comments_id"], name: "index_comment_reactions_on_comments_id"
    t.index ["reactions_id"], name: "index_comment_reactions_on_reactions_id"
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blog_id"
    t.text "content"
    t.integer "user_id"
    t.index ["blog_id"], name: "index_comments_on_blog_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "replies", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_id"
    t.index ["comments_id"], name: "index_replies_on_comments_id"
  end

  create_table "reply_reactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "replies_id"
    t.integer "reactions_id"
    t.index ["reactions_id"], name: "index_reply_reactions_on_reactions_id"
    t.index ["replies_id"], name: "index_reply_reactions_on_replies_id"
  end

  create_table "saved_blogs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blog_id"
    t.integer "user_id"
    t.boolean "saved", default: true
    t.boolean "starred", default: false
    t.index ["blog_id"], name: "index_saved_blogs_on_blog_id"
    t.index ["user_id"], name: "index_saved_blogs_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_blog_flags", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "blog_id", null: false
    t.boolean "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_user_blog_flags_on_blog_id"
    t.index ["user_id"], name: "index_user_blog_flags_on_user_id"
  end

  create_table "user_blog_reaction", force: :cascade do |t|
    t.integer "user_id"
    t.integer "blog_id"
    t.integer "reaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_user_blog_reaction_on_blog_id"
    t.index ["reaction_id"], name: "index_user_blog_reaction_on_reaction_id"
    t.index ["user_id"], name: "index_user_blog_reaction_on_user_id"
  end

  create_table "user_blog_reactions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "blog_id"
    t.integer "reaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_user_blog_reactions_on_blog_id"
    t.index ["reaction_id"], name: "index_user_blog_reactions_on_reaction_id"
    t.index ["user_id"], name: "index_user_blog_reactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "active_sessions", "users"
  add_foreign_key "blog_tags", "blogs", column: "blogs_id"
  add_foreign_key "blog_tags", "tags", column: "tags_id"
  add_foreign_key "blogs", "categories"
  add_foreign_key "blogs", "users"
  add_foreign_key "comment_reactions", "comments", column: "comments_id"
  add_foreign_key "comment_reactions", "reactions", column: "reactions_id"
  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "users"
  add_foreign_key "replies", "comments", column: "comments_id"
  add_foreign_key "reply_reactions", "reactions", column: "reactions_id"
  add_foreign_key "reply_reactions", "replies", column: "replies_id"
  add_foreign_key "saved_blogs", "blogs"
  add_foreign_key "saved_blogs", "users"
  add_foreign_key "user_blog_flags", "blogs"
  add_foreign_key "user_blog_flags", "users"
  add_foreign_key "user_blog_reaction", "blogs"
  add_foreign_key "user_blog_reaction", "reactions"
  add_foreign_key "user_blog_reaction", "users"
  add_foreign_key "user_blog_reactions", "blogs"
  add_foreign_key "user_blog_reactions", "reactions"
  add_foreign_key "user_blog_reactions", "users"
end
