class RenameColumnISavedBlogs4 < ActiveRecord::Migration[7.1]
  def change
    rename_column :saved_blogs, :star, :boolean
  end
end
