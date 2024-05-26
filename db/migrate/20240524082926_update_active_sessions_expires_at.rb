class UpdateActiveSessionsExpiresAt < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE active_sessions 
      SET expires_at = datetime('now', '+1 month')
    SQL
  end

  def down
    # Optionally define a rollback method if needed
  end
end
