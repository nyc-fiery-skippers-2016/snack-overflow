class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true
  validates :email, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments
  
end
