class AddCommentsColumnTag < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :tag, :string
  end
end
