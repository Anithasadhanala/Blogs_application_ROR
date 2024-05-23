class DeleteColumnGenderInUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :gender, :string
  end

end
