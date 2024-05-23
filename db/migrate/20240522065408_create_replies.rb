class CreateReplies < ActiveRecord::Migration[7.1]
  def change
    create_table :replies do |t|
      t.string :description

      t.timestamps
    end
  end
end
