class ChangeCommentsNameType < ActiveRecord::Migration[7.1]
  def up
    change_column :comments, :name, :integer
  end 

  def down
    change_column :comments, :name, :string
  end 
end
