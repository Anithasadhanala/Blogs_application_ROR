class CreateSavedBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :saved_blogs do |t|
      t.boolean :starrted

      t.timestamps
    end
  end
end
