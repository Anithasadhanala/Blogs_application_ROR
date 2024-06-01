class AddColumnInSavedBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :saved_blogs, :save, :boolean
  end
end
