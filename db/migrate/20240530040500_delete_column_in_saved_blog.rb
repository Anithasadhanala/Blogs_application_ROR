class DeleteColumnInSavedBlog < ActiveRecord::Migration[7.1]
  def change
    remove_column :saved_blogs, :boolean, :boolean
  end
end
