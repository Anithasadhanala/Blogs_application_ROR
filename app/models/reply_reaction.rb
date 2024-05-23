class ReplyReaction < ApplicationRecord
    belongs_to :reply
    belongs_to :reaction
  end
  