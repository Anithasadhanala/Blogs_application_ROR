class CreateCommentReactions < ActiveRecord::Migration[7.1]
  def change
    create_table :comment_reactions do |t|

      t.timestamps
    end
  end
end
