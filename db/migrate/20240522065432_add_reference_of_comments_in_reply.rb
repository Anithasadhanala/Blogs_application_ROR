class AddReferenceOfCommentsInReply < ActiveRecord::Migration[7.1]
  def change
    add_reference :replies, :comments, foreign_key: true
  end
end
