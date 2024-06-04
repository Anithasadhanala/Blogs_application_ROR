class Comment < ApplicationRecord
    belongs_to :blog
    belongs_to :user
    has_many :comment_reactions, dependent: :destroy
    has_many :replies, dependent: :destroy
  
    validates :content, presence: true
    validates :user_id, presence: true
    validates :blog_id, presence: true

    attr_accessor :current_user_id

    before_update :validate_comment_update
    before_destroy :validate_comment_update

    def validate_comment_update

        if Current.user.id.present? && self.user_id != Current.user.id
            errors.add(:user, "cannot update otherscomments")
            throw(:abort) # This will prevent the save operation
          end

    end




end
  