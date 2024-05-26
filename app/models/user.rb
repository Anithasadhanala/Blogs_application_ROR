class User < ApplicationRecord
  has_secure_password


  has_many :blogs, dependent: :destroy
  has_many :blog_user_reactions, dependent: :destroy
  has_many :saved_blogs, dependent: :destroy
  has_many :active_sessions, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 } 

  
  
end
