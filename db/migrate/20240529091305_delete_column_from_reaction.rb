class DeleteColumnFromReaction < ActiveRecord::Migration[7.1]
  def change
    remove_column :reactions, :flag, :string
  end
end
