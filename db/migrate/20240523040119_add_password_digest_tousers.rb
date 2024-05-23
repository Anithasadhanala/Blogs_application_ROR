class AddPasswordDigestTousers < ActiveRecord::Migration[7.1]
  def change

   add_column :users, :password_digest, :string
    remove_column :users, :password, :string # Remove the old password column if it exists
  end
end
