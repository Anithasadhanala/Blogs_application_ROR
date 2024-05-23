class AddReferenceOfBlogsUsersReactionsInBlogUserReaction2 < ActiveRecord::Migration[7.1]
  def change
    add_reference :blog_user_reactions, :blogs, foreign_key: true
    add_reference :blog_user_reactions, :users, foreign_key: true
    add_reference :blog_user_reactions, :reactions, foreign_key: true

  end
end
