class AddReferenceOfCommentReactionInCommentReaction < ActiveRecord::Migration[7.1]
  def change
    add_reference :comment_reactions, :comments, foreign_key: true
    add_reference :comment_reactions, :reactions, foreign_key: true
  end
end
