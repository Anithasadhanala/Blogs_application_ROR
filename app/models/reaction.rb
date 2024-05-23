class Reaction < ApplicationRecord
    has_many :comment_reactions, dependent: :destroy
    has_many :blog_user_reactions, dependent: :destroy
    has_many :reply_reactions, dependent: :destroy
  
    validates :name, presence: true
  end
  