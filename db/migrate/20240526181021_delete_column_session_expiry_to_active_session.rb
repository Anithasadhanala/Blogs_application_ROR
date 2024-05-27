class DeleteColumnSessionExpiryToActiveSession < ActiveRecord::Migration[7.1]
  def change
    remove_column :active_sessions, :session_expiry, :datetime
  end
end
