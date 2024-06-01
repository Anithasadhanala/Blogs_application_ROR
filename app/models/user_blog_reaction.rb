class UserBlogReaction < ApplicationRecord
    
belongs_to :user
  belongs_to :blog
  belongs_to :reaction
end
  