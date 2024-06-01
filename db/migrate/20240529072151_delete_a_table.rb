class DeleteATable < ActiveRecord::Migration[7.1]
  def change
    drop_table :blog_user_reactions
  end
end
