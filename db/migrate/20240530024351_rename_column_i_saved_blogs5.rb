class RenameColumnISavedBlogs5 < ActiveRecord::Migration[7.1]
  def change
    add_column :saved_blogs, :starred, :boolean
  end
end
