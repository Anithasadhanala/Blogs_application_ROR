class RenameColumnISavedBlogs2 < ActiveRecord::Migration[7.1]
  def change
    rename_column :saved_blogs, :save, :saved
  end
end
