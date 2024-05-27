class AddColumnToActiveSession < ActiveRecord::Migration[7.1]
  def change
    add_column :active_sessions, :active, :boolean
  end
end
