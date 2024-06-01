class RenameColumnISavedBlogs < ActiveRecord::Migration[7.1]
  def change
    rename_column :saved_blogs, :blogs_id, :blog_id
    rename_column :saved_blogs, :users_id, :user_id
  end
end
