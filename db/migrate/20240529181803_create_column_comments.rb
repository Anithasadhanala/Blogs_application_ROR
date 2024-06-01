class CreateColumnComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :users, foreign_key: true
  
  end
end
