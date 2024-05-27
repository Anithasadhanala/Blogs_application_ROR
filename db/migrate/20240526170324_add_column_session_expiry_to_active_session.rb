class AddColumnSessionExpiryToActiveSession < ActiveRecord::Migration[7.1]
  def change
    add_column :active_sessions, :session_expiry, :datetime
  end
end
