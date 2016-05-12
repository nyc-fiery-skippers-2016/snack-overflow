class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true
  validates :email, uniqueness: true
  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  

end
