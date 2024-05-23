class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :blog_tags, dependent: :destroy
  has_many :blog_user_reactions, dependent: :destroy
  has_many :saved_blogs, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
