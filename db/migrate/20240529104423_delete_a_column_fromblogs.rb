class DeleteAColumnFromblogs < ActiveRecord::Migration[7.1]
  def change
    remove_column :blogs, :flagged, :boolean
  end
end
