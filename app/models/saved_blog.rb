class SavedBlog < ApplicationRecord
    belongs_to :user
    belongs_to :blog
  
    validates :started, presence: true
  end
  