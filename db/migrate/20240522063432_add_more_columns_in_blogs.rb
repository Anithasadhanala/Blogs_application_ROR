class AddMoreColumnsInBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :thumbnail, :binary
    add_column :blogs, :view_count, :integer
    add_column :blogs, :share_link, :string
  end
end
