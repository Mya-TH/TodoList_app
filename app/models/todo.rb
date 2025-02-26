class Todo < ApplicationRecord
  validates :description, presence: true
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
