class DeleteColumnsInUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :thumbnail, :binary
    remove_column :users, :view_count, :integer
    remove_column :users, :share_link, :string
  end
end
