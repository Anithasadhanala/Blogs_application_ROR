class AddReferenceOfReplyReactionInReplyREction < ActiveRecord::Migration[7.1]
  def change
    add_reference :reply_reactions, :replies, foreign_key: true
    add_reference :reply_reactions, :reactions, foreign_key: true
  end
end
