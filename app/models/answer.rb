class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :votes, as: :voteable


  validates :question_id, :user_id, :body presence: true

end