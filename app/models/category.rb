class Category < ApplicationRecord
    has_many :blogs, dependent: :destroy
  
    validates :name, presence: true
  end
  