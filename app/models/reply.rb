class Reply < ApplicationRecord
    belongs_to :comment
    has_many :reply_reactions, dependent: :destroy
  
    validates :description, presence: true
  end
  