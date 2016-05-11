class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

  validates :user_id, :body, presence: true
end