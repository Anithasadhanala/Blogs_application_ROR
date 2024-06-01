class CreateUserBlogFlags < ActiveRecord::Migration[7.1]
  def change
    create_table :user_blog_flags do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blog, null: false, foreign_key: true
      t.boolean :flag

      t.timestamps
    end
  end
end
