class DeleteColumnsFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :name, :string
    remove_column :comments, :description, :string
    add_column :comments, :content, :text
  end
end
