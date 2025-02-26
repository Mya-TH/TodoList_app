class User < ApplicationRecord
  has_secure_password
  has_many :todos, dependent: :destroy  # This indicates that a User can have many Todos
  
  validates :username, presence: true, uniqueness: true
end
