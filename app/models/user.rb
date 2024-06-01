class User < ApplicationRecord
  has_secure_password


  has_many :blogs, dependent: :destroy
  has_many :blog_user_reactions, dependent: :destroy
  has_many :saved_blogs, dependent: :destroy
  has_many :active_sessions, dependent: :destroy
  has_many :blog_user_reaction, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 } 

  
  # username should not contain special chars validate
  validate :username_custom_validation_method

  private
  def username_custom_validation_method
    if username.present? && username.match?(/[^a-zA-Z0-9]/)
      errors.add(:username, 'should only contain letters and numbers')
    end
  end
  
end
