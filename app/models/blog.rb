class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  has_many :user_blog_reactions, dependent: :destroy

  has_many :reactions, through: :user_blog_reactions

  VALID_CHARACTERS_REGEX = /[^a-zA-Z0-9\s.,:':;"`&]/

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }, format: { without: VALID_CHARACTERS_REGEX, message: "only allows letters, numbers, spaces, and .,:':;\"`&" }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }, format: { without: VALID_CHARACTERS_REGEX, message: "only allows letters, numbers, spaces, and .,:':;\"`&" }

  validate :no_special_characters_in_title
  validate :no_special_characters_in_description


  def reaction_count(reaction_id)
    user_blog_reactions.where(reaction_id: reaction_id).count
  end



  private
  def no_special_characters_in_title
    if title =~ VALID_CHARACTERS_REGEX
      errors.add(:title, "cannot contain special characters other than .,:':;\"`&")
    end
  end

  def no_special_characters_in_description
    if description =~ VALID_CHARACTERS_REGEX
      errors.add(:description, "cannot contain special characters other than .,:':;\"`&")
    end
  end

  

  before_update :validate_before_blog_update
  before_destroy :validate_before_blog_update


  # validates the user is allowed to edit or delete a blog
  def validate_before_blog_update
    if Current.user.id != self.user_id
      errors.add(:base, "You are not authorized to update this blog")
    end
  end


end
