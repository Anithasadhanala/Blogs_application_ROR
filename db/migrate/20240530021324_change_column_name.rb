class ChangeColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :saved_blogs, :starrted, :starred
  end
end
