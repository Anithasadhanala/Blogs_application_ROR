class Comment < ApplicationRecord
    belongs_to :blog
    has_many :comment_reactions, dependent: :destroy
    has_many :replies, dependent: :destroy
  
    validates :description, presence: true
end
  