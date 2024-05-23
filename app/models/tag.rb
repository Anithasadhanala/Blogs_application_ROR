class Tag < ApplicationRecord
    has_many :blog_tags, dependent: :destroy
  
    validates :name, presence: true
  end
  