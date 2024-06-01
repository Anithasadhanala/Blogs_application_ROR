class ChangeColumnInSaved2 < ActiveRecord::Migration[7.1]
  def change
    rename_column :comments, :users_id, :user_id
    rename_column :comments, :blogs_id, :blog_id
  end
end
