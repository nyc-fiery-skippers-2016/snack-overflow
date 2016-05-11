class Question < ActiveRecord::Base

  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  has_many :comments
  has_many :tags, through: :question_tags

end

