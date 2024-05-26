class ActiveSession < ApplicationRecord
  belongs_to :user


  validates :session_id, presence: true
  validates :expires_at, presence: true
end
