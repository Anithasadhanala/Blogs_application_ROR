class CreateActiveSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :active_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :session_id, null: false
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end
