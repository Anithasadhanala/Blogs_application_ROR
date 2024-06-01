class Comment < ApplicationRecord
    belongs_to :blog
    belongs_to :user
    has_many :comment_reactions, dependent: :destroy
    has_many :replies, dependent: :destroy
  
    validates :content, presence: true
    validates :user_id, presence: true
    validates :blog_id, presence: true

end
  