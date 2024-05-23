class AddColumnsInBlogs < ActiveRecord::Migration[7.1]
  def change

    add_column :users, :thumbnail, :binary
    add_column :users, :view_count, :integer
    add_column :users, :share_link, :string
  end
end
