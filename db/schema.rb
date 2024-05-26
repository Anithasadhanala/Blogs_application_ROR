
ActiveRecord::Schema[7.1].define(version: 2024_05_24_082926) do
  create_table "active_sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "session_id", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "blog_user_reactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blogs_id"
    t.integer "users_id"
    t.integer "reactions_id"
    t.index ["blogs_id"], name: "index_blog_user_reactions_on_blogs_id"
    t.index ["reactions_id"], name: "index_blog_user_reactions_on_reactions_id"
    t.index ["users_id"], name: "index_blog_user_reactions_on_users_id"
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
    t.integer "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blogs_id"
    t.index ["blogs_id"], name: "index_comments_on_blogs_id"
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
    t.boolean "starrted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blogs_id"
    t.integer "users_id"
    t.index ["blogs_id"], name: "index_saved_blogs_on_blogs_id"
    t.index ["users_id"], name: "index_saved_blogs_on_users_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  add_foreign_key "blog_user_reactions", "blogs", column: "blogs_id"
  add_foreign_key "blog_user_reactions", "reactions", column: "reactions_id"
  add_foreign_key "blog_user_reactions", "users", column: "users_id"
  add_foreign_key "blogs", "categories"
  add_foreign_key "blogs", "users"
  add_foreign_key "comment_reactions", "comments", column: "comments_id"
  add_foreign_key "comment_reactions", "reactions", column: "reactions_id"
  add_foreign_key "comments", "blogs", column: "blogs_id"
  add_foreign_key "replies", "comments", column: "comments_id"
  add_foreign_key "reply_reactions", "reactions", column: "reactions_id"
  add_foreign_key "reply_reactions", "replies", column: "replies_id"
  add_foreign_key "saved_blogs", "blogs", column: "blogs_id"
  add_foreign_key "saved_blogs", "users", column: "users_id"
end
