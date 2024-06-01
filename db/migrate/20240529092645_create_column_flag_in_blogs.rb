class CreateColumnFlagInBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :flagged, :boolean
    
  end
end
