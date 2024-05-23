class CommentReaction < ApplicationRecord
    belongs_to :comment
    belongs_to :reaction
  end
  