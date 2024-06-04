class UserBlogReaction < ApplicationRecord
    
belongs_to :user
belongs_to :blog
belongs_to :reaction


validate :unique_user_reaction

private

def unique_user_reaction
  if UserBlogReaction.exists?(user_id: user_id, blog_id: blog_id, reaction_id: reaction_id)
    errors.add(:base, 'User can react to a blog with a particular reaction only once')
  end
end
end
  