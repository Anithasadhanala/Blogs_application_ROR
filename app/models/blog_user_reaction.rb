class BlogUserReaction < ApplicationRecord
    belongs_to :blog
    belongs_to :user
    belongs_to :reaction
  end
  