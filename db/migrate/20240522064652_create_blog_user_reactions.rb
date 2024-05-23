class CreateBlogUserReactions < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_user_reactions do |t|

      t.timestamps
    end
  end
end
