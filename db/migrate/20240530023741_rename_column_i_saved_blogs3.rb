class RenameColumnISavedBlogs3 < ActiveRecord::Migration[7.1]
  def change
    rename_column :saved_blogs, :starred, :star
  end
end
