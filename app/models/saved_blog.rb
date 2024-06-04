class SavedBlog < ApplicationRecord
    belongs_to :user
    belongs_to :blog

    before_create :valid_user_to_save

    def valid_user_to_save
      puts(current_user.present?,self.user_id,current_user.id )
      if current_user.present? && self.user_id == current_user.id
        errors.add(:user, "cannot save their own blog post")
        throw(:abort) # This will prevent the save operation
      end
    end


end
  