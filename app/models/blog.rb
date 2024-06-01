class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  VALID_CHARACTERS_REGEX = /[^a-zA-Z0-9\s.,:':;"`&]/

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }, format: { without: VALID_CHARACTERS_REGEX, message: "only allows letters, numbers, spaces, and .,:':;\"`&" }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }, format: { without: VALID_CHARACTERS_REGEX, message: "only allows letters, numbers, spaces, and .,:':;\"`&" }

  validate :no_special_characters_in_title
  validate :no_special_characters_in_description



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
end
